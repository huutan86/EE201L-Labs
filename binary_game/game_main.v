//////////////////////////////////////////////////////////////////////////////////
// Author:			Shideh Shahidi, Bilal Zafar, Gandhi Puvvada
// Create Date:   02/25/08, 10/13/08
// File Name:		ee201_GCD.v 
// Description: 
//
//
// Revision: 		2.1
// Additional Comments:  
// 10/13/2008 Clock Enable (CEN) has been added by Gandhi
//  3/1/2010  Signal names are changed in line with the divider_verilog design
//           `define is replaced by localparam construct
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module binary_game(


// Arguments


);

	/*  INPUTS */
	input	Clk, Reset, Start, Ack;		//Standard stuff
	
	//Other stuff (binary numbers(

	
	/*  OUTPUTS */

	// store current state
	output q_I, q_Sub, q_Mult, q_Done;		//!!! Modify the states !!!
	reg [3:0] state;								//!!! Modify the size !!!
	assign {q_Done, q_Mult, q_Sub, q_I} = state;		//!!! Modify the assign !!!
		
	localparam 	//!!! Modify the parameters
	I = 4'b0001, SUB = 4'b0010, MULT = 4'b0100, DONE = 4'b1000, UNK = 4'bXXXX;
	
	// NSL AND SM
	always @ (posedge Clk, posedge Reset)
	begin 
		if(Reset) begin
		
		//reset stuff
		
		end
		
		else
				case(state)		//!!! Complete !!!
					Case1:
					begin


					end		
					
					Case2: 
					begin
					
					end
	
					default:		
						state <= UNK;
				endcase
	end

	
endmodule
