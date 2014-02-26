`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Author:      Brandon Franzke
// Create Date: 2013-02-04
// Modified:      
// File Name:   ee201_clk_60Hz_tb.v 
// Description: 
//
//
// Revision: 		1.1
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module ee201_clk_60Hz_tb;

	// Inputs
	reg Clk;
	reg Reset;

	// Outputs
	wire Clk60;

	// Instantiate the Unit Under Test (UUT)
	ee201_clk_60Hz #(.WIDTH(32)) UUT (
		.Clk(Clk), 
		.Reset(Reset),
		.Clk60(Clk60)
	);

	initial begin
		// Initialize Inputs

		Clk = 0;
		Reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
		Reset = 1;
		#10;		
		Reset = 0;
		#10;
		
		// Add stimulus here

		// [none]
	end
	
	always begin #5; Clk = ~ Clk; end
      
endmodule


