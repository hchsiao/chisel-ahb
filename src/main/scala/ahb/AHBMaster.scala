// See LICENSE for license details.

package ahb

import chisel3._

class AHBCPU extends Bundle {
  val valid = Output(Bool())
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

  // comb.
  io.backend.rdata := io.ahb.HRDATA
  io.ahb.HBUSREQx := io.backend.valid
  io.ahb.HADDR := io.backend.addr
  io.ahb.HWRITE := io.backend.write
  io.ahb.HSIZE := AHBParams.AHBSizeWord
  io.ahb.HTRANS := trans
  io.ahb.HLOCKx := false.B
  io.ahb.HWDATA := io.backend.wdata

  // FSM
  val idle = 0.U
  val granted = 1.U
  val addrStage = 2.U
  val dataStage = 3.U
  val state = Reg(UInt(2.W), init = idle)
  when(state === idle) {
    trans := AHBParams.AHBTransIdle 
  } .otherwise {
    trans := AHBParams.AHBTransNonseq
  }
  when(state === idle) {
    when(io.ahb.HGRANTx & io.backend.valid) {
      state := granted
    }
  } .elsewhen(state === granted) {
    when(io.ahb.HREADY) {
      state := addrStage
    }
  } .elsewhen(state === addrStage) {
    when(io.ahb.HREADY) {
      state := dataStage
    }
  } .otherwise {
    when(io.ahb.HGRANTx & io.backend.valid) {
      state := addrStage
    } .otherwise {
      state := idle
    }
  }

  ready4CPU := (state === dataStage) & io.ahb.HREADY
}
