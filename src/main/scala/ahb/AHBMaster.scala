// See LICENSE for license details.

package ahb

import chisel3._

class AHBCPU extends Bundle {
  val valid = Output(Bool())
  val stall = Output(Bool())
  val write = Output(Bool())
  val addr  = Output(UInt(AHBParams.AHBAddrBits))
  val wdata = Output(UInt(AHBParams.AHBDataBits))
  val ready = Input(Bool())
  val rdata = Input(UInt(AHBParams.AHBDataBits))
}

class AHBMaster extends Module {
  val io = IO(new Bundle {
    val ahb = Flipped(new AHBMasterPort)
    val backend = Flipped(new AHBCPU)
  })

  val trans = Wire(Bool())
  val ready4CPU = Wire(Bool())

  // latch
  val rdata_reg = Reg(UInt(AHBParams.AHBDataBits), init = 0.U, next = io.ahb.HRDATA)

  // FSM
  val idle = 0.U
  val addrStage = 1.U
  val dataStage = 2.U
  val handover = 3.U
  val state = Reg(UInt(2.W), init = idle)
  when(state === idle) {
    trans := AHBParams.AHBTransIdle 
  } .otherwise {
    trans := AHBParams.AHBTransNonseq
  }
  when(state === idle) {
    when(io.ahb.HGRANTx & io.backend.valid) {
      state := addrStage
    }
  } .elsewhen(state === addrStage) {
    when(io.ahb.HREADY & io.backend.valid) {
      state := dataStage
    }
  } .elsewhen(state === dataStage) {
    when(io.ahb.HGRANTx & io.backend.valid) {
      state := dataStage
    } .elsewhen(io.ahb.HGRANTx) {
      state := addrStage
    } .elsewhen(io.backend.stall) {
      state := handover
    } .otherwise {
      state := idle
    }
  } .otherwise { // handover
    when(!io.backend.stall) {
      state := idle
    }
  }

  // comb.
  io.backend.rdata := Mux(state === handover, rdata_reg, io.ahb.HRDATA)
  io.backend.ready := ready4CPU
  io.ahb.HBUSREQx := io.backend.valid
  io.ahb.HADDR := io.backend.addr
  io.ahb.HWRITE := io.backend.write
  io.ahb.HSIZE := AHBParams.AHBSizeWord
  io.ahb.HTRANS := trans
  io.ahb.HLOCKx := false.B
  io.ahb.HWDATA := io.backend.wdata

  ready4CPU := ((state === dataStage) & io.ahb.HREADY) | (state === handover)
}
