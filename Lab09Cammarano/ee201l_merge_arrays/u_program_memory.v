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
								DOUT0,DOUT1);

	input [1:0] ADDR;
	
	output DOUT0;
	output DOUT1;
	
	reg [1:0] data_out;
	
		 
   always @(ADDR)
	  begin  : u_program_memory_logic
         case (ADDR)
            2'b00:  data_out <= 2'b00;
            2'b01:  data_out <= 2'b00;
            2'b10:  data_out <= 2'b00;
            2'b11:  data_out <= 2'b00;
            default: data_out <= 2'bXX;
         endcase	 
	  end
	  
	  assign {DOUT1,DOUT0} = data_out;

endmodule