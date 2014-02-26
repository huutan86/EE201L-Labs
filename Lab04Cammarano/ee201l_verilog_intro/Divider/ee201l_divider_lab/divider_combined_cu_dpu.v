// ----------------------------------------------------------------------
// 	A Verilog module for a simple divider
//
// 	Written by Gandhi Puvvada  Date: 7/17/98, 2/15/2008, 10/13/08, 2/21/2010
//
//      File name:  divider_combined_cu_dpu.v
// ------------------------------------------------------------------------
//	This is an improvement over divider.v
// We combined the two separate case statements in the divider.v
// into one single case statement.
// Notice the following lines added because of this combining
//	      X <= 4'bXXXX;        // to avoid recirculating mux controlled by Reset
//	      Y <= 4'bXXXX;	   // to avoid recirculating mux controlled by Reset 
//	      Quotient <= 4'bXXXX; // to avoid recirculating mux controlled by Reset
//
// We kept the module name same ("divider") as in divider.
// So, between divider.v and divider_combined_cu_dpu.v, the file, which was 
// mostly recently compiled in modelsim, will define the behavior of 
// the compiled module divider in modelsim (if you are simulating the testbench
// in a stand-alone modelsim simulation. In the Xilinx ISE, you need to add either
// the file  (divider_combined_cu_dpu.v) or the other file (divider.v).
// ------------------------------------------------------------------------
module divider (Xin, Yin, Start, Ack, Clk, Reset, 
				Done, Quotient, Remainder, Qi, Qc, Qd);

input [3:0] Xin, Yin;
input Start, Ack, Clk, Reset;
output Done;
output [3:0] Quotient, Remainder;
output Qi, Qc, Qd;

reg [3:0] Quotient;  // Remainder is a wire by default
reg [3:0] X, Y;
reg [2:0] state;

localparam
INITIAL = 3'b001,
COMPUTE	= 3'b010,
DONE_S	= 3'b100;

assign {Qd, Qc, Qi} = state;

always @(posedge Clk, posedge Reset) 

  begin  : CU_n_DU
    if (Reset)
       begin
        	state <= INITIAL;
	      X <= 4'bXXXX;        // to avoid recirculating mux controlled by Reset
	      Y <= 4'bXXXX;	   // to avoid recirculating mux controlled by Reset 
	      Quotient <= 4'bXXXX; // to avoid recirculating mux controlled by Reset
       end
    else
       begin
         (* full_case, parallel_case *)
         case (state)
	        INITIAL	: 
	          begin
		         // state transitions in the control unit
		         if (Start)
		           state <= COMPUTE;
		         // RTL operations in the Data Path 
		           X <= Xin;
		           Y <= Yin;
		           Quotient <= 0;
	          end
	        COMPUTE	:
	          begin
		         // state transitions in the control unit
		         if (X < Y)
		           state <= DONE_S;
		         // RTL operations in the Data Path 
		         if (!(X < Y))
		           begin
		             X <= X - Y;
		             Quotient <= Quotient + 1;
		           end
 	          end
	        DONE_S	:
	          begin  
		         // state transitions in the control unit
		         if (Ack)
		           state <= INITIAL;
		         // RTL operations in the Data Path 
		         // In DONE_S state, there are no RTL operations in the Data Path 
	          end    
      endcase
    end 
  end
 
assign Remainder = X;
assign Done = (state == DONE_S) ;

endmodule  // divider