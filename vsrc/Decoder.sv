//================================================
// Auther:      Hsieh Hsien-Hua (Henry)
// Filename:    Decoder.sv
// Description: Decode which slave to select
// Version:     1.0
//================================================

module Decoder(
  input [`AHB_ADDR_BITS-1:0] HADDR,
  output logic HSELDefault,
  output logic HSEL_S1,
  output logic HSEL_S2
);

  always_comb
  begin
    HSELDefault = /* complete by yourself */;
    HSEL_S1 = /* complete by yourself */;
    HSEL_S2 = /* complete by yourself */;
  end
endmodule
