`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:53:11 03/27/2008 
// Design Name: 
// Module Name:    array_Q_ROM 
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
module array_Q_ROM(J,DOUT);
	
	input [1:0] J;
	output [3:0] DOUT;
	reg [3:0] DOUT;
 
   always @(J)
         case (J)
            2'b00: DOUT <= 2;
            2'b01: DOUT <= 3;
            2'b10: DOUT <= 4;
            2'b11: DOUT <= 5;
            default:  DOUT <= 4'bx;
         endcase	 

endmodule
