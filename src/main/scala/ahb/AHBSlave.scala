// See LICENSE for license details.

package ahb

import chisel3._

class AHBBackend extends Bundle {
  val cen = Input(Bool())
  val wen = Input(Bool())
  val A   = Input(UInt(AHBParams.AHBAddrBits))
  val D   = Input(UInt(AHBParams.AHBDataBits))
  val Q   = Output(UInt(AHBParams.AHBDataBits))
}

class AHBSlave extends Module {
  val io = IO(new Bundle {
    val ahb = Flipped(new AHBSlavePort)
    val backend = Flipped(new AHBBackend)
  })

  val cen = io.ahb.HREADY & io.ahb.HSELx
  val wen = io.ahb.HWRITE

  io.ahb.HREADYx := true.B
  io.ahb.HRESP   := AHBParams.AHBRespOkay
  io.ahb.HRDATA  := io.backend.Q
  io.backend.cen := cen
  io.backend.wen := wen
  io.backend.A   := io.ahb.HADDR
  io.backend.D   := io.ahb.HWDATA
}
