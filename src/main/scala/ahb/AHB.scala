// See LICENSE for license details.

package ahb

import chisel3._

object AHBParams{
  // Overall
  val AHBDataBits = 32.W
  val AHBAddrBits = 32.W

  // Trans
  val AHBTransBits = 2.W
  val AHBTransIdle = "b00".U
  val AHBTransBusy = "b01".U
  val AHBTransNonseq = "b10".U
  val AHBTransSeq = "b11".U

  // Burst
  val AHBBurstBits = 3.W
  val AHBBurstSingle = "b000".U
  val AHBBurstIncr = "b001".U
  val AHBBurstWrap4 = "b010".U
  val AHBBurstIncr4 = "b011".U
  val AHBBurstWrap8 = "b100".U
  val AHBBurstIncr8 = "b101".U
  val AHBBurstWrap16 = "b110".U
  val AHBBurstIncr16 = "b111".U

  // Size
  val AHBSizeBits = 3.W
  val AHBSizeByte = "b000".U
  val AHBSizeHword = "b001".U
  val AHBSizeWord = "b010".U
  val AHBSize2word = "b011".U
  val AHBSize4word = "b100".U
  val AHBSize8word = "b101".U
  val AHBSize16word = "b110".U
  val AHBSize32word = "b111".U

  // Prot
  val AHBProtBits = 4.W

  // Resp
  val AHBRespBits = 2.W
  val AHBRespOkay = "b00".U
  val AHBRespError = "b01".U
  val AHBRespRetry = "b10".U
  val AHBRespSplit = "b11".U

  // Master
  val AHBMasterBits = 4.W
  val AHBMasterLen = 3
  val AHBMaster0 = "b0000".U // Default
  val AHBMaster1 = "b0001".U
  val AHBMaster2 = "b0010".U

  // Slave
  val AHBSlaveLen = 3
  val AHBSlave0 = "b001".U // Default
  val AHBSlave1 = "b010".U
  val AHBSlave2 = "b100".U

  // Other
  val NumMaster = 2 // TODO: variable
  val NumSlave = 3 // TODO: variable
}

class AHBMasterPort extends Bundle {
  // Arbiter
  val HBUSREQx  = Input(Bool())
  val HLOCKx    = Input(Bool())
  val HGRANTx   = Output(Bool())

  // Trans
  val HTRANS   = Input(UInt(AHBParams.AHBTransBits))
  val HREADY   = Output(Bool())
  val HRESP    = Output(UInt(AHBParams.AHBRespBits))

  // Addr & Ctrl
  val HADDR    = Input(UInt(AHBParams.AHBAddrBits))
  val HWRITE   = Input(Bool())
  val HSIZE    = Input(UInt(AHBParams.AHBSizeBits))
  // TODO: HBURST
  // TODO: HPROT

  // Data
  val HWDATA   = Input(UInt(AHBParams.AHBDataBits))
  val HRDATA   = Output(UInt(AHBParams.AHBDataBits))
}

class AHBSlavePort extends Bundle {
  // Select
  val HSELx     = Output(Bool())

  // Trans
  val HREADYx   = Input(Bool())
  val HRESP     = Input(UInt(AHBParams.AHBRespBits))
  val HREADY    = Output(Bool())

  // Addr & Ctrl
  val HADDR     = Output(UInt(AHBParams.AHBAddrBits))
  val HWRITE    = Output(Bool())
  val HTRANS    = Output(UInt(AHBParams.AHBTransBits))
  val HSIZE     = Output(UInt(AHBParams.AHBSizeBits))
  // TODO: HBURST

  // Data
  val HWDATA    = Output(UInt(AHBParams.AHBDataBits))
  val HRDATA    = Input(UInt(AHBParams.AHBDataBits))

  // Split (TODO)
  val HMASTER   = Output(UInt(AHBParams.AHBMasterBits))
  val HMASTLOCK = Output(Bool())
}

class AHB extends Module {
  val io = IO(new Bundle {
    val master = Vec(AHBParams.NumMaster, new AHBMasterPort())
    val slave = Vec(AHBParams.NumSlave, new AHBSlavePort())
  })

  // Master w/ lower idx has higher priority, default master = #0
  def static_grant(i: Int): Bool = {
    var grant_raw = new Array[Bool](AHBParams.NumMaster)
    var no_grant = true.B
    for(i <- 0 to (AHBParams.NumMaster-1)) {
      if(i == 0)
        grant_raw(i) = io.master(i).HBUSREQx
      else
        grant_raw(i) = io.master(i).HBUSREQx & ~grant_raw(i-1)
      
      no_grant &= ~grant_raw(i)
    }
    if(i == 0)
      grant_raw(0) | no_grant
    else
      grant_raw(i)
  }

  val grant = Wire(Vec(AHBParams.NumMaster, Bool()))
  for(i <- 0 to (AHBParams.NumMaster-1)) {
    grant(i) := static_grant(i)
  }

  val granted_master = util.OHToUInt(grant)

  val abus_master = Reg(init = 0.U)
  val abus_slave = decode_slave()
  val dbus_master = Reg(init = 0.U)
  val dbus_slave = Reg(init = 0.U)
  val dbus_ready = io.slave(dbus_slave).HREADYx
  def decode_slave(): UInt = {
    val addr = io.master(abus_master).HADDR
    val slave = Wire(UInt(2.W)) // TODO: no magic
    when(addr < 5.U) {
      slave := 0.U
    } .elsewhen (addr < 10.U) {
      slave := 1.U
    } .otherwise {
      slave := 2.U
    }
    slave
  }
  when(dbus_ready) {
    abus_master := granted_master
    dbus_master := abus_master
    dbus_slave := abus_slave
  }

  for(i <- 0 to (AHBParams.NumMaster-1)) {
    io.master(i).HGRANTx := grant(i)
    io.master(i).HREADY  := io.slave(dbus_slave).HREADYx
    io.master(i).HRESP   := Output(UInt(AHBParams.AHBRespBits))
    io.master(i).HRDATA  := Output(UInt(AHBParams.AHBDataBits))
  }
  for(i <- 0 to (AHBParams.NumSlave-1)) {
    io.slave(i).HSELx     := Output(Bool())
    io.slave(i).HREADY    := io.slave(dbus_slave).HREADYx
    io.slave(i).HADDR     := Output(UInt(AHBParams.AHBAddrBits))
    io.slave(i).HWRITE    := Output(Bool())
    io.slave(i).HTRANS    := Output(UInt(AHBParams.AHBTransBits))
    io.slave(i).HSIZE     := Output(UInt(AHBParams.AHBSizeBits))
    io.slave(i).HWDATA    := Output(UInt(AHBParams.AHBDataBits))
    io.slave(i).HMASTER   := granted_master
    io.slave(i).HMASTLOCK := Output(Bool())
  }
}
