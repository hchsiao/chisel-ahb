`include "CPU.sv"

module top(
  input clk,
  input rst,
  input [31:0] IM_out,
  input [31:0] DM_out,
  output IM_enable,
  output [31:0] IM_address,
  output DM_write,
  output DM_enable,
  output [31:0] DM_in,
  output [31:0] DM_address
);
  // TOP IO
  //OUT
  wire [31:0] async_data_dw_addr;
  wire [31:0] async_data_dw_data;
  wire [3:0] async_data_dw_mask; // TODO: relavent?
  wire  async_data_dw_en;
  wire [31:0] async_data_dataInstr_0_addr;
  wire [31:0] async_data_dataInstr_1_addr;
  //IN
  wire [31:0] async_data_dataInstr_0_data;
  wire [31:0] async_data_dataInstr_1_data;
  // TOP IO

  // BUS
  wire        io_icore_valid = 1;
  wire        io_icore_ready;
  wire        io_dcore_valid;
  wire        io_dcore_ready;
  wire istall = io_icore_valid & (~io_icore_ready);
  wire dstall = io_dcore_valid & (~io_dcore_ready);
  wire [31:0] iaddr;
  assign IM_address = iaddr - 32'h80000000;
  AHBSystem ahb (
    .clock(clk),
    .reset(rst),
    .io_icore_valid(io_icore_valid),
    .io_icore_stall(istall | dstall),
    .io_icore_write(0),
    .io_icore_addr(async_data_dataInstr_1_addr),
    .io_icore_wdata(0),
    .io_icore_ready(io_icore_ready),
    .io_icore_rdata(async_data_dataInstr_1_data),
    .io_dcore_valid(io_dcore_valid),
    .io_dcore_stall(istall | dstall),
    .io_dcore_write(async_data_dw_en),
    .io_dcore_addr(async_data_dw_en ? async_data_dw_addr : async_data_dataInstr_0_addr),
    .io_dcore_wdata(async_data_dw_data),
    .io_dcore_ready(io_dcore_ready),
    .io_dcore_rdata(async_data_dataInstr_0_data),
    .io_imem_cen(IM_enable),
    .io_imem_wen(IM_write),
    .io_imem_A(iaddr),
    .io_imem_Q(IM_out),
    .io_dmem_cen(DM_enable),
    .io_dmem_wen(DM_write),
    .io_dmem_A(DM_address),
    .io_dmem_D(DM_in),
    .io_dmem_Q(DM_out)
  );
  // BUS

  // CPU IO
  wire [31:0] io_imem_req_bits_addr;
  wire [31:0] io_imem_resp_bits_data;
  wire        io_dmem_req_valid;
  assign io_dcore_valid = io_dmem_req_valid;
  wire [31:0] io_dmem_req_bits_addr;
  wire [31:0] io_dmem_req_bits_data;
  wire        io_dmem_req_bits_fcn;
  wire [2:0]  io_dmem_req_bits_typ;
  wire        io_dmem_resp_valid;
  wire [31:0] io_dmem_resp_bits_data;

  CPU CPU1(
    .clock(clk),
    .reset(rst),
    .stall(istall | dstall),
    .io_imem_req_bits_addr(io_imem_req_bits_addr),
    .io_imem_resp_bits_data(io_imem_resp_bits_data),
    .io_dmem_req_valid(io_dmem_req_valid),
    .io_dmem_req_bits_addr(io_dmem_req_bits_addr),
    .io_dmem_req_bits_data(io_dmem_req_bits_data),
    .io_dmem_req_bits_fcn(io_dmem_req_bits_fcn),
    .io_dmem_req_bits_typ(io_dmem_req_bits_typ),
    .io_dmem_resp_valid(io_dmem_resp_valid),
    .io_dmem_resp_bits_data(io_dmem_resp_bits_data)
  );
  // end CPU

  // MEM IO
  wire        io_core_ports_0_req_valid;
  wire [31:0] io_core_ports_0_req_bits_addr;
  wire [31:0] io_core_ports_0_req_bits_data;
  wire        io_core_ports_0_req_bits_fcn;
  wire [2:0]  io_core_ports_0_req_bits_typ;
  wire        io_core_ports_0_resp_valid;
  wire [31:0] io_core_ports_0_resp_bits_data;
  wire [31:0] io_core_ports_1_req_bits_addr;
  wire [31:0] io_core_ports_1_resp_bits_data;
  assign io_core_ports_0_req_valid = io_dmem_req_valid;
  assign io_core_ports_0_req_bits_addr = io_dmem_req_bits_addr;
  assign io_core_ports_0_req_bits_data = io_dmem_req_bits_data;
  assign io_core_ports_0_req_bits_fcn = io_dmem_req_bits_fcn;
  assign io_core_ports_0_req_bits_typ = io_dmem_req_bits_typ;
  assign io_core_ports_1_req_bits_addr = io_imem_req_bits_addr;
  assign io_imem_resp_bits_data = io_core_ports_1_resp_bits_data;
  assign io_dmem_resp_valid = io_core_ports_0_resp_valid;
  assign io_dmem_resp_bits_data = io_core_ports_0_resp_bits_data;

  wire  _T_197;
  wire  _T_198;
  wire [23:0] _T_202;
  wire [7:0] _T_203;
  wire [31:0] _T_204;
  wire  _T_205;
  wire  _T_206;
  wire [15:0] _T_210;
  wire [15:0] _T_211;
  wire [31:0] _T_212;
  wire  _T_213;
  wire [31:0] _T_220;
  wire  _T_221;
  wire [31:0] _T_228;
  wire [31:0] _T_229;
  wire [31:0] _T_230;
  wire [31:0] _T_231;
  wire [31:0] _T_232;
  wire [1:0] _T_239;
  wire [4:0] _GEN_6;
  wire [4:0] _T_240;
  wire [62:0] _GEN_7;
  wire [62:0] _T_241;
  wire [29:0] _T_242;
  wire [31:0] _T_244;
  wire [3:0] _T_248;
  wire [4:0] _T_252;
  wire [4:0] _T_254;
  wire [4:0] _T_255;
   
  assign _T_197 = io_core_ports_0_req_bits_typ == 3'h1;
  assign _T_198 = async_data_dataInstr_0_data[7];
  assign _T_202 = _T_198 ? 24'hffffff : 24'h0;
  assign _T_203 = async_data_dataInstr_0_data[7:0];
  assign _T_204 = {_T_202,_T_203};
  assign _T_205 = io_core_ports_0_req_bits_typ == 3'h2;
  assign _T_206 = async_data_dataInstr_0_data[15];
  assign _T_210 = _T_206 ? 16'hffff : 16'h0;
  assign _T_211 = async_data_dataInstr_0_data[15:0];
  assign _T_212 = {_T_210,_T_211};
  assign _T_213 = io_core_ports_0_req_bits_typ == 3'h5;
  assign _T_220 = {24'h0,_T_203};
  assign _T_221 = io_core_ports_0_req_bits_typ == 3'h6;
  assign _T_228 = {16'h0,_T_211};
  assign _T_229 = _T_221 ? _T_228 : async_data_dataInstr_0_data;
  assign _T_230 = _T_213 ? _T_220 : _T_229;
  assign _T_231 = _T_205 ? _T_212 : _T_230;
  assign _T_232 = _T_197 ? _T_204 : _T_231;
  assign _T_239 = io_core_ports_0_req_bits_addr[1:0];
  assign _GEN_6 = {{3'd0}, _T_239};
  assign _T_240 = _GEN_6 << 3;
  assign _GEN_7 = {{31'd0}, io_core_ports_0_req_bits_data};
  assign _T_241 = _GEN_7 << _T_240;
  assign _T_242 = io_core_ports_0_req_bits_addr[31:2];
  assign _T_244 = {_T_242,2'h0};
  assign _T_248 = 4'h1 << _T_239;
  assign _T_252 = 5'h3 << _T_239;
  assign _T_254 = _T_205 ? _T_252 : 5'hf;
  assign _T_255 = _T_197 ? {{1'd0}, _T_248} : _T_254;
  assign io_core_ports_0_resp_valid = io_core_ports_0_req_valid;
  assign io_core_ports_0_resp_bits_data = _T_232;
  assign io_core_ports_1_resp_bits_data = async_data_dataInstr_1_data;
  assign async_data_dw_addr = _T_244;
  assign async_data_dw_data = _T_241[31:0];
  assign async_data_dw_mask = _T_255[3:0];
  assign async_data_dw_en = io_core_ports_0_req_bits_fcn;
  assign async_data_dataInstr_0_addr = io_core_ports_0_req_bits_addr;
  assign async_data_dataInstr_1_addr = io_core_ports_1_req_bits_addr;
  // end MEM

endmodule
