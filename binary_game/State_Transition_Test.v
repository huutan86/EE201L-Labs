`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:18:22 04/23/2014
// Design Name:   binary_game
// Module Name:   C:/Users/Stephen Sher/Desktop/EE201_github/EE201L-Labs/binary_game/State_Transition_Test.v
// Project Name:  binary_game
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: binary_game
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module State_Transition_Test;

	// Inputs
	reg Clk;
	reg CEN;
	reg Reset;
	reg Select;
	reg Quit;
	reg selectRight;
	reg selectLeft;
	reg [7:0] userNumber;

	// Outputs
	wire [7:0] outputNumber;
	wire [7:0] playerScore;
	wire isWrong;
	wire q_Initial;
	wire q_MenuPlay;
	wire q_MenuPractice;
	wire q_MenuScores;
	wire q_MenuQuit;
	wire q_PlayInitial;
	wire q_Play;
	wire q_PlayDone;
	wire q_PracticeInitial;
	wire q_Practice;
	wire q_PracticeDone;
	wire q_Scores;
	wire q_Done;
	
	parameter CLK_PERIOD = 15;




	// Instantiate the Unit Under Test (UUT)
	binary_game uut (
		.Clk(Clk), 
		.CEN(CEN),
		.Reset(Reset), 
		.Select(Select), 
		.Quit(Quit), 
		.selectRight(selectRight), 
		.selectLeft(selectLeft), 
		.userNumber(userNumber), 
		.outputNumber(outputNumber), 
		.playerScore(playerScore),
		.isWrong(isWrong),
		.q_Initial(q_Initial), 
		.q_MenuPlay(q_MenuPlay), 
		.q_MenuPractice(q_MenuPractice), 
		.q_MenuScores(q_MenuScores), 
		.q_MenuQuit(q_MenuQuit), 
		.q_PlayInitial(q_PlayInitial), 
		.q_Play(q_Play), 
		.q_PlayDone(q_PlayDone), 
		.q_PracticeInitial(q_PracticeInitial), 
		.q_Practice(q_Practice), 
		.q_PracticeDone(q_PracticeDone), 
		.q_Scores(q_Scores), 
		.q_Done(q_Done)
	);

	//clock generator
	initial begin: CLK_GENERATOR
		Clk = 0;
		# (0.6 * CLK_PERIOD);
		forever begin
			#(CLK_PERIOD) Clk = ~Clk;
			userNumber = outputNumber;

		end
	end
	
	initial begin
		// Initialize Inputs
		Clk = 0;
		Reset = 0;
		Select = 0;
		Quit = 0;
		selectRight = 0;
		selectLeft = 0;
		userNumber = 0;

		// Wait 100 ns for global reset to finish
		#100;
		Reset = 1;
		#25;
		Reset = 0;
		#25;
		
		//Reset finished
		
		//Select Initial, go to Menu Play
		CEN = 1;
		Select = 1;
		#25;
		CEN = 0;
		Select = 0;
		#100;
		
		
		
		
		//Go to Play Initial
		CEN = 1;
		Select = 1;
		#25;
		CEN = 0;
		Select = 0;
		#25;
		
		
		
		//Now at Play Initial, wait for a bit before proceeding
		
		#250;
		CEN = 1;
		Select = 1;
		#25;
		CEN = 0;
		Select = 0;
		#25;
		
		//Now at Play state, look at random number.
		
		
		//Go back to play initial
		CEN = 1;
		Select = 1;
		#25
		CEN = 0;
		Select = 0;
		#25;

		//In initial, wait a bit and repeat
		#250;
		CEN = 1;
		Select = 1;
		#25;
		CEN = 0;
		Select = 0;
		#25;
		
		//Now at Play state, look at random number.
		
		
		//Go back to play initial
		CEN = 1;
		Select = 1;
		#25
		CEN = 0;
		Select = 0;
		#25;
		
		#250;
		CEN = 1;
		Select = 1;
		#25;
		CEN = 0;
		Select = 0;
		#25;
		
		//Now at Play state, look at random number.
		
		
		//Go back to play initial
		CEN = 1;
		Select = 1;
		#25
		CEN = 0;
		Select = 0;
		#25;
		
				//Now at Play state, look at random number.
		
		
		//Go back to play initial
		CEN = 1;
		Select = 1;
		#25
		CEN = 0;
		Select = 0;
		#25;
		
		#250;
		CEN = 1;
		Select = 1;
		#25;
		CEN = 0;
		Select = 0;
		#25;
		
		//Now at Play state, look at random number.
		
		
		//Go back to play initial
		CEN = 1;
		Select = 1;
		#25
		CEN = 0;
		Select = 0;
		#25;
		
				//Now at Play state, look at random number.
		
		
		//Go back to play initial
		CEN = 1;
		Select = 1;
		#25
		CEN = 0;
		Select = 0;
		#25;
		
		#250;
		CEN = 1;
		Select = 1;
		#25;
		CEN = 0;
		Select = 0;
		#25;
		
		//Now at Play state, look at random number.
		
		
		//Go back to play initial
		CEN = 1;
		Select = 1;
		#25
		CEN = 0;
		Select = 0;
		#25;
		
				//Now at Play state, look at random number.
		
		
		//Go back to play initial
		CEN = 1;
		Select = 1;
		#25
		CEN = 0;
		Select = 0;
		#25;
		
		#250;
		CEN = 1;
		Select = 1;
		#25;
		CEN = 0;
		Select = 0;
		#25;
		
		//Now at Play state, look at random number.
		
	
		
		//now quit
		
		CEN = 1;
		Quit = 1;
		#30;
		CEN = 0;
		Quit = 0;
		#100;

	end
      
endmodule

