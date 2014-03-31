`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:47:14 03/27/2008 
// Design Name: 
// Module Name:    array_P_ROM 
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
module array_P_ROM(I,DOUT);
	
	input [1:0] I;
	output [3:0] DOUT;
	reg [3:0] DOUT;
 
   always @(I)
         case (I)
            2'b00: DOUT <= 1;
            2'b01: DOUT <= 9;
            2'b10: DOUT <= 10;
            2'b11: DOUT <= 12;
            default:  DOUT <= 4'bx;
         endcase	 

endmodule
