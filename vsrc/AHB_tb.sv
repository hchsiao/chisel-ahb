//================================================
// Auther:      Hsieh Hsien-Hua (Henry)
// Filename:    AHB_tb.sv
// Description: Testbench of AHB 
// Version:     1.0
//================================================

`timescale 1ns/10ps
`define PERIOD 10

`include "AHB_def.svh"
`include "AHB.sv"
`define S1_SELECTED 4'b0001
`define S2_SELECTED 4'b0010
`define S3_SELECTED 4'b0011

module AHB_tb;

  logic HCLK;
  logic HRESETn;
  // M1 inputs
  logic [`AHB_ADDR_BITS-1:0] HADDR_M1;
  logic [`AHB_TRANS_BITS-1:0] HTRANS_M1;
  logic HWRITE_M1;
  logic [`AHB_SIZE_BITS-1:0] HSIZE_M1;
  logic [`AHB_DATA_BITS-1:0] HWDATA_M1;
  logic HBUSREQ_M1;
  logic HLOCK_M1;
  // M2 inputs
  logic [`AHB_ADDR_BITS-1:0] HADDR_M2;
  logic [`AHB_TRANS_BITS-1:0] HTRANS_M2;
  logic HWRITE_M2;
  logic [`AHB_SIZE_BITS-1:0] HSIZE_M2;
  logic [`AHB_DATA_BITS-1:0] HWDATA_M2;
  logic HBUSREQ_M2;
  logic HLOCK_M2;
  // S1 inputs
  logic [`AHB_DATA_BITS-1:0] HRDATA_S1;
  logic HREADY_S1;
  logic [`AHB_RESP_BITS-1:0] HRESP_S1;
  // S2 inputs
  logic [`AHB_DATA_BITS-1:0] HRDATA_S2;
  logic HREADY_S2;
  logic [`AHB_RESP_BITS-1:0] HRESP_S2;
  // Master outputs
  logic [`AHB_DATA_BITS-1:0] HRDATA;
  logic HREADY;
  logic [`AHB_RESP_BITS-1:0] HRESP;
  logic HGRANT_M1;
  logic HGRANT_M2;
  // Slave outputs
  logic [`AHB_TRANS_BITS-1:0] HTRANS;
  logic [`AHB_ADDR_BITS-1:0] HADDR;
  logic HWRITE;
  logic [`AHB_SIZE_BITS-1:0] HSIZE;
  logic [`AHB_DATA_BITS-1:0] HWDATA;
  logic [`AHB_MASTER_BITS-1:0] HMASTER;
  logic HMASTLOCK;
  logic HSEL_S1;
  logic HSEL_S2;


  //--------------------------------------
  // AHB Module
  //--------------------------------------

  AHB AHB1(  
    .HCLK(HCLK),   
    .HRESETn(HRESETn),
    // M1 inputs
    .HADDR_M1(HADDR_M1),  
    .HTRANS_M1(HTRANS_M1), 
    .HWRITE_M1(HWRITE_M1), 
    .HSIZE_M1(HSIZE_M1),  
    .HWDATA_M1(HWDATA_M1), 
    .HBUSREQ_M1(HBUSREQ_M1),
    .HLOCK_M1(HLOCK_M1),  
    // M2 inputs
    .HADDR_M2(HADDR_M2),  
    .HTRANS_M2(HTRANS_M2), 
    .HWRITE_M2(HWRITE_M2), 
    .HSIZE_M2(HSIZE_M2),  
    .HWDATA_M2(HWDATA_M2), 
    .HBUSREQ_M2(HBUSREQ_M2),
    .HLOCK_M2(HLOCK_M2),  
    // S1 inputs
    .HRDATA_S1(HRDATA_S1),
    .HREADY_S1(HREADY_S1),
    .HRESP_S1(HRESP_S1),
    // S2 inputs
    .HRDATA_S2(HRDATA_S2),
    .HREADY_S2(HREADY_S2),
    .HRESP_S2(HRESP_S2),
    // Master outputs
    .HRDATA(HRDATA),
    .HREADY(HREADY),
    .HRESP(HRESP), 
    .HGRANT_M1(HGRANT_M1),
    .HGRANT_M2(HGRANT_M2),
    // Master outputs
    .HTRANS(HTRANS), // FIXME: no need output
    .HADDR(HADDR),
    .HWRITE(HWRITE),
    .HSIZE(HSIZE),
    .HWDATA(HWDATA),
    .HMASTER(HMASTER),
    .HMASTLOCK(HMASTLOCK),
    .HSEL_S1(HSEL_S1),  
    .HSEL_S2(HSEL_S2)  
  );

  //--------------------------------------
  // AHB Signals Initialization
  //--------------------------------------
  // HCLK
  always #(`PERIOD/2) HCLK = ~HCLK;
  // AHB Signals
  initial 
  begin
    HRESETn = 1;
    HCLK = 1;
    // Master specific signals
    // M1
    HADDR_M1 = 0;   
    HTRANS_M1 = 0;  
    HWRITE_M1 = 0;  
    HSIZE_M1 = 0;   
    HWDATA_M1 = 0;  
    HBUSREQ_M1 = 0; 
    HLOCK_M1 = 0;   
    // M2              
    HADDR_M2 = 0;   
    HTRANS_M2 = 0;  
    HWRITE_M2 = 0;  
    HSIZE_M2 = 0;   
    HWDATA_M2 = 0;  
    HBUSREQ_M2 = 0; 
    HLOCK_M2 = 0;   

    // Slave specific wire signals
    // S1
    HRDATA_S1 = 0; 
    HREADY_S1 = 1; 
    HRESP_S1 = 0;  
    // S2
    HRDATA_S2 = 0; 
    HREADY_S2 = 1; 
    HRESP_S2 = 0;  

    #(`PERIOD) HRESETn = 0;
    #(`PERIOD) HRESETn = 1;
  end

  //=================================//
  //    SystemVerilog Assertions     //
  //=================================//

  //================================//
  //             Master             //
  //================================//

  // HGRANT: Error of arbiter (HGRANT is asserted too late)
  property master_grant_check(BusreqA, GrantA, GrantB, Ready, Reset);
    @(posedge HCLK) disable iff (Reset)
    ((BusreqA && Ready) ##1 (!GrantB)) |-> (GrantA);
  endproperty
  // HGRANT: Error of arbiter (HGRANT is deasserted too early)
  property master_grant_check2(Busreq, Lock, Mastlock, Grant, Ready, Reset); // FIXME: 3-32 counter example?
    @(posedge HCLK) disable iff (Reset)
    (Grant && (Busreq || Lock || Mastlock) && Ready) |=> (Grant);
  endproperty
  // HBUSREQ: Error of master (HBUSREQ is deasserted too early)
  property master_busreq_check(Busreq, Grant, Reset); // Cannot give up REQ? e.g. Master trying resolve deadlock
    @(posedge HCLK) disable iff (Reset)
    (Busreq) ##1 (!Grant) |-> (Busreq);
  endproperty
  // HBUSREQ: Warning of master (HBUSREQ is deasserted too late)
  property master_busreq_check2(Busreq, Grant, Ready, Reset); // 3-32
    @(posedge HCLK) disable iff (Reset)
    (Grant && Ready) |=> (!Busreq);
  endproperty
  // HADDR: Error of master (HADDR is drived too early)
  property master_addr_check(Grant, Addr, Reset); // !Addr???
    @(posedge HCLK) disable iff (Reset)
    (!Grant) ##1 (Grant) |-> (!Addr);
  endproperty
  // HADDR: Warning of master (HADDR is drived too late)
  property master_addr_check2(Grant, Addr, Ready, Reset); // WTF (2 problems)
    @(posedge HCLK) disable iff (Reset)
    (!Grant) ##1 Ready[->0:1] ##0 Grant |=> (Addr);
  endproperty
  // HTRANS: Error of master (HTRANS is drived too early)
  property master_trans_check(Grant, Trans, Reset); // !Trans?
    @(posedge HCLK) disable iff (Reset)
    (!Grant) ##1 (Grant) |-> (!Trans);
  endproperty
  // HTRANS: Warning of master (HTRANS is drived too late)
  property master_trans_check2(Grant, Trans, Ready, Reset); // 666
    @(posedge HCLK) disable iff (Reset)
    (!Grant) ##1 Ready[->0:1] ##0 Grant |=> (Trans);
  endproperty
  // HBUSREQ: Info of master (Print master requests for bus)
  property master_request(busreqC, Reset); // mandatory?
    @(posedge HCLK) disable iff (Reset)
    (!busreqC) ##1 (busreqC) |-> (busreqC);
  endproperty

  // Master1
  Master1_trans: assert property(master_trans_check(HGRANT_M1, HTRANS_M1, (~HRESETn)))
  else 
    $error("%8d | HTRANS_M1 is drived too early.\n", $time);
  Master1_trans2: assert property(master_trans_check2(HGRANT_M1, HTRANS_M1, HREADY, (~HRESETn)))
  `ifndef noinfo
    $info("%8d | HTRANS_M1 is drived in time.\n", $time);
  `endif
  else 
    $warning("%8d | HTRANS_M1 is drived too late.\n", $time);
  Master1_addr: assert property(master_addr_check(HGRANT_M1, HADDR_M1, (~HRESETn)))
  else 
    $error("%8d | HADDR_M1 is drived too early.\n", $time);
  Master1_addr2: assert property(master_addr_check2(HGRANT_M1, HADDR_M1, HREADY, (~HRESETn)))
  `ifndef noinfo
    $info("%8d | HADDR_M1 is drived in time.\n", $time);
  `endif
  else 
    $warning("%8d | HADDR_M1 is drived too late.\n", $time); 
  Master1_busreq: assert property(master_busreq_check2(HBUSREQ_M1, HGRANT_M1, HREADY, (~HRESETn)))
  else
    $warning("%8d | Master1 is already granted the bus, HBUSREQ_M1 is deasserted too late.\n", $time); 
  Master1_busreq2: assert property(master_busreq_check(HBUSREQ_M1, HGRANT_M1, (~HRESETn)))
  `ifndef noinfo
    $info("%8d | Master1 isn't granted the bus, still requesting.\n", $time);
  `endif
  else
    $error("%8d | Master1 isn't granted the bus, HBUSREQ_M1 is deasserted too early.\n", $time); 
  Master1_grant: assert property(master_grant_check2(HBUSREQ_M1, HLOCK_M1, HMASTLOCK, HGRANT_M1, HREADY, (~HRESETn)))
  else 
    $error("%8d | HGRANT_M1 is deasserted too early.\n", $time); 
  Master1_grant2:assert property(master_grant_check(HBUSREQ_M1, HGRANT_M1, HGRANT_M2, HREADY, (~HRESETn)))
  `ifndef noinfo
    $info("%8d | HGRANT_M1 is asserted in time.\n", $time);
  `endif
  else 
    $error("%8d | HGRANT_M1 is asserted too late.\n", $time); 
  Master1_request: assert property(master_request(HBUSREQ_M1, (~HRESETn)))
  `ifndef noinfo
    $info("%8d | Master1 requests for bus.\n", $time); 
  `else
    ;
  `endif

  // Master2
  Master2_trans: assert property(master_trans_check(HGRANT_M2, HTRANS_M2, (~HRESETn)))
  else 
    $error("%8d | HTRANS_M2 is drived too early.\n", $time);
  Master2_trans2: assert property(master_trans_check2(HGRANT_M2, HTRANS_M2, HREADY, (~HRESETn)))
  `ifndef noinfo
    $info("%8d | HTRANS_M2 is drived in time.\n", $time);
  `endif
  else 
    $warning("%8d | HTRANS_M2 is drived too late.\n", $time);
  Master2_addr: assert property(master_addr_check(HGRANT_M2, HADDR_M2, (~HRESETn)))
  else 
    $error("%8d | HADDR_M2 is drived too early.\n", $time);
  Master2_addr2: assert property(master_addr_check2(HGRANT_M2, HADDR_M2, HREADY, (~HRESETn)))
  `ifndef noinfo
    $info("%8d | HADDR_M2 is drived in time.\n", $time);
  `endif
  else 
    $warning("%8d | HADDR_M2 is drived too late.\n", $time); 
  Master2_busreq: assert property(master_busreq_check2(HBUSREQ_M2, HGRANT_M2, HREADY, (~HRESETn)))
  else
    $warning("%8d | Master2 is already granted the bus, HBUSREQ_M2 is deasserted too late.\n", $time); 
  Master2_busreq2: assert property(master_busreq_check(HBUSREQ_M2, HGRANT_M2, (~HRESETn)))
  `ifndef noinfo
    $info("%8d | Master2 isn't granted the bus, still requesting.\n", $time);
  `endif
  else
    $error("%8d | Master2 isn't granted the bus, HBUSREQ_M2 is deasserted too early.\n", $time); 
  Master2_grant: assert property(master_grant_check2(HBUSREQ_M2, HLOCK_M2, HMASTLOCK, HGRANT_M2, HREADY, (~HRESETn)))
  else 
    $error("%8d | HGRANT_M2 is deasserted too early.\n", $time); 
  Master2_grant2:assert property(master_grant_check(HBUSREQ_M2, HGRANT_M2, HGRANT_M1, HREADY, (~HRESETn)))
  `ifndef noinfo
    $info("%8d | HGRANT_M2 is asserted in time.\n", $time);
  `endif
  else 
    $error("%8d | HGRANT_M2 is asserted too late.\n", $time); 
  Master2_request: assert property(master_request(HBUSREQ_M2, (~HRESETn)))
  `ifndef noinfo
    $info("%8d | Master2 requests for bus.\n", $time); 
  `else
    ;
  `endif

  //================================//
  //             Slave              //
  //================================//
  // HSEL: Info of slave (Print Slave being selected by master)
  property slave_select(Sel, Ready, Reset);
    @(posedge HCLK) disable iff (Reset)
    (!Sel) ##1 Ready[->0:1] ##1 (Sel) |-> (Sel);
  endproperty
  // HREADY: Error of slave (Slave should has 1 cycle wait state)
  property slave_ready_check(Sel, MUX_Ready, Ready, Reset); // 3-32
    @(posedge HCLK) disable iff (Reset)
    (!Sel) ##1 MUX_Ready[->0:1] ##1 (Sel) |=> (!Ready);
  endproperty

  // Slave1
  Slave1_select: assert property(slave_select(HSEL_S1, HREADY, (~HRESETn)))
  `ifndef noinfo
    $info("%8d | Slave1 is selected.\n", $time);
  `else
    ;
  `endif
  Slave1_ready: assert property(slave_ready_check(HSEL_S1, HREADY, HREADY_S1, (~HRESETn)))
  `ifndef noinfo
    $info("%8d | HREADY_S1 is driven low since Slave1 is selected.\n", $time);
  `endif
  else 
    $error("%8d | HREADY_S1 should be driven low once Slave1 is selected.\n", $time);
  // Slave2  
  Slave2_select: assert property(slave_select(HSEL_S2, HREADY, (~HRESETn)))
  `ifndef noinfo
    $info("%8d | Slave2 is selected.\n", $time);
  `else
    ;
  `endif
  Slave2_ready: assert property(slave_ready_check(HSEL_S2, HREADY, HREADY_S2, (~HRESETn)))
  `ifndef noinfo
    $info("%8d | HREADY_S2 is driven low since Slave1 is selected.\n", $time);
  `endif
  else 
    $error("%8d | HREADY_S2 should be driven low once Slave1 is selected.\n", $time);

  //--------------------------------------
  // AHB MASTER FUNCTION TEST
  //--------------------------------------  
  `ifdef test1
    // M1
    initial 
    begin
      #(`PERIOD*3) HBUSREQ_M1 = 1; HLOCK_M1 = 1;
      #(`PERIOD) HBUSREQ_M1 = 1;
      #(`PERIOD)
      HBUSREQ_M1 = 0;
      HADDR_M1 = {`S1_SELECTED,28'd4};
      HTRANS_M1 = `AHB_TRANS_NONSEQ;
      HWRITE_M1 = 1;
      HLOCK_M1 = 0;
      HWDATA_M1 = 0;
      #(`PERIOD)
      HBUSREQ_M1 = 0;
      HADDR_M1 = 0;
      HTRANS_M1 = `AHB_TRANS_IDLE;
      HWRITE_M1 = 1;
      HLOCK_M1 = 0;
      HWDATA_M1 = 7;
    end
    // M2
    initial
    begin
      #(`PERIOD*4) HBUSREQ_M2 = 1; HLOCK_M2 = 0;
      #(`PERIOD*3) HBUSREQ_M2 = 1;
      #(`PERIOD)
      HBUSREQ_M2 = 0;
      HADDR_M2 = {`S2_SELECTED,28'd8};
      HTRANS_M2 = `AHB_TRANS_NONSEQ;
      HWRITE_M2 = 1;
      HLOCK_M2 = 0;
      HWDATA_M2 = 0;
      #(`PERIOD)
      HBUSREQ_M2 = 0;
      HADDR_M2 = 0;
      HTRANS_M2 = `AHB_TRANS_IDLE;
      HWRITE_M2 = 1;
      HLOCK_M2 = 0;
      HWDATA_M2 = 8;
    end
    // AHB Signals SLAVE
    // S1
    initial 
    begin
      #(`PERIOD*4)
      HRDATA_S1 = 0; 
      HREADY_S1 = 1;
      HRESP_S1 = `AHB_RESP_OKAY;
    end
    // S2
    initial 
    begin
      #(`PERIOD*5)
      HRDATA_S2 = 0; 
      HREADY_S2 = 1; 
      HRESP_S2 = `AHB_RESP_OKAY;
    end
  `elsif test2
    // AHB Signals MASTER
    // M1
    initial 
    begin
      #1
      #(`PERIOD*3) HBUSREQ_M1 = 1; HLOCK_M1 = 0;
      #(`PERIOD) HBUSREQ_M1 = 1;
      #(`PERIOD)
      HBUSREQ_M1 = 0;
      HADDR_M1 = {`S1_SELECTED,28'd4};
      HTRANS_M1 = `AHB_TRANS_NONSEQ;
      HWRITE_M1 = 0;
      HLOCK_M1 = 0;
      HWDATA_M1 = 0;
      #(`PERIOD)
      HBUSREQ_M1 = 0;
      HADDR_M1 = 0;
      HTRANS_M1 = `AHB_TRANS_IDLE;
      HWRITE_M1 = 0;
      HLOCK_M1 = 0;
      HWDATA_M1 = 0;
    end
    // M2
    initial 
    begin
      #1
      #(`PERIOD*4) HBUSREQ_M2 = 1; HLOCK_M2 = 0;
      #(`PERIOD*3) HBUSREQ_M2 = 1;
      #(`PERIOD)
      HBUSREQ_M2 = 0;
      HADDR_M2 = {`S2_SELECTED,28'd8};
      HTRANS_M2 = `AHB_TRANS_NONSEQ;
      HWRITE_M2 = 0;
      HLOCK_M2 = 0;
      HWDATA_M2 = 0;
      #(`PERIOD)
      HBUSREQ_M2 = 0;
      HADDR_M2 = 0;
      HTRANS_M2 = `AHB_TRANS_IDLE;
      HWRITE_M2 = 0;
      HLOCK_M2 = 0;
      HWDATA_M2 = 0;
    end

    // AHB Signals SLAVE
    // S1
    initial 
    begin
      #1
      #(`PERIOD*5)
      HREADY_S1 = 1;
      #(`PERIOD)
      HRDATA_S1 = 7; 
      HREADY_S1 = 0; 
      HRESP_S1 = `AHB_RESP_OKAY;
      #(`PERIOD) HREADY_S1 = 1;
    end
    // S2
    initial 
    begin
      #1
      #(`PERIOD*9)
      HRDATA_S2 = 8; 
      HREADY_S2 = 0; 
      HRESP_S2 = `AHB_RESP_OKAY; 
      #(`PERIOD)
      HRDATA_S2 = 8; 
      HREADY_S2 = 1; 
      HRESP_S2 = `AHB_RESP_OKAY; 
    end
  `elsif test3

    //=================================//
    //    SystemVerilog Assertions     //
    //=================================//

    //================================//
    //             Master             //
    //================================//
    // You need to complete the assertions to meet AHB protocol
    // HMASTLOCK: Error of arbiter (HMASTLOCK isn't asserted in time)
    property master_mastlock_check(Lock, Grant, Ready, Mastlock, Reset);
      @(posedge HCLK) disable iff (Reset)
      /*
      * Complete this part by yourself.
      * The purpose of this assertion is notifying hardware designer that
      * your AHB didn't meet AHB protocal
      */
      (Grant && Lock && Ready) |=> Mastlock;
    endproperty

    // You need to connect proper signals to assertions
    // Master1
    Master1_mastlock: assert property(master_mastlock_check(HLOCK_M1, HGRANT_M1, HREADY, HMASTLOCK, ~HRESETn))
    `ifndef noinfo
      $info("%8d | HMASTLOCK is asserted in time.\n", $time);
    `endif
    else 
      $error("%8d | HMASTLOCK isn't asserted in time.\n", $time);

    // Master2
    Master2_mastlock: assert property(master_mastlock_check(HLOCK_M2, HGRANT_M2, HREADY, HMASTLOCK, ~HRESETn))
    `ifndef noinfo
      $info("%8d | HMASTLOCK is asserted in time.\n", $time);
    `endif
    else 
      $error("%8d | HMASTLOCK isn't asserted in time.\n", $time);

    //================================//
    //             Slave              //
    //================================//
    // You need to complete the assertions to meet AHB protocol
    // HRESP: Warning of slave (Print ERROR response of slave)
    property slave_resp(Sel, Resp, Reset); // cant do w/o hprot
      @(posedge HCLK) disable iff (Reset)
      /*
      * Complete this part by yourself.
      * The purpose of this assertion is notifying software programmer that
      * your program try to access the protected address or
      * unmapped address of this slave.
      */
    endproperty
    // HRESP: Warning of Default slave (Print ERROR response of slave)
    property default_slave_resp(SelA, SelB, Trans, Resp, Reset);
      @(posedge HCLK) disable iff (Reset)
      /*
      * Complete this part by yourself.
      * The purpose of this assertion is notifying software programmer that
      * your program try to access the default slave. Any read or
      * write action isn't permitted by default slave.
      */
      (!SelA) && (!SelB) |-> (Trans == `AHB_TRANS_IDLE);
    endproperty

    // You need to connect proper signals to assertions
    // Slave1
    Slave1_response: assert property(slave_resp(HSEL_S1, HRESP_S1, ~HRESETn))
    `ifndef noinfo
      $info("%8d | Slave1 responds normally.\n", $time);
    `endif
    else
      $error("%8d | Slave1 responds ERROR.\n", $time);
    // Slave2
    Slave2_response: assert property(slave_resp(HSEL_S2, HRESP_S2, ~HRESETn))
    `ifndef noinfo
      $info("%8d | Slave2 responds normally.\n", $time);
    `endif
    else
      $error("%8d | Slave2 responds ERROR.\n", $time);
    // Default Slave
    DefaultSlave_respones: assert property(default_slave_resp(HSEL_S1, HSEL_S2, HTRANS, HRESP, ~HRESETn))
    else
      $error("%8d | Default slave responds ERROR.\n", $time);

    // AHB Signals MASTER
    // M1
    initial 
    begin
      #1
      #(`PERIOD*3) HBUSREQ_M1 = 1; HLOCK_M1 = 0;
      #(`PERIOD) HBUSREQ_M1 = 1;
      #(`PERIOD)
      HBUSREQ_M1 = 0;
      HADDR_M1 = {`S3_SELECTED,28'd4};
      HTRANS_M1 = `AHB_TRANS_NONSEQ;
      HWRITE_M1 = 1;
      HLOCK_M1 = 0;
      HWDATA_M1 = 0;
      #(`PERIOD)
      HBUSREQ_M1 = 0;
      HADDR_M1 = 0;
      HTRANS_M1 = `AHB_TRANS_IDLE;
      HWRITE_M1 = 0;
      HLOCK_M1 = 0;
      HWDATA_M1 = 8;
      #(`PERIOD)
      HBUSREQ_M1 = 1;
      HADDR_M1 = 0;
      HTRANS_M1 = `AHB_TRANS_IDLE;
      HWRITE_M1 = 0;
      HLOCK_M1 = 0;
      HWDATA_M1 = 8;
      #(`PERIOD)
      HBUSREQ_M1 = 1;
      HADDR_M1 = 0;
      HTRANS_M1 = `AHB_TRANS_IDLE;
      HWRITE_M1 = 0;
      HLOCK_M1 = 0;
      HWDATA_M1 = 0;
      #(`PERIOD*7)
      HBUSREQ_M1 = 0;
      HADDR_M1 = {`S1_SELECTED,28'd4};
      HTRANS_M1 = `AHB_TRANS_NONSEQ;
      HWRITE_M1 = 1;
      HLOCK_M1 = 0;
      HWDATA_M1 = 0;
      #(`PERIOD)
      HBUSREQ_M1 = 0;
      HADDR_M1 = 0;
      HTRANS_M1 = `AHB_TRANS_IDLE;
      HWRITE_M1 = 0;
      HLOCK_M1 = 0;
      HWDATA_M1 = 8;
      #(`PERIOD*2)
      HBUSREQ_M1 = 0;
      HADDR_M1 = 0;
      HTRANS_M1 = `AHB_TRANS_IDLE;
      HWRITE_M1 = 0;
      HLOCK_M1 = 0;
      HWDATA_M1 = 0;
    end
    // M2
    initial 
    begin
      #1
      #(`PERIOD*3) HBUSREQ_M2 = 1; HLOCK_M2 = 1;
      #(`PERIOD*4) HBUSREQ_M2 = 1;
      #(`PERIOD)
      HBUSREQ_M2 = 0;
      HADDR_M2 = {`S3_SELECTED,28'd8};
      HTRANS_M2 = `AHB_TRANS_NONSEQ;
      HWRITE_M2 = 1;
      HLOCK_M2 = 0;
      HWDATA_M2 = 0;
      #(`PERIOD)
      HBUSREQ_M2 = 0;
      HADDR_M2 = 0;
      HTRANS_M2 = `AHB_TRANS_IDLE;
      HWRITE_M2 = 0;
      HLOCK_M2 = 0;
      HWDATA_M2 = 5;
      #(`PERIOD)
      HBUSREQ_M2 = 1;
      HADDR_M2 = 0;
      HTRANS_M2 = `AHB_TRANS_IDLE;
      HWRITE_M2 = 0;
      HLOCK_M2 = 1;
      HWDATA_M2 = 5;
      #(`PERIOD)
      HBUSREQ_M2 = 0;
      HADDR_M2 = {`S2_SELECTED,28'd8};
      HTRANS_M2 = `AHB_TRANS_IDLE;
      HWRITE_M2 = 1;
      HLOCK_M2 = 0;
      HWDATA_M2 = 0;
      #(`PERIOD)
      HBUSREQ_M2 = 0;
      HADDR_M2 = 0;
      HTRANS_M2 = `AHB_TRANS_IDLE;
      HWRITE_M2 = 0;
      HLOCK_M2 = 0;
      HWDATA_M2 = 5;
      #(`PERIOD*2)
      HBUSREQ_M2 = 0;
      HADDR_M2 = 0;
      HTRANS_M2 = `AHB_TRANS_IDLE;
      HWRITE_M2 = 0;
      HLOCK_M2 = 0;
      HWDATA_M2 = 0;
    end

    // AHB Signals SLAVE
    // S1
    initial 
    begin
      #1
      #(`PERIOD*5)
      HREADY_S1 = 1;
      #(`PERIOD)
      HRDATA_S1 = 0; 
      HREADY_S1 = 1; 
      HRESP_S1 = `AHB_RESP_OKAY;
      #(`PERIOD*10) HREADY_S1 = 0;
      #(`PERIOD) HREADY_S1 = 1;
    end
    // S2
    initial 
    begin
      #1
      #(`PERIOD*9)
      HRDATA_S2 = 0; 
      HREADY_S2 = 1; 
      HRESP_S2 = `AHB_RESP_OKAY; 
      #(`PERIOD)
      HRDATA_S2 = 0; 
      HREADY_S2 = 1; 
      HRESP_S2 = `AHB_RESP_OKAY; 
      #(`PERIOD*2)
      HRDATA_S2 = 0; 
      HREADY_S2 = 0; 
      HRESP_S2 = `AHB_RESP_OKAY; 
      #(`PERIOD)
      HRDATA_S2 = 0; 
      HREADY_S2 = 1; 
      HRESP_S2 = `AHB_RESP_OKAY; 
    end
  `endif

  //sim-time limit
  initial 
  begin
    #400 
    $finish;
  end

  initial 
  begin
    $fsdbDumpfile("AHB.fsdb");
    $fsdbDumpvars;
  end

endmodule
