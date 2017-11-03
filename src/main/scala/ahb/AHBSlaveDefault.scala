// See LICENSE for license details.

package ahb

import chisel3._

class AHBSlaveDefault extends Module {
  val io = IO(Flipped(new AHBSlavePort))

  io.HREADYx := true.B
  io.HRESP   := AHBParams.AHBRespError
  io.HRDATA  := 0.U
}
