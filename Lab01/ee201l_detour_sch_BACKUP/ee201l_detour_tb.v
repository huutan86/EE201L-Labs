// Verilog test fixture created from schematic C:\Xilinx_Projects\ee201l_detour_SOLUTION\ee201l_detour.sch - Wed Jan 30 21:42:46 2008

`timescale 1ns / 1ps

module ee201l_detour_ee201l_detour_sch_tb();

// Inputs
   reg RESET;
   reg CLK;
   reg LR_BAR;

// Output
   wire G1;
   wire G2;
   wire GR;
   wire GL;
   wire I;
   wire R1;
   wire R12;
   wire R123;
   wire L1;
   wire L12;
   wire L123;
	wire R;
	wire L;

// Bidirs

// Instantiate the UUT
   ee201l_detour UUT (
		.RESET(RESET), 
		.CLK(CLK), 
		.LR_BAR(LR_BAR), 
		.G1(G1), 
		.G2(G2), 
		.GR(GR), 
		.GL(GL), 
		.I(I), 
		.R1(R1), 
		.R12(R12), 
		.R123(R123), 
		.L1(L1), 
		.L12(L12), 
		.L123(L123),
		.R(R),
		.L(L)
   );
// Initialize Inputs
initial begin CLK = 0; end
always  begin #10; CLK = ~ CLK; end
initial begin RESET = 1; #22; RESET = 0; end
initial begin LR_BAR = 0; #100; LR_BAR = 1; #100; LR_BAR = 0; end

endmodule

