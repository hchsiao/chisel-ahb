// See LICENSE for license details.

package ahb

import chisel3._

class AHBSystem extends Module {
  val io = IO(new Bundle {
    val icore = Flipped(new AHBCPU)
    val dcore = Flipped(new AHBCPU)
    val imem = Flipped(new AHBBackend)
    val dmem = Flipped(new AHBBackend)
  })

  val ahb = Module(new AHB)
  val defaultSlave = Module(new AHBSlaveDefault)
  val iSlave = Module(new AHBSlave)
  val dSlave = Module(new AHBSlave)
  val iMaster = Module(new AHBMaster)
  val dMaster = Module(new AHBMaster)

  defaultSlave.io <> ahb.io.slave(AHBParams.NumSlave)
  iSlave.io.ahb <> ahb.io.slave(0)
  dSlave.io.ahb <> ahb.io.slave(1)
  iMaster.io.ahb <> ahb.io.master(0)
  dMaster.io.ahb <> ahb.io.master(1)

  iSlave.io.backend <> io.imem
  dSlave.io.backend <> io.dmem
  iMaster.io.backend <> io.icore
  dMaster.io.backend <> io.dcore
}
