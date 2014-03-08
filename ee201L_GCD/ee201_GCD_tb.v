//////////////////////////////////////////////////////////////////////////////////
// Author:			Shideh Shahidi, Bilal Zafar, Gandhi Puvvada
// Create Date:   02/25/08, 10/13/08
// File Name:		ee201_GCD_tb.v 
// Description: 
//
//
// Revision: 		2.1
// Additional Comments:  
// 10/13/2008 Clock Enable (CEN) has been added by Gandhi
// 3/1/2010 Signal names are changed in line with the divider_verilog design
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module ee201_GCD_CEN_tb_v;

	// Inputs
	reg Clk, CEN;
	reg Reset;
	reg Start;
	reg Ack;
	reg [7:0] Ain;
	reg [7:0] Bin;

	// Outputs
	wire [7:0] A, B, AB_GCD, i_count;
	wire q_I;
	wire q_Sub;
	wire q_Mult;
	wire q_Done;
	reg [6*8:0] state_string; // 6-character string for symbolic display of state
	
	// Instantiate the Unit Under Test (UUT)
	ee201_GCD uut (
		.Clk(Clk), 
		.CEN(CEN),
		.Reset(Reset), 
		.Start(Start), 
		.Ack(Ack), 
		.Ain(Ain), 
		.Bin(Bin), 
		.A(A),
		.B(B),
		.AB_GCD(AB_GCD), 
		.i_count(i_count),
		.q_I(q_I), 
		.q_Sub(q_Sub), 
		.q_Mult(q_Mult), 
		.q_Done(q_Done)
	);
		
		initial 
		  begin
			Clk = 0; // Initialize clock
		  end
		
		always  begin #10; Clk = ~ Clk; end
		
		initial begin
		// Initialize Inputs
		Clk = 0;
		CEN = 1; // ****** in Part 2 ******
				 // Here, in Part 1, we are enabling clock permanently by making CEN a '1' constantly.
				 // In Part 2, your TOP design provides single-stepping through SCEN control.
				 // We are not planning to write a testbench for the part 2 design. However, if we were 
				 // to write one, we will remove this line, and make CEN enabled and disabled to test 
				 // single stepping.
				 // One of the things you make sure in your core design (DUT) is that when state 
				 // transitions are stopped by making CEN = 0,
				 // the data transformations are also stopped.
		Reset = 0;
		Start = 0;
		Ack = 0;
		Ain = 0;
		Bin = 0;


		// Wait 100 ns for global reset to finish
		#103;

		// stimulus-1 GCD(36, 24)
		// Initialize Inputs
		Ain = 36;
		Bin = 24;
		#20;				
		
		// generate a reset pulse
		Reset = 1;
		#20;					
		Reset = 0;
		#20;					
		
		// generate a Start pulse
		Start = 1;
		#40;	
		Start = 0;
			
		#720;	// ****** TODO   ******
				// figure out the minimum delay amount	  
				// needed (in integral multiples of 20's) before acknowledging
				// for the data Ain = 36 and Bin = 24
				// note: Start is given for 2 clocks, though it is needed only 
				// for 1 clock.
		// generate and Ack pulse
		Ack = 1;
		#20;		
		Ack = 0;
		#20;					


		// stimulus-2 GCD(5, 15)
		// Initialize Inputs
		Ain = 5;
		Bin = 15;
		#20;					
		
		// generate a Reset pulse
		Reset = 1;
		#20;					
		Reset = 0;
		#20;					
		
		// generate a Start pulse
		Start = 1;
		#20;
		Start = 0;

			
		#300;	// ****** TODO ******
				// figure out the correct delay amount	    
				// needed before acknowledging
				// for the data Ain = 5 and Bin = 15			   
				// Suggest to your TA a better way to code
				// which works for all Ain and Bin 
		// generate and Ack pulse
		Ack = 1;
		#40;
		Ack = 0;
		#20;					


	end
	
	always @(*)
		begin
			case ({q_I, q_Sub, q_Mult, q_Done})    // Note the concatenation operator {}
				4'b1000: state_string = "q_I   ";  // ****** TODO ******
				4'b0100: state_string = " ";       // Fill-in the three lines


				endcase
		end
 
      
endmodule

