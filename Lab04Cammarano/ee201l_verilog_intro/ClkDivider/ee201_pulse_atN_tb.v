`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Author:      Brandon Franzke
// Create Date: 2013-02-04
// Modified:      
// File Name:   ee201_pulse_atN_tb.v 
// Description: 
//
//
// Revision: 		1.0
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module ee201_pulse_atN_tb;

	// Inputs
	reg Clk;
	reg Reset;
	reg [31:0] N;

	// Outputs
	wire Pulse;

	// Instantiate the Unit Under Test (UUT)
	ee201_pulse_atN #(.WIDTH(8)) UUT (
		.Clk(Clk), 
		.Reset(Reset),
		.N(N),
		.Pulse(Pulse)
	);

	initial begin
		// Initialize Inputs

		Clk = 0;
		Reset = 0;
		N = 0;

		// Wait 100 ns for global reset to finish
		#100;
		Reset = 1;
		#10;		
		Reset = 0;
		#10;
		
		// Add stimulus here
		N = 5;
		#400;
		
		// Add stimulus here
		N = 2;
		#200;
		
		// Add stimulus here
		N = 20;
		#1400;		
	end
	
	always begin #5; Clk = ~ Clk; end
      
endmodule

