//////////////////////////////////////////////////////////////////////////////////
// Author:			Colin "Studmuffin" Cammarano and Stephen "Studly" Sher
// Create Date:		02/25/08
// File Name:		ee201_GCD_top.v 
// Description: 
//
//
// Revision: 		2.2
// Additional Comments: 
// 10/13/2008 debouncing and single_clock_wide pulse_generation modules are added by Gandhi
// 10/13/2008 Clock Enable (CEN) has been added by Gandhi
//  3/ 1/2010 The Spring 2009 debounce design is replaced by the Spring 2010 debounce design
//            Now, in part 2 of the GCD lab, we do single-stepping 
//  2/19/2012 Nexys-2 to Nexys-3 conversion done by Gandhi
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module game_top (

	Hsync, Vsync, vgaRed, vgaGreen, vgaBlue,	// FPGA VGA signals
	MemOE, MemWR, RamCS, FlashCS, QuadSpiFlashCS,	// Disable the three memory chips
	ClkPort,                          				// the 100 MHz incoming clock signal
	BtnL, BtnU, BtnD, BtnR,							// the Left, Up, Down, and the Right buttons BtnL, BtnR,
	BtnC,											// the center button (this is our reset in most of our designs)
	Sw7, Sw6, Sw5, Sw4, Sw3, Sw2, Sw1, Sw0,			// 8 switches
	Ld7, Ld6, Ld5, Ld4, Ld3, Ld2, Ld1, Ld0,			// 8 LEDs
	An3, An2, An1, An0,								// 4 anodes
	Ca, Cb, Cc, Cd, Ce, Cf, Cg,						// 7 cathodes
	Dp,												// Dot Point Cathode on SSDs
	stateOut,
	isWrong,
	CEN_Out
);

	/*  INPUTS */
	// Clock & Reset I/O
	input ClkPort;	
	// Project Specific Inputs
	input BtnL, BtnU, BtnD, BtnR, BtnC;	
	input Sw7, Sw6, Sw5, Sw4, Sw3, Sw2, Sw1, Sw0;
	
	
	/*  OUTPUTS */
	// Control signals on Memory chips 	(to disable them)
	output MemOE, MemWR, RamCS, FlashCS, QuadSpiFlashCS;
	// Project Specific Outputs
	// LEDs
	output Ld0, Ld1, Ld2, Ld3, Ld4, Ld5, Ld6, Ld7;
	// SSD Outputs
	output Cg, Cf, Ce, Cd, Cc, Cb, Ca, Dp;
	output An0, An1, An2, An3;	
	output Hsync, Vsync, vgaRed, vgaGreen, vgaBlue;
	
	output isWrong;
	
	//test
	output CEN_Out;
	

	/*  LOCAL SIGNALS  */

	wire ClkPort;
	wire board_clk, sys_clk, vga_clk;
	wire [1:0] ssdscan_clk;
	reg [26:0] DIV_CLK;
	
	wire Select_Pulse;
	wire Reset_Pulse;
	wire Right_Pulse;
	wire Left_Pulse;
	wire Quit_Pulse;
	
	// State wires
	wire q_Initial, q_MenuPlay, q_MenuPractice, q_MenuScores, q_MenuQuit, q_PlayInitial, q_Play, q_PlayDone, q_PracticeInitial, q_Practice, q_PracticeDone, q_Scores, q_Done;
	
	//testing
	output wire [12:0] stateOut;
	assign stateOut = { q_Done, q_Scores, q_PracticeDone, q_Practice, q_PracticeInitial, q_PlayDone, q_Play, q_PlayInitial, q_MenuQuit, q_MenuScores, q_MenuPractice, q_MenuPlay, q_Initial };

	
	// Data wires
	reg [7:0] userNumber;
	wire [7:0] outputNumber;
	wire [7:0] playerScore;
	
	// SSD Control signals
	reg [3:0] SSD;
	wire [3:0] SSD3, SSD2, SSD1, SSD0;
	reg [7:0] SSD_CATHODES;
	reg [7:0] SSD_Output;
	
	reg vgaRed, vgaGreen, vgaBlue;
	
//------------	
// Disable the three memories so that they do not interfere with the rest of the design.
	assign {MemOE, MemWR, RamCS, FlashCS, QuadSpiFlashCS} = 5'b11111;

//------------
// CLOCK DIVISION

	// The clock division circuitary works like this:
	//
	// ClkPort ---> [BUFGP2] ---> board_clk
	// board_clk ---> [clock dividing counter] ---> DIV_CLK
	// DIV_CLK ---> [constant assignment] ---> sys_clk;
	
	BUFGP BUFGP1 (board_clk, ClkPort);	

	// As the ClkPort signal travels throughout our design,
	// it is necessary to provide global routing to this signal. 
	// The BUFGPs buffer these input ports and connect them to the global 
	// routing resources in the FPGA.


	assign Reset_Pulse = BtnU;
	assign Select_Pulse = BtnC;
	assign Quit_Pulse = BtnD;
	assign Left_Pulse = BtnL;
	assign Right_Pulse = BtnR;
	
//------------
	// Our clock is too fast (100MHz) for SSD scanning
	// create a series of slower "divided" clocks
	// each successive bit is 1/2 frequency
	always @(posedge board_clk, posedge Reset_Pulse) begin							
		if (Reset_Pulse)
			DIV_CLK <= 0;
		else
			DIV_CLK <= DIV_CLK + 1'b1;
	end
	
	always @ (posedge board_clk) begin
		userNumber <= {Sw7, Sw6, Sw5, Sw4, Sw3, Sw2, Sw1, Sw0};
	end
	
	
//-------------------	
	// In this design, we run the core design at full 50MHz clock!
	assign sys_clk = board_clk;

//------------
// INPUT: SWITCHES & BUTTONS
	// BtnL is used as both Start and Acknowledge. 
	// To make this possible, we need a single clock producing  circuit.
	
	ee201_debouncer #(.N_dc(28)) ee201_debouncer_0 (.CLK(sys_clk), .RESET(Reset_Pulse), .PB(BtnL), .DPB( ), .SCEN(BtnL_Pulse), .MCEN( ), .CCEN( ));
	ee201_debouncer #(.N_dc(28)) ee201_debouncer_1 (.CLK(sys_clk), .RESET(Reset_Pulse), .PB(BtnR), .DPB( ), .SCEN(BtnR_Pulse), .MCEN( ), .CCEN( ));
	ee201_debouncer #(.N_dc(28)) ee201_debouncer_2 (.CLK(sys_clk), .RESET(Reset_Pulse), .PB(BtnU), .DPB( ), .SCEN(BtnU_Pulse), .MCEN( ), .CCEN( ));
	ee201_debouncer #(.N_dc(28)) ee201_debouncer_3 (.CLK(sys_clk), .RESET(Reset_Pulse), .PB(BtnC), .DPB( ), .SCEN(BtnC_Pulse), .MCEN( ), .CCEN( ));
	ee201_debouncer #(.N_dc(28)) ee201_debouncer_4 (.CLK(sys_clk), .RESET(Reset_Pulse), .PB(BtnD), .DPB( ), .SCEN(BtnD_Pulse), .MCEN( ), .CCEN( ));
	
	// BtnR is used to generate in_AB_Pulse to record the values of 
	// the inputs A and B as set on the switches.
	// BtnU is used as CEN_Pulse to allow single-stepping
	assign { CEN_Pulse } = { BtnR_Pulse || BtnU_Pulse || BtnL_Pulse || BtnC_Pulse || BtnD_Pulse };

	assign { CEN_Out } = { CEN_Pulse };


//------------
// DESIGN
	// On two pushes of BtnR, numbers A and B are recorded in Ain and Bin
    // (registers of the TOP) respectively
	always @ (posedge sys_clk) begin
		
		if (q_Practice) begin
			//user output is the SSD output
			SSD_Output <= userNumber;
		end
		
		else begin
			//otherwise it should be the random number
			SSD_Output <= outputNumber;
		end
	end
	
	// the  machine module
	binary_game game_instance(
		.Clk(sys_clk), 
		.CEN(CEN_Pulse),
		.Reset(Reset_Pulse), 
		.Select(Select_Pulse), 
		.Quit(Quit_Pulse), 
		.selectRight(Right_Pulse), 
		.selectLeft(Left_Pulse), 
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

//------------
// OUTPUT: VGA

	wire inDisplayArea;
	wire [9:0] CounterX;
	wire [9:0] CounterY;

	assign vga_clk = DIV_CLK[1];
	
	hvsync_generator syncgen(.clk(vga_clk), .reset(Reset_Pulse), .vga_h_sync(Hsync), .vga_v_sync(Vsync), .inDisplayArea(inDisplayArea), .CounterX(CounterX), .CounterY(CounterY));

//------------
// VGA Signal driving!
	/////////////////////////////////////////////////////////////////
	///////////////		VGA control starts here		/////////////////
	/////////////////////////////////////////////////////////////////

	reg rReg;
	reg gReg;
	reg bReg;
	
	always @(posedge sys_clk, posedge Reset_Pulse) begin : VGA_STATE_CHECK
		if(Reset_Pulse) begin
			rReg <= 0;
			gReg <= 0;
			bReg <= 0;
		end
		
		if(q_MenuPlay) begin
			rReg <= (CounterY >= 100 && CounterY <= 280 && CounterX >= 240 && CounterX <= 270) || (CounterY >= 100 && CounterY <= 280 && CounterX >= 305 && CounterX <= 335) || (CounterY >= 100 && CounterY <= 280 && CounterX >= 370 && CounterX <= 400) || (CounterY >= 100 && CounterY <= 140 && CounterX >= 240 && CounterX <= 400);
			gReg <= (CounterY >= 100 && CounterY <= 280 && CounterX >= 240 && CounterX <= 270) || (CounterY >= 100 && CounterY <= 280 && CounterX >= 305 && CounterX <= 335) || (CounterY >= 100 && CounterY <= 280 && CounterX >= 370 && CounterX <= 400) || (CounterY >= 100 && CounterY <= 140 && CounterX >= 240 && CounterX <= 400);
			bReg <= (CounterY >= 100 && CounterY <= 280 && CounterX >= 240 && CounterX <= 270) || (CounterY >= 100 && CounterY <= 280 && CounterX >= 305 && CounterX <= 335) || (CounterY >= 100 && CounterY <= 280 && CounterX >= 370 && CounterX <= 400) || (CounterY >= 100 && CounterY <= 140 && CounterX >= 240 && CounterX <= 400);
		end
		
		else if(q_MenuPractice) begin
			rReg <= (CounterY >= 100 && CounterY <= 280 && CounterX >= 240 && CounterX <= 270) || (CounterY >= 100 && CounterY <= 280 && CounterX >= 305 && CounterX <= 335) || (CounterY >= 100 && CounterY <= 280 && CounterX >= 370 && CounterX <= 400) || (CounterY >= 100 && CounterY <= 140 && CounterX >= 240 && CounterX <= 400);
			gReg <= 1;
			bReg <= (CounterY >= 100 && CounterY <= 280 && CounterX >= 240 && CounterX <= 270) || (CounterY >= 100 && CounterY <= 280 && CounterX >= 305 && CounterX <= 335) || (CounterY >= 100 && CounterY <= 280 && CounterX >= 370 && CounterX <= 400) || (CounterY >= 100 && CounterY <= 140 && CounterX >= 240 && CounterX <= 400);
		end
		
		else if(q_MenuScores) begin
			rReg <= 1;
			gReg <= (CounterY >= 100 && CounterY <= 280 && CounterX >= 240 && CounterX <= 270) || (CounterY >= 100 && CounterY <= 280 && CounterX >= 305 && CounterX <= 335) || (CounterY >= 100 && CounterY <= 280 && CounterX >= 370 && CounterX <= 400) || (CounterY >= 100 && CounterY <= 140 && CounterX >= 240 && CounterX <= 400);
			bReg <= 1;
		end
		
		else if(q_MenuQuit) begin
			rReg <= 1;
			gReg <= (CounterY >= 100 && CounterY <= 280 && CounterX >= 240 && CounterX <= 270) || (CounterY >= 100 && CounterY <= 280 && CounterX >= 305 && CounterX <= 335) || (CounterY >= 100 && CounterY <= 280 && CounterX >= 370 && CounterX <= 400) || (CounterY >= 100 && CounterY <= 140 && CounterX >= 240 && CounterX <= 400);
			bReg <= (CounterY >= 100 && CounterY <= 280 && CounterX >= 240 && CounterX <= 270) || (CounterY >= 100 && CounterY <= 280 && CounterX >= 305 && CounterX <= 335) || (CounterY >= 100 && CounterY <= 280 && CounterX >= 370 && CounterX <= 400) || (CounterY >= 100 && CounterY <= 140 && CounterX >= 240 && CounterX <= 400);
		end
		
		else if(q_PlayInitial) begin
			rReg <= 0;
			gReg <= 0;
			bReg <= 1;
		end
		
		else if(q_PracticeInitial) begin
			rReg <= 0;
			gReg <= 1;
			bReg <= 0;
		end
		
		else if(q_Scores) begin
			rReg <= 1;
			gReg <= 0;
			bReg <= 1;
		end
		
		else if(q_Initial) begin
			rReg <= 1;
			gReg <= 1;
			bReg <= 1;
		end
		
		else if(q_Done) begin
			rReg <= 0;
			gReg <= 0;
			bReg <= 0;
		end
	end
	
	wire R = rReg;
	wire G = gReg;
	wire B = bReg;
	
	always @(vga_clk)
	begin
		vgaRed <= R & inDisplayArea;
		vgaGreen <= G & inDisplayArea;
		vgaBlue <= B & inDisplayArea;
	end

//------------
// OUTPUT: LEDS
	
	//assign {} = {q_I, q_Sub, q_Mult, q_Done};
	
	
	assign {Ld7, Ld6, Ld5, Ld4, Ld3, Ld2, Ld1, Ld0} = { userNumber };
	//Assign states
	//assign {Ld7, Ld6, Ld5, Ld4, Ld3, Ld2, Ld1, Ld0} = { q_PracticeDone, q_Practice, q_PracticeInitial, q_MenuQuit, q_MenuScores, q_MenuPractice, q_MenuPlay, q_Initial };
	
	// Here
		//BtnL = Start/Ack
		//BtnU = Single-Step
		//BtnR = in_A_in_B
		//BtnD = not used here
	
//------------
// SSD (Seven Segment Display)
	
	//SSDs show Ain and Bin in initial state, A and B in subtract state, and GCD and i_count in multiply and done states.
	// ****** TODO  in Part 2 ******
	// assign y = s ? i1 : i0;  // an example of a 2-to-1 mux coding
	// assign y = s1 ? (s0 ? i3: i2): (s0 ? i1: i0); // an example of a 4-to-1 mux coding
	
	reg [3:0] hundreds;
	reg [3:0] tens;
	reg [3:0] ones;
	integer i;
	
	always @(posedge SSD_Output) begin : BCD_GENERATOR
		hundreds = 4'd0;
		tens = 4'd0;
		ones = 4'd0;
		
		for(i = 7; i >= 0; i = i - 1) begin
			if(hundreds >= 5) begin
				hundreds = hundreds + 3;
			end
			
			if(tens >= 5) begin
				tens = tens + 3;
			end
			
			if(ones >= 5) begin
				ones = ones + 3;
			end
			
			hundreds = hundreds << 1;
			hundreds[0] = tens[3];
			tens = tens << 1;
			tens[0] = ones[3];
			ones = ones << 1;
			ones = SSD_Output[i];
		end
	end

	assign SSD0 = ones;
	assign SSD1 = tens;
	assign SSD2 = hundreds;
	assign SSD3 = 0;

	// need a scan clk for the seven segment display 
	
	// 100 MHz / 2^18 = 381.5 cycles/sec ==> frequency of DIV_CLK[17]
	// 100 MHz / 2^19 = 190.7 cycles/sec ==> frequency of DIV_CLK[18]
	// 100 MHz / 2^20 =  95.4 cycles/sec ==> frequency of DIV_CLK[19]
	
	// 381.5 cycles/sec (2.62 ms per digit) [which means all 4 digits are lit once every 10.5 ms (reciprocal of 95.4 cycles/sec)] works well.
	
	//                  --|  |--|  |--|  |--|  |--|  |--|  |--|  |--|  |   
    //                   |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | 
	//  DIV_CLK[17]       |__|  |__|  |__|  |__|  |__|  |__|  |__|  |__|
	//
	//               -----|     |-----|     |-----|     |-----|     |
    //                   |  0  |  1  |  0  |  1  |     |     |     |     
	//  DIV_CLK[18]       |_____|     |_____|     |_____|     |_____|
	//
	//         -----------|           |-----------|           |
    //                   |  0     0  |  1     1  |           |           
	//  DIV_CLK[19]       |___________|           |___________|
	//
	
	assign ssdscan_clk = DIV_CLK[19:18];
	//assign An3	= !(~(ssdscan_clk[1]) && ~(ssdscan_clk[0]));  // when ssdscan_clk = 00
	assign An3 = 1'b1;
	assign An2 = !(~(ssdscan_clk[1]) &&  (ssdscan_clk[0]));  // when ssdscan_clk = 01
	assign An1 = !((ssdscan_clk[1]) && ~(ssdscan_clk[0]));  // when ssdscan_clk = 10
	assign An0 = !((ssdscan_clk[1]) &&  (ssdscan_clk[0]));  // when ssdscan_clk = 11
	
	
	always @ (ssdscan_clk, SSD0, SSD1, SSD2, SSD3) begin : SSD_SCAN_OUT
		case (ssdscan_clk) 
			2'b00: SSD = SSD3;	// ****** TODO  in Part 2 ******
			2'b01: SSD = SSD2;  	// Complete the four lines
			2'b10: SSD = SSD1;	
			2'b11: SSD = SSD0;
		endcase 
	end
	
	// and finally convert SSD_num to ssd
	// We convert the output of our 4-bit 4x1 mux

	assign {Ca, Cb, Cc, Cd, Ce, Cf, Cg, Dp} = { SSD_CATHODES };
	
	// Following is Hex-to-SSD conversion
	always @ (SSD) begin : HEX_TO_SSD
		case (SSD) // in this solution file the dot points are made to glow by making Dp = 0
		    //                                                                abcdefg,Dp
			// ****** TODO  in Part 2 ******
			// Revise the code below so that the dot points do not glow for your design.
			4'b0000: SSD_CATHODES = 8'b00000011; // 0
			4'b0001: SSD_CATHODES = 8'b10011111; // 1
			4'b0010: SSD_CATHODES = 8'b00100101; // 2
			4'b0011: SSD_CATHODES = 8'b00001101; // 3
			4'b0100: SSD_CATHODES = 8'b10011001; // 4
			4'b0101: SSD_CATHODES = 8'b01001001; // 5
			4'b0110: SSD_CATHODES = 8'b01000001; // 6
			4'b0111: SSD_CATHODES = 8'b00011111; // 7
			4'b1000: SSD_CATHODES = 8'b00000001; // 8
			4'b1001: SSD_CATHODES = 8'b00001001; // 9
			4'b1010: SSD_CATHODES = 8'b00010001; // A
			4'b1011: SSD_CATHODES = 8'b11000001; // B
			4'b1100: SSD_CATHODES = 8'b01100011; // C
			4'b1101: SSD_CATHODES = 8'b10000101; // D
			4'b1110: SSD_CATHODES = 8'b01100001; // E
			4'b1111: SSD_CATHODES = 8'b01110001; // F    
			default: SSD_CATHODES = 8'bXXXXXXXX; // default is not needed as we covered all cases
		endcase
	end	
	
endmodule

