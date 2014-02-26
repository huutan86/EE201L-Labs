//////////////////////////////////////////////////////////////////////////////////
// Author:      Brandon Franzke
// Create Date: 2013-02-04
// Modified:      
// File Name:   ee201_roller.v 
// Description: 
//
//
// Revision: 		1.1
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module ee201_roller(Clk, Reset, NewX, X);	

	/*  INPUTS */
	// Clock & Reset
	input		Clk, Reset;
	input		NewX;
	
	/**
	TODO: update NUMBINS and WIDTH as needed to change random size
	
	NUMBINS:
		currently roll 1D20 (20-sided die = 0-19)	
	WIDTH:
		to store 19 (NUMBINS-1) requires 5 bit counter
	**/
	localparam
		//NUMBINS 	=  19,
		//WIDTH		=  5;
		//NUMBINS = 5,
		//WIDTH = 3;
		NUMBINS = 5,
		WIDTH = 1;

	
	reg [WIDTH-1:0] FastCount;
	
	/*  OUTPUTS */
	output [WIDTH-1:0] X;	
	
	reg  [WIDTH-1:0] X1, X2;
	wire GetWeighted;
	assign X = (GetWeighted) ? X2 : X1;
	
	
	assign GetWeighted = 1;
	
	/** PART II
	// TODO: 
	//  1. set X2 values (0 for heads, 1 for tails) for 20/80 unfair coin
	//  2. change GetWeighted = 1

	**/
	
	always @ (*)
	 begin : WEIGHTER
  	   case(X1)
  	     4'd0: 		X2 = 0;   // 20%
  	     4'd1: 		X2 = 1;   // 20%
  	     4'd2: 		X2 = 1;   // 20%
  	     4'd3: 		X2 = 1;   // 20%
  	     4'd4: 		X2 = 1;   // 20%
		 default: 	X2 = 1'bX;
	   endcase
	 end
	
	
	always @ (posedge Clk, posedge Reset)
	begin : BIN_COUNTER
		if(Reset)
			begin
				/**
				TODO: reset all the registers
				/**

				/* */
				X1 <= 0;
				FastCount <= 0;
			end
		else
		  begin
		    /**
		    TODO: fix
		    FastCount should reset if FastCount reaches NUMBINS-1, else it should increment
		    **/
		    FastCount <= (FastCount == NUMBINS-1) ? (0) : (FastCount + 1'b1); 
  		    if(NewX)
  		    	begin
					/**
					TODO: save X so that the number remains available 
					after counter changes next clock
					**/
					
					/* */
					//X1 <= FastCount;
					//FastCount <= NewX;
					X1 <= FastCount;
  		    	end
		  end
	end
	
endmodule
