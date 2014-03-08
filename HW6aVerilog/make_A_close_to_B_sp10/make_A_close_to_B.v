// EE201L RTL Exercises
// make_A_close_to_B.v
// Written by Suraj Abraham, Gandhi Puvvada 
// March 1, 2009, March 4, 2010

// Given two 12-bit unsigned numbers A and B where A < B, we increase A 
// by 100s and then decrease it by 10s, if needed, to bring it close to B, 
// but not greater than B

`timescale 1 ns / 100 ps

module make_A_close_to_B (Ain, Bin, Start, Ack, Clk, Reset, 
				Flag, Qi, Qc, Qd, A);

input [11:0] Ain, Bin;
input Start, Ack, Clk, Reset;
output Flag;  // Flag FF
output Qi, Qc, Qd;
output [11:0] A;

// Rest are wire by default
reg [11:0] A, B;
reg [2:0] state;
reg Flag;

localparam
INI	= 3'b001,
ADJ	= 3'b010,
DONE = 3'b100;

assign {Qd, Qc, Qi} = state;

always @(posedge Clk, posedge Reset) begin  : CU_n_DU

	if (Reset) begin
		state <= INI;
		A <= 12'bXXXXXXXXXXXX;        // to avoid recirculating mux controlled by Reset
		B <= 12'bXXXXXXXXXXXX;	    // to avoid recirculating mux controlled by Reset 
		Flag <= 1'bX;                 // to avoid ...
	end
	
	else begin
		(* full_case, parallel_case *)
		case (state)
			INI	: begin
					// state transitions in the control unit
					if (Start)
						state <= ADJ;
				
					// RTL operations in the Data Path 
					A <= Ain;
					B <= Bin;
					Flag <= 0;
			end
			
			ADJ	: begin // ** TODO **  complete RTL Operations and State Transitions
				// state transitions in the control unit
				// RTL operations in the Data Path 	
				
				if(A == B) begin
					state <= DONE;
				end
				
				else if(A < B && Flag) begin
					state <= DONE;
				end
				
				else begin
					if(A > B && Flag == 0) begin
						Flag <= 1'b1;
						A <= A - 10;
					end
					
					else if(A > B && Flag == 1) begin
						A <= A - 10;
					end
					
					else begin
						A <= A + 100;
					end
				end	           
			end
		
			DONE : begin  
				// state transitions in the control unit
				if (Ack)
					state <= INI;
			end   
			 
		endcase
	end 
end
 
endmodule  
