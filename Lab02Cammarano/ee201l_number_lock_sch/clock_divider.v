`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module clock_divider(clk, reset, div_clk);
    input clk;
    input reset;
    output [25:0] div_clk;
	 reg [25:0] div_clk ;
	 
	 always @ (posedge clk or posedge reset)
		begin
			if (reset)
				div_clk 	<= 0;
			else
				div_clk  	<= div_clk  + 1;
			end
endmodule
