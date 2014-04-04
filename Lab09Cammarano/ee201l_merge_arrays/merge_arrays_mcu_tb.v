// Verilog test fixture (Revised Nov 2, 2008, 3/8/2012)
`timescale 1ns / 1ps

module merge_array_mcu_tb();

// Inputs
   reg sys_clk_tb;
   reg Start_tb;
   reg Ack_tb;
   reg Reset_tb;
   reg [2:0] array_R_Index;

// Output
	wire[3:0] array_R_Data;
	wire[2:0] UPC_OUT;
	wire done_tb;

// Instantiate the UUT
   merge_arrays_mcu UUT (
		.SYS_CLK(sys_clk_tb),
		.RESET(Reset_tb),		
		.START(Start_tb), 
		.ACK(Ack_tb), 
		.R_ADDR(array_R_Index), 
		.R_DATA(array_R_Data),
		.DONE (done_tb),
		.UPC_OUT(UPC_OUT)
   );
	
	
integer  Clk_cnt, L;

`define CLK_PERIOD 20

//CLK_GENERATOR
initial
  begin  : CLK_GENERATOR
    sys_clk_tb = 1;
    forever
       begin
	      #(`CLK_PERIOD /2) sys_clk_tb = ~sys_clk_tb;
       end 
  end

//RESET_GENERATOR
initial
  begin  : RESET_GENERATOR
    Reset_tb = 1'b1;
    #(`CLK_PERIOD * 5.1) Reset_tb = 1'b0;
  end

//CLK_COUNTER
initial
  begin  : CLK_COUNTER
    Clk_cnt = 0;
    forever
       begin
	      @(posedge sys_clk_tb) Clk_cnt = Clk_cnt + 1;
       end 
  end
  
// APPLYING STIMULUS
initial begin
		
		// Initialize Inputs
		Start_tb = 0; // Start_tb is "START"
		Ack_tb = 0; // Ack_tb is "ACK"
		array_R_Index = 3'b000;
		L = 0;
		
		while (Reset_tb == 1'b1) // Reset_tb is "RESET"
			@(posedge sys_clk_tb);
		# 1;
		
		Start_tb = 1; // Assert START
		@(posedge sys_clk_tb);
		#1;
		Start_tb = 0; // De-assert START

		wait (done_tb);	// wait till DONE goes active
		@(posedge sys_clk_tb); // wait one more cycle
		#1;
		
		// Check elements in array_R
		for (L = 0; L <= 7; L = L + 1)
		begin
			array_R_Index = L;
			@(posedge sys_clk_tb);
			#1;
		end	
		
		// Generate ACK signal
		@(posedge sys_clk_tb);
		#1;
		Ack_tb = 1;
		@(posedge sys_clk_tb);
		#1;
		Ack_tb = 0;
	
	end
endmodule
