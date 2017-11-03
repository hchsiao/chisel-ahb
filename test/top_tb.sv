`timescale 1ns/10ps
`define CYCLE 10
`include "top.sv"
`include "IM.sv"
`include "DM.sv"
module top_tb;

  logic clk;
  logic rst;
  logic IM_enable;
  logic [31:0] IM_address;
  logic DM_write;
  logic DM_enable;
  logic [31:0] DM_in;
  logic [31:0] DM_address;
  logic [31:0] IM_out;
  logic [31:0] DM_out;
  logic [31:0] GOLDEN[0:4095];
  integer gf,i;
  integer err;
  always #(`CYCLE/2) clk = ~clk;

  top TOP(
    .clk(clk),
    .rst(rst),
    .IM_out(IM_out),
    .DM_out(DM_out),
    .IM_enable(IM_enable),
    .IM_address(IM_address),
    .DM_write(DM_write),
    .DM_enable(DM_enable),
    .DM_in(DM_in),
    .DM_address(DM_address)
  );

  IM IM1(
    .clk(clk),
    .rst(rst),
    .IM_write(1'b0),
    .IM_enable(IM_enable),
    .IM_in(32'h0000_0000),
    .IM_address(IM_address[17:2]),
    .IM_out(IM_out)
  );


  DM DM1(
    .clk(clk),
    .rst(rst),
    .DM_write(DM_write),
    .DM_enable(DM_enable),
    .DM_in(DM_in),
    .DM_address(DM_address[17:2]),
    .DM_out(DM_out)
  );


  initial
  begin
    clk = 0; rst = 1;
    #(`CYCLE) rst = 0;
    `ifdef prog0
  		//verification default program
  		$readmemh("./prog0/IM_data.dat",IM1.mem_data);
  		$readmemh("./prog0/DM_data.dat",DM1.mem_data); 
			gf=$fopen("./prog0/golden.dat","r");
			i=0;
			while(!$feof(gf)) begin
				$fscanf(gf,"%d\n",GOLDEN[i]);
				i=i+1;
			end
			$fclose(gf);
      $display("Running prog0"); 
    `elsif prog1
  			$readmemh("./prog1/IM_data.dat",IM1.mem_data);
  			$readmemh("./prog1/DM_data.dat",DM1.mem_data);    
    `elsif prog2
  			$readmemh("./prog2/IM_data.dat",IM1.mem_data);
			$readmemh("./prog2/DM_data.dat",DM1.mem_data);   
    `elsif prog3
  			$readmemh("./prog3/IM_data.dat",IM1.mem_data);
			$readmemh("./prog3/DM_data.dat",DM1.mem_data);   
    `elsif prog4
  			$readmemh("./prog4/IM_data.dat",IM1.mem_data);
			$readmemh("./prog4/DM_data.dat",DM1.mem_data);   
    `elsif prog5
  			$readmemh("./prog5/IM_data.dat",IM1.mem_data);
			$readmemh("./prog5/DM_data.dat",DM1.mem_data);   
    `endif
    #(`CYCLE*10000)
    $display( "\nDone\n" );
    for (int i=0;i<10;i=i+1 ) 
    begin
      $display( "DM[%2d] = %h",i,DM1.mem_data[i]); 
    end
    err=0;
    `ifdef prog0
      for (int i=1;i<32;i=i+1 ) begin
        if (TOP.CPU1.RF1.mem[i]!=GOLDEN[i]) begin
          $display("register[%2d]=%d, expect=%d",i,TOP.CPU1.RF1.mem[i],GOLDEN[i]); 
          err=err+1;
        end
        else begin
          $display("register[%2d]=%d, pass",i,TOP.CPU1.RF1.mem[i]);
        end
      end
      result(err);
    `else
      for (int i=1;i<32;i=i+1) $display("register[%2d]=%d",i,TOP.CPU1.RF1.mem[i]);
      $display("");
      `ifdef prog2
        if (DM1.mem_data[3] != 32'h0000_009E) begin
          $display("DM[3]=%h, expect=0000_009E",DM1.mem_data[0]);
          err=err+1;
        end
        result(err);
      `elsif prog3
        if (DM1.mem_data[3] != 32'hFFFF_E019) begin
          $display("DM[3]=%h, expect=FFFF_E019",DM1.mem_data[0]);
          err=err+1;
        end
        result(err);
      `elsif prog4
        if (DM1.mem_data[3] != 32'hFFFF_E400) begin
          $display("DM[3]=%h, expect=FFFF_E400",DM1.mem_data[0]);
          err=err+1;
        end
        result(err);
      `elsif prog5
        if (DM1.mem_data[3] != 32'h0000_0010) begin
          $display("DM[3]=%h, expect=0000_0010",DM1.mem_data[0]);
          err=err+1;
        end
        if (DM1.mem_data[4] != 32'h0000_0006) begin
          $display("DM[4]=%h, expect=0000_0006",DM1.mem_data[1]);
          err=err+1;
        end
        result(err);
      `endif
    `endif
    $finish;
  end

  initial
  begin
    $fsdbDumpfile("top.fsdb");
    $fsdbDumpvars(0, top_tb);
    #1000000 $finish;
  end
  
  task result;
    input integer err;
    begin
      if(err==0) begin
        $display("\n");
        $display("\n");
        $display("        ****************************               ");
        $display("        **                        **       |\__||  ");
        $display("        **  Congratulations !!    **      / O.O  | ");
        $display("        **                        **    /_____   | ");
        $display("        **  Simulation PASS!!     **   /^ ^ ^ \\  |");
        $display("        **                        **  |^ ^ ^ ^ |w| ");
        $display("        *************** ************   \\m___m__|_|");
        $display("\n");
      end
      else begin
        $display("\n");
        $display("\n");
        $display("        ****************************               ");
        $display("        **                        **       |\__||  ");
        $display("        **  OOPS!!                **      / X,X  | ");
        $display("        **                        **    /_____   | ");
        $display("        **  Simulation Failed!!   **   /^ ^ ^ \\  |");
        $display("        **                        **  |^ ^ ^ ^ |w| ");
        $display("        *************** ************   \\m___m__|_|");
        $display("         Totally has %d errors                     ",err); 
        $display("\n");
      end
    end
  endtask
endmodule
