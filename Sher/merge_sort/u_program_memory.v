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
module u_program_memory(ADDR,
								DOUT0,DOUT1,DOUT2,DOUT3,DOUT4,DOUT5,DOUT6,DOUT7,DOUT8,DOUT9,DOUT10,DOUT11,DOUT12);

	input [2:0] ADDR;
	
	output DOUT0;
	output DOUT1;
	output DOUT2;
	output DOUT3;
	output DOUT4;
	output DOUT5;
	output DOUT6;
	output DOUT7;
	output DOUT8;
	output DOUT9;
	output DOUT10;
	output DOUT11;
	output DOUT12;
	
	reg [12:0] data_out;
	
		 
   always @(ADDR)
	  begin  : u_program_memory_logic
         case (ADDR)
            4'b000:  data_out <= 12'b0000000001000;
            4'b001:  data_out <= 12'b0011010000000;
            4'b010:  data_out <= 12'b0100011010001;
            4'b011:  data_out <= 12'b0110110110101;
            4'b100:  data_out <= 12'b1011110000000;
            4'b101:  data_out <= 12'b0110010110101;
            4'b110:  data_out <= 12'b0101101010001;
            4'b111:  data_out <= 12'b1001110000010;
				default: data_out <= 12'bXXXXXXXXXXXXX;
         endcase	 
	  end
	  
	  assign {DOUT12, DOUT11, DOUT10, DOUT9, DOU8, DOUT7, DOUT6, DOUT5, DOUT4, DOUT3, DOUT2, DOUT1, DOUT0} = data_out;

endmodule