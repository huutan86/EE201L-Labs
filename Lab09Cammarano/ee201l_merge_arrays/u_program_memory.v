`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date:    20:42:20 03/26/2008 
// Design Name:    ee201l_merge_array
// Module Name:    u_program_memory 
// Description:    This is a 4-location deep, 2-bit wide ROM. 
// Comments: 
//            (1) Use this code as a template. Edit this code to create the 
//                Control ROM For the MCU of the desired depth and width. 
//            (2) Edit the contents and fill them with the micro-instructions. 
//            (3) Re-create the symbol (by selecting this Verilog file in the Source
//                pane and double-cliking "Create Schematic Symbol" under the "Design 
//                Utilities" in the Processes pane. 
//
//////////////////////////////////////////////////////////////////////////////////
module u_program_memory(ADDR, DOUT);

	input [2:0] ADDR;
	
	output [12:0] DOUT;
	
	reg [12:0] data_out;
	
		 
   always @(ADDR)
	  begin  : u_program_memory_logic
         case (ADDR)
				/*
            3'b000:  data_out <= 13'b0000000001000;
            3'b001:  data_out <= 13'b0011010000000;
            3'b010:  data_out <= 13'b0100011010001;
            3'b011:  data_out <= 13'b0110110110101;
				3'b100:  data_out <= 13'b1011110000000;
            3'b101:  data_out <= 13'b0110010110101;
            3'b110:  data_out <= 13'b0101101010001;
            3'b111:  data_out <= 13'b1001110000010;
				*/
				
				3'b000:  data_out <= 13'b0001000000000;
            3'b001:  data_out <= 13'b0000000101100;
            3'b010:  data_out <= 13'b1000101100010;
            3'b011:  data_out <= 13'b1010110110110;
				3'b100:  data_out <= 13'b0000000111101;
            3'b101:  data_out <= 13'b1010110100110;
            3'b110:  data_out <= 13'b1000101011010;
            3'b111:  data_out <= 13'b0100000111001;
            default: data_out <= 13'bXXXXXXXXXXXXX;
				
         endcase	 
	  end
	  
	  assign DOUT = data_out;

endmodule
