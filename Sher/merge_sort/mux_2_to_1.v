`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:54:12 03/27/2008 
// Design Name: 
// Module Name:    mux_2_to_1 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module mux_2_to_1(input_A,input_B,S,Output);
	 
	 input [3:0] input_A;
    input [3:0] input_B;
	 input S;
	 
    output [3:0] Output;
	 reg [3:0] Output;
	 
	 always @ (input_A,input_B,S)
	 begin  : mux_2_to_1_logic
		 case (S)
			1'b0: Output <= input_A;
			1'b1: Output <= input_B;
			default:  Output <= input_A;
		endcase	 
	 end
endmodule
