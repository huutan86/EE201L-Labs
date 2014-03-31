`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date:    04/01/2008, 03/09/2012
// Module Name:    counter_2bit 
// Project Name: 	 ee201l_merge_arrays
// Description:  	 This is a 2-bit loadable counter with count enable.
// 
// Comments:  
//          (1) Notice the use of parameter WIDTH. 
//          (2) Use this counter as template to create microprogram counter of 
//              appropriate width. 
//
//////////////////////////////////////////////////////////////////////////////////

module counter_2bit(CLK, RESET, COUNT_EN, LOAD_EN, LOAD_DATA, Q_OUT);

 parameter WIDTH = 2;
 
 input CLK, RESET, COUNT_EN, LOAD_EN;
 input  [WIDTH-1:0] LOAD_DATA;
 
 output [WIDTH-1:0] Q_OUT;
 reg 	  [WIDTH-1:0] Q_OUT;
 
 always @ (posedge CLK, posedge RESET)
	 begin  : counter_logic
		if (RESET)
			Q_OUT <= {WIDTH{1'b0}}; 
		else
			if(LOAD_EN)
				Q_OUT <= LOAD_DATA;
			else if (COUNT_EN)
				Q_OUT <= Q_OUT + 1;
			else 
				Q_OUT <= Q_OUT;
	 end

endmodule
