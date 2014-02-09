`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:15:10 02/07/2014 
// Design Name: 
// Module Name:    ee201_numlock_sm 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

// State machine module
module ee201_numlock_sm(Clk, reset, u, z, timerout, q_initial_state, q_g1get, q_g1, q_g10get, q_g10, q_g101get, q_g101, q_g1011get, q_g1011, q_opening, q_bad);
	
	// INPUTS
	input Clk, reset;	// System variables
	input u, z;			// Input variables
	
	// OUTPUTS
	output q_initial_state, q_g1get, q_g1, q_g10get, q_g10, q_g101get, q_g101, q_g1011get, q_g1011, q_opening, q_bad;
	reg [10:0] state;
	reg [4:0] Timerout_count;
	output reg timerout;
	
	// Assinging the states to the registers
	assign { q_bad, q_opening, q_g1011, q_g1011get, q_g101, q_g101get, q_g10, q_g10get, q_g1, q_g1get, q_initial_state } = state;
	
	// Assign each state a 1-hot value
	localparam
		initial_state = 11'b00000000001,
		g1get = 11'b00000000010,
		g1 = 11'b00000000100,
		g10get = 11'b00000001000,
		g10 = 11'b00000010000,
		g101get = 11'b00000100000,
		g101 = 11'b00001000000,
		g1011get = 11'b00010000000,
		g1011 = 11'b00100000000,
		opening = 11'b01000000000,
		bad = 11'b10000000000,
	   UNK = 11'bXXXXXXXXXXX;
	
	// Counter and Opening Timer
	always @ (posedge Clk, posedge reset)
	begin : TIMEROUT_COUNT
		if(reset) begin
			Timerout_count <= 0;
		end
			
		else begin
			Timerout_count <= Timerout_count + 1'b1;
		end
	end
	
	// NSL and State Machine
	always @ (posedge Clk, posedge reset) begin
		
		// Handling timerout
		if(Timerout_count == 4'b1111) begin
			timerout = 1;
		end
		
		else begin
			timerout = 0;
		end
		
		// Handling reset
		if(reset) begin
				state <= initial_state;
		end
			
		else begin
			case(state)
				initial_state:
					if(u & !z) begin
						// Move to next state
						state <= g1get;
					end
						
					else begin
						// Wait at the initial state
						state <= initial_state;
					end
						
				g1get:
					// Check to make sure we are not holding the button
					if(u) begin
						state <= g1get;
					end
					
					else begin
						state <= g1;
					end
						
				g1:
					if(!u & !z) begin
						state <= g1;
					end
					
					else if(u) begin
						state <= bad;
					end
					
					else begin
						state <= g10get;
					end
						
				g10get:
					if(z) begin
						state <= g10get;
					end
						
					else begin
						state <= g10;
					end
						
				g10:
					if(!u & !z) begin
						state <= g10;
					end
					
					else if(z) begin
						state <= bad;
					end
					
					else begin
						state <= g101get;
					end
						
				g101get:
					if(u) begin
						state <= g101get;
					end
						
					else begin
						state <= g101;
					end
					
				g101:
					if(!u & !z) begin
						state <= g101;
					end
					
					else if(z) begin
						state <= bad;
					end
						
					else begin
						state <= g1011get;
					end
						
				g1011get:
					if(u) begin
						state <= g1011get;
					end
					
					else begin
						state <= g1011;
					end
				
				g1011:
					state <= opening;
					
				opening:
					if(timerout) begin
						state <= initial_state;
					end
					
					else begin
						state <= opening;
					end
				
				bad:
					if(!u & !z) begin
						state <= initial_state;
					end
						
					else begin
						state <= bad;
					end
						
				default:
					state <= UNK;
		
			endcase
		end
	end
endmodule
