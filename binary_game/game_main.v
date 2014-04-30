//////////////////////////////////////////////////////////////////////////////////
// Author:			Colin "Studmuffin" Cammarano and Stephen "Studly" Sher
// Create Date:   02/25/08, 10/13/08
// File Name:		ee201_GCD.v 
// Description: 
//
//
// Revision: 		2.1
// Additional Comments:  
// 10/13/2008 Clock Enable (CEN) has been added by Gandhi
//  3/1/2010  Signal names are changed in line with the divider_verilog design
//           `define is replaced by localparam construct
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module binary_game(
	Clk,
	CEN,
	Reset,
	Select,
	Quit,
	selectRight,
	selectLeft,
	userNumber,
	outputNumber,
	playerScore,
	isWrong,
	q_Initial,
	q_MenuPlay,
	q_MenuPractice,
	q_MenuScores,
	q_MenuQuit,
	q_PlayInitial,
	q_Play,
	q_PlayDone,
	q_PracticeInitial,
	q_Practice,
	q_PracticeDone,
	q_Scores,
	q_Done
);

	/*  INPUTS  */
	input Clk, CEN, Reset;						// Standard stuff. In this case, reset can be BtnU
	input Select;									// Input for CENter "do everything" button.
	input Quit;										// Input for down button to end the game.
	input selectLeft, selectRight;			// Specific inputs for left and right buttons.
	input [7:0] userNumber;
	
	/*  OUTPUTS  */
	output reg [7:0] outputNumber;
	output reg [7:0] playerScore;
	output reg isWrong;
		
	/*  INTERMEDIATE STATE VARIABLES  */
	
	// Regs
	reg [7:0] generatedNumber;
	reg [7:0] fastCount;
	reg wrong;
	reg newNumber;
	
	/*  STATE MACHINE  */
	output q_Initial, q_MenuPlay, q_MenuPractice, q_MenuScores, q_MenuQuit, q_PlayInitial, q_Play, q_PlayDone, q_PracticeInitial, q_Practice, q_PracticeDone, q_Scores, q_Done;
	reg [12:0] state;
	assign { q_Done, q_Scores, q_PracticeDone, q_Practice, q_PracticeInitial, q_PlayDone, q_Play, q_PlayInitial, q_MenuQuit, q_MenuScores, q_MenuPractice, q_MenuPlay, q_Initial } = state;


	// Definitions for state labels. Concatanated for ease of reading.
	localparam
		Initial				= 13'b0000000000001,
		Menu_Play			= 13'b0000000000010,
		Menu_Practice		= 13'b0000000000100,
		Menu_Scores			= 13'b0000000001000,
		Menu_Quit			= 13'b0000000010000,
		Play_Initial		= 13'b0000000100000,
		Play					= 13'b0000001000000,
		Play_Done			= 13'b0000010000000,
		Practice_Initial	= 13'b0000100000000,
		Practice				= 13'b0001000000000,
		Practice_Done		= 13'b0010000000000,
		Scores				= 13'b0100000000000,
		Done					= 13'b1000000000000,
		UNK					= 13'bXXXXXXXXXXXXX;
	
	// Random number generator
	always @ (posedge Clk, posedge Reset) begin : BIN_COUNTER
		if(Reset) begin
			
			// Reset registers
			generatedNumber <= 0;
			fastCount <= 0;
		end
		
		else begin
			
			if(fastCount == 8'b11111111) begin
				fastCount <= 0;
			end
			
			else begin
				fastCount <= fastCount + 1'b1; 
			end
			
			// New number flag, called once
			if(newNumber) begin
				
				// Store our random number in the generated number register.
				generatedNumber <= fastCount;
			end
		end
	end
	
	// Assigning the value of wrong
	always @ (posedge Clk) begin : COMPARING_NUMBERS

		if(userNumber == outputNumber) begin
			wrong = 1'b0;
		end
		
		else begin
			wrong = 1'b1;
		end
		
		isWrong <= wrong;
	end
	
	
	// NSL AND SM
	always @ (posedge Clk, posedge Reset) begin : STATE_MACHINE
		
		if(Reset) begin
			// Initialize the state machine to the initial state.
			state <= Initial;
			// Initialize our variables.
			newNumber <= 1'bX;
			playerScore <= 8'b00000000;
		
		end
		
		else begin
			case(state)
			
				// Initial state--presets some things, then transitions to Menu_play
				Initial: begin
					// State transitions:
					if(CEN) begin
						state <= Menu_Play;
					end
					
					// RTL Logic (None here)
					newNumber <= 1;
					
				end		
					
				// Menu Play state--waits for input, moves to Menu Practice state, Menu Quit state, or Play Initial state.
				Menu_Play: begin
					if(CEN) begin
						// State transitions:
						if(Select && !selectLeft && !selectRight) begin
							state <= Play_Initial;
						end
						
						else if(!Select && selectLeft && !selectRight) begin
							state <= Menu_Quit;
						end
						
						else if(!Select && !selectLeft && selectRight) begin
							state <= Menu_Practice;
						end
						
						// RTL Logic
						newNumber <= 0;	// We want to begin generating new random numbers on this and subsequent states.
					end
				end
				
				// Menu Practice state--waits for input, moves to Menu Play, Menu Scores, and Practice Initial states.
				Menu_Practice: begin
					if(CEN) begin
						// State transitions:
						/*
						if(Select && !selectLeft && !selectRight) begin
							state <= Practice_Initial;
						end
						*/
						if (Select && !selectLeft && !selectRight) begin
							state <= Practice;
						end
						else if(!Select && selectLeft && !selectRight) begin
							state <= Menu_Play;
						end
						
						else if(!Select && !selectLeft && selectRight) begin
							state <= Menu_Scores;
						end
						
						// RTL Logic
						newNumber <= 0;	// We want to begin generating new random numbers on this and subsequent states.
					end
				end
				
				// Menu Scores state--waits for input, moves to Menu Practice, Menu Quit and Scores states.
				Menu_Scores: begin
					if(CEN) begin
						// State transitions:
						if(Select && !selectLeft && !selectRight) begin
							state <= Scores;
						end
						
						else if(!Select && selectLeft && !selectRight) begin
							state <= Menu_Practice;
						end
						
						else if(!Select && !selectLeft && selectRight) begin
							state <= Menu_Quit;
						end
						
						// RTL Logic
						newNumber <= 1;	// We want to stop generating new random numbers on this and subsequent states.
						playerScore <= 0;
					end
				end
				
				// Menu Quit state--waits for input, moves to Menu Scores, Menu Play and Done states.
				Menu_Quit: begin
					if(CEN) begin
						// State transitions:
						if(Select && !selectLeft && !selectRight) begin
							state <= Done;
						end
						
						else if(!Select && selectLeft && !selectRight) begin
							state <= Menu_Scores;
						end
						
						else if(!Select && !selectLeft && selectRight) begin
							state <= Menu_Play;
						end
						
						// RTL Logic
						newNumber <= 1;	// We want to stop generating new random numbers on this and subsequent states.
					end
				end
				
				// Play Initial state--generates a random binary number between 0 and 255, then unconditionally transitions to Play.
				Play_Initial: begin
					if(CEN) begin
						// State transitions:
						if(Select) begin
							state <= Play;
						end
						
						// RTL Logic
						
						
						if(Select) begin
							newNumber <= 0;	// We stop generating once the state transitions.
							outputNumber <= generatedNumber;
						end
					end
				end
				
				// Play state--waits for input, and moves to Play Initial if the input is correct, otherwise, it moves to Play Done
				Play: begin
					if(CEN) begin
						// State transitions:
						if((Select && !wrong) && (!Quit)) begin
							state <= Play_Initial;
						end
						
						else if((Select && wrong) || Quit) begin
							state <= Play_Done;
						end
						
						// RTL Logic
						if((Select && !wrong) && (!Quit)) begin
							newNumber <= 1;	// We start generating once the state transitions.
							
							if((Select && !wrong) && (!Quit)) begin
								//increment score
								playerScore <= playerScore + 1'b1;
							end
	
						end
					end
				end
				
				// Play Done state--waits for input, then moves to Scores state
				Play_Done: begin
					if(CEN) begin
						// State transitions:
						if(Select) begin
							state <= Scores;
						end
						
						// RTL Logic (none)
					end
				end
				
				// Practice Initial state--generates a random binary number between 0 and 255, then unconditionally transitions to Practice.
				Practice_Initial: begin
					if(CEN) begin
						// State transitions:
						if(Select) begin
							state <= Practice;
						end
						
						// RTL Logic
						if(Select) begin
							newNumber <= 0;	// We stop generating once the state transitions.
							outputNumber <= generatedNumber;
						end
					end
				end
				
				// Practice state--waits for input, and moves to Practice Initial when the input is correct, otherwise, it moves to Practice Done when the user quits
				
				/*Practice: begin
					if(CEN) begin
						// State transitions:
						if(Select && (!Quit)) begin
							state <= Practice_Initial;
						end
						
						else if( Quit ) begin
							state <= Practice_Done;
						end
						
						// RTL Logic
						if(Select && (!Quit)) begin
							newNumber <= 1;	// We start generating once the state transitions.
						end
					end
				end
				*/
				
					Practice: begin
					if(CEN) begin
						// State transitions:
						if(Select || !Quit) begin
							state <= Menu_Practice;
						end

						// RTL Logic
						//Just translate the user input into decimal
						//This is done in the top file...?
					end
				end
				
				// Practice Done state--waits for input, then moves to Scores state
				Practice_Done: begin
					if(CEN) begin
						// State transitions:
						if(Select) begin
							state <= Scores;
						end
						
						// RTL Logic (none)
					end
				end
				
				// Scores state--waits for input, then moves to Menu Scores state
				Scores: begin
					if(CEN) begin
						// State transitions:
						if(Quit || Select) begin
							state <= Menu_Scores;
						end
						
						// RTL Logic (none now)
					end
				end
				
				// Done state--waits for input, then moves to Initial
				Done: begin
					if(CEN) begin
						// State transitions:
						if(Select) begin
							state <= Initial;
						end
						
						// RTL Logic (none)
					end
				end
	
				default:		
					state <= UNK;
					
			endcase
		end
	end

	
endmodule
