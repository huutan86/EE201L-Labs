`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:58:15 03/27/2008 
// Design Name: 
// Module Name:    array_R_RAM 
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
module array_R_RAM(clk,write_EN,input_data,read_addr,write_addr,Output);

 input clk;
 input write_EN;
 input [3:0] input_data;
 input [2:0] read_addr;
 input [2:0] write_addr;
 
 output [3:0] Output;
 
 reg [3:0] array_R [7:0]; // Array R to store the merged array with 8 elements

 always @ (posedge clk)
	 begin  : array_R_RAM_logic
		if (write_EN)
			begin
				array_R[write_addr] <= input_data;
			end
	 end
 
 assign Output = array_R[read_addr];
 
endmodule
