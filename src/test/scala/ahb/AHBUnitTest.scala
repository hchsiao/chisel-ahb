package ahb

import chisel3.iotesters
import chisel3.iotesters.{ChiselFlatSpec, Driver, PeekPokeTester}

class AHBUnitTester(c: AHB) extends PeekPokeTester(c) {
  // TODO: implement testbench
  //private val dut = c

}

class AHBTester extends ChiselFlatSpec {
  "generate verilog w/ vcd backend" should "create verilog files" in {
    assertThrows[AssertionError] { // AD-HOC: just want verilog, wont run vcs (since i dont have it)
      iotesters.Driver.execute(Array("--backend-name", "vcs"), () => new AHB) {
        c => new AHBUnitTester(c)
      }
    }
  }
}
