`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:05:33 04/22/2014 
// Design Name: 
// Module Name:    scores_ram 
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
module array_Scores_RAM(clk, write_EN, input_data, read_addr, write_addr, Output);

	input clk;
	input write_EN;
	input [7:0] input_data;
	input [3:0] read_addr;
	input [3:0] write_addr;
 
	output [7:0] Output;

	reg [7:0] array_Scores [15:0]; // Array R to store the merged array with 8 elements

	always @ (posedge clk) begin  : array_Scores_RAM_logic
		if (write_EN) begin
			array_Scores[write_addr] <= input_data;
		end
	end
 
	assign Output = array_Scores[read_addr];
 
endmodule
