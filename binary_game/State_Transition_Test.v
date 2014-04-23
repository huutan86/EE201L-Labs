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
	reg Reset;
	reg Select;
	reg Quit;
	reg selectRight;
	reg selectLeft;
	reg [7:0] userNumber;

	// Outputs
	wire outputNumber;
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

	parameter CLK_PERIOD = 20;


	//clock counter 
	initial
		begin: CLK_COUNTER
			Clk = 0;
			# (0.6 * CLK_PERIOD);
		forever
			begin
				#(CLK_PERIOD) Clk = Clk + 1;
			end
		end


	// Instantiate the Unit Under Test (UUT)
	binary_game uut (
		.Clk(Clk), 
		.Reset(Reset), 
		.Select(Select), 
		.Quit(Quit), 
		.selectRight(selectRight), 
		.selectLeft(selectLeft), 
		.userNumber(userNumber), 
		.outputNumber(outputNumber), 
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
		#20;
		Reset = 0;
		#20;
		
		//Reset should have finished. 
		
		//Go to Menu Play
		Select = 1;
		#20;
		Select = 0;
		#20;
		
		//Go to Play_Initial
		Select = 1;
		#20;
		Select = 0;
		#20;
		
		//Go to Play
		Select = 1;
		#20;
		Select = 0;
		#20;
		
		//Go back to Initial
		Select = 1;
		#20;
		Select = 0;
		#20;
		
		
      
		
		// Add stimulus here

	end
      
endmodule

