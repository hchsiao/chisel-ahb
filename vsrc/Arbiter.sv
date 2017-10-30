//================================================
// Auther:      Hsieh Hsien-Hua (Henry)
// Filename:    Arbiter.sv
// Description: Use Round-Robin to decide master 
//              priority
// Version:     1.0
//================================================
module Arbiter(
  input HCLK,
  input HRESETn,
  input [`AHB_TRANS_BITS-1:0] HTRANS,
  input HREADY,
  input [`AHB_RESP_BITS-1:0] HRESP,
  input HBUSREQ0,
  input HBUSREQ1,
  input HBUSREQ2,
  input HLOCK0,
  input HLOCK1,
  input HLOCK2,
  output logic HGRANT0,
  output logic HGRANT1,
  output logic HGRANT2,
  output logic [`AHB_MASTER_BITS-1:0] HMASTER,
  output logic HMASTLOCK
);

  logic [`AHB_MASTER_LEN-1:0] ReqMaster;
  logic [`AHB_MASTER_LEN-1:0] NextGrantMaster;
  logic [`AHB_MASTER_LEN-1:0] GrantMaster;
  logic [`AHB_MASTER_BITS-1:0] NextMaster;
  logic NextLock;
  logic StillReq;

  always_comb
  begin
    ReqMaster = {HBUSREQ2, HBUSREQ1, HBUSREQ0};
    {HGRANT2, HGRANT1, HGRANT0} = GrantMaster;
    StillReq = |(ReqMaster & GrantMaster);
  end

  always_comb // define NextGrantMaster
  begin
    /* complete this part by yourself */
  end

  always_ff@(posedge HCLK or negedge HRESETn)
  begin
    if (~HRESETn)
      GrantMaster <= #1 16'd0;
    else if (HREADY && (~HMASTLOCK) && (~NextLock) && (~StillReq))
      GrantMaster <= #1 NextGrantMaster;
  end

  always_comb
  begin
    case (GrantMaster)
      3'b001: 
      begin
        NextMaster = `AHB_MASTER_BITS'b0000;
        NextLock = HLOCK0;
      end
      3'b010:
      begin
        NextMaster = `AHB_MASTER_BITS'b0001;
        NextLock = HLOCK1;
      end
      3'b100:
      begin
        NextMaster = `AHB_MASTER_BITS'b0010;
        NextLock = HLOCK2;
      end
      default:
      begin
        NextMaster = `AHB_MASTER_BITS'b0000;
        NextLock = HLOCK0;
      end
    endcase
  end

  always_ff@(posedge HCLK or negedge HRESETn)
  begin
    if (~HRESETn)
      HMASTER <= #1 `AHB_MASTER_BITS'd0;
    else if (HREADY)
      HMASTER <= #1 NextMaster;
  end

  always_ff@(posedge HCLK or negedge HRESETn)
  begin
    if (~HRESETn)
      HMASTLOCK <= #1 1'b0;
    else if (HREADY)
      HMASTLOCK <= #1 NextLock;
  end
endmodule
