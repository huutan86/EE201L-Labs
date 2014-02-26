// Modified by Byeongju for EE201L lab Date: 2/2/2013
//
// Fill-in five 'TODO' blanks
// ----------------------------------------------------------------------
// 	A Verilog module for a simple divider
//
// 	Written by Gandhi Puvvada  Date: 7/17/98, 2/15/2008, 10/13/08, 2/21/2010
//
//      File name:  divider_separate_cu_dpu.v
// ------------------------------------------------------------------------

module divider (Xin, Yin, Start, Ack, Clk, Reset, 
				Done, Quotient, Remainder, Qi, Qc, Qd);

input [3:0] Xin, Yin;
input Start, Ack, Clk, Reset;
output Done;
output [3:0] Quotient, Remainder;
output Qi, Qc, Qd;

reg [3:0] Quotient;  // Remainder is a wire by default
reg [3:0] x, y;
reg [2:0] state;

localparam
INITIAL = 3'b001,
COMPUTE	= 3'b010,
DONE_S	= 3'b100;

assign {Qd, Qc, Qi} = state/* TODO #1 */;

always @(posedge Clk, posedge Reset) 

  begin  : CONTROL_UNIT
    if (Reset)
      begin
	     state <= INITIAL/* TODO#2 */;
	   end
    else
      begin
        (* full_case, parallel_case *)
        case (state)
	       INITIAL	: 
		      begin
		        if (Start)
		          state <= COMPUTE;
		      end
	       COMPUTE	:
		      begin
		      if (x <= y/* TODO#3 */)
		        state <= DONE_S;
		      end
	       DONE_S	:
		      begin
		      if (Ack)
		        state <= INITIAL;
		      end
        endcase
       end
    end // CONTROL_UNIT

always @(posedge Clk)

  begin  : DATA_PATH_UNIT
    (* full_case, parallel_case *)
    case (state)
	   INITIAL	: 
	     begin
		    x <= Xin;
		    y <= Yin;
		    Quotient <= 0;
	     end
	   COMPUTE	:
	     begin
		    if (x >= y/* TODO#4 */)
		      begin
		        x <= x - y;
		        Quotient <= Quotient + 1;
		      end
 	     end
	   DONE_S	:
	     begin  // it is best to have "begin"
	     end    // and "end" so that code can be added later
    endcase
  end // DATA_PATH_UNIT

assign Remainder = x;
assign Done = Quotient/* TODO#5 */ ;

endmodule  // divider