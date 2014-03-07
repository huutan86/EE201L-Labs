`timescale 1ns / 1ps

//----------------------------------------------------------------------------------
// Design Name:    Unsigned Matrix Multiplication C(m x p) = A(m x n)  * B(n x p) 
// File name: matrix_multiplication.v
// Module Name:    matrix_multiplication (Behavioral) 
// Written by Hoang Le and Gandhi Puvvada
// Date: 3/3/2009, 3/6/2010
//----------------------------------------------------------------------------------

module matrix_multiplication(clk, reset, start, ack, done);

	// Parameters
	parameter M_VALUE       = 4;
	parameter N_VALUE       = 4;
	parameter P_VALUE       = 4;
	parameter M_ADDRESS_WIDTH = 2;
	parameter N_ADDRESS_WIDTH = 2;
	parameter P_ADDRESS_WIDTH = 2;

	parameter DATA_WIDTH    = 4;
	
	// Inputs
	input clk, reset, start, ack;

	// Outputs
	output done;
    
	// Internal 2-dimentional registers acting as the A, B, C matrices
	reg  [DATA_WIDTH-1:0]   A[0:M_VALUE-1][0:N_VALUE-1];
	reg  [DATA_WIDTH-1:0]   B[0:N_VALUE-1][0:P_VALUE-1];
	reg  [(2*DATA_WIDTH + N_ADDRESS_WIDTH -1):0] C[0:M_VALUE-1][0:P_VALUE-1];
	
	reg  [M_ADDRESS_WIDTH-1:0] i; 
	reg  [N_ADDRESS_WIDTH-1:0] k; 
	reg  [P_ADDRESS_WIDTH-1:0] j; 
	
	integer index_m, index_n, index_p;
	
	reg  [2:0] state;
	wire q_init, q_compute, q_done;
	assign {q_done, q_compute, q_init} = state;
	
	localparam
	 QINIT     = 3'b001,
	 QCOMPUTE  = 3'b010,
	 QDONE     = 3'b100,
	 QUNK      = 3'bXXX;
	
	// State machine to control the computation
	always @(posedge clk, posedge reset)
		begin

			if (reset)
				begin
					state <= QINIT;
					// to avoid recirculating muxes, put 'bX in all data registers under reset
					{i, j, k} <= 'bX;
					for (index_m = 0; index_m <= M_VALUE - 1; index_m = index_m + 1) 
						for (index_p = 0; index_p <= P_VALUE -1; index_p = index_p + 1)
							C[index_m][index_p] <= 'bX;
				end	
			else
				case(state)
					QINIT:
						begin
							// RTL Operations
							{i, j, k} <= 0;
							// State Transitions
							if (start)
								begin
									state <= QCOMPUTE;
								end	
						end							
					QCOMPUTE:		// ** TODO **  complete RTL Operations and State Transitions
						begin
							// RTL Operations
							if (k == 0)
								C[i][j] <= A[i][k] * B[k][j];
							else
								C[i][j] <= C[i][j] + (A[i][k] * B[k][j]);
								















								
							// State Transitions

							
							
							
						end
						
					QDONE:
						// State Transitions
						begin
							if (ack)
								state <= QINIT;
						end
						
					default:
						state <= QUNK;
						
				endcase
		end
	
	
	// OFL
	assign done  = q_done;
	
endmodule
