module DM
  //#(parameter NUM_BYTES = (1 << 21),
  #(parameter NUM_BYTES = (1 << 16),
    parameter DATA_WIDTH = 32)
   (input clk,
    
  input rst,
  input DM_write,
  input DM_enable,
  input [31:0] DM_in,
  input [15:0] DM_address,
  output [31:0] DM_out
    );

   localparam ADDR_WIDTH = $clog2(NUM_BYTES);
   localparam MASK_WIDTH = DATA_WIDTH >> 3;

    //input [ADDR_WIDTH-1:0] hw_addr;
    //input [DATA_WIDTH-1:0] hw_data;
    //input [MASK_WIDTH-1:0] hw_mask;
    //input hw_en;

    //input [ADDR_WIDTH-1:0] hr_addr;
    //output [DATA_WIDTH-1:0] hr_data;
    wire [ADDR_WIDTH-1:0] dw_addr;
    wire [DATA_WIDTH-1:0] dw_data;
    wire [MASK_WIDTH-1:0] dw_mask;
    wire dw_en;

    wire [ADDR_WIDTH-1:0] dataInstr_0_addr;
    reg [DATA_WIDTH-1:0] dataInstr_0_data;
    wire [ADDR_WIDTH-1:0] dataInstr_1_addr;
    reg [DATA_WIDTH-1:0] dataInstr_1_data;

    assign dw_addr = DM_address;
    assign dw_data = DM_in;
    assign dw_mask = -1;
    assign dw_en = DM_write;

    assign dataInstr_0_addr = DM_address;
    //assign dataInstr_1_addr = IM_address;
    assign DM_out = dataInstr_0_data;
    //assign IM_out = dataInstr_1_data;

   //reg [7:0] 		mem [0:NUM_BYTES-1];
  logic [31:0] mem_data [0:65535];
   
  genvar i;
  generate
    for (i = 0; i < MASK_WIDTH; i = i + 1) begin : gen_sel_read
      always @ (posedge clk) begin
        //if (hw_en) begin
          //if (hw_mask[i] == 1'b1) begin
            //mem[hw_addr + i] <= hw_data[i*8 +: 8];
          //end
        //end
        if (dw_en) begin
          if (dw_mask[i] == 1'b1) begin
            mem_data[dw_addr][i*8 +: 8] <= dw_data[i*8 +: 8];
          end
        end
      end
      always @* begin
        //hr_data[i*8 +: 8] = mem[hr_addr + i];
        dataInstr_0_data[i*8 +: 8] = mem_data[dataInstr_0_addr][i*8 +: 8];
        dataInstr_1_data[i*8 +: 8] = mem_data[dataInstr_1_addr][i*8 +: 8];
      end
    end 
  endgenerate
   
endmodule // AsyncReadMem
