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

	vga_h_sync, vga_v_sync, vga_r, vga_g, vga_b,	// FPGA VGA signals
	MemOE, MemWR, RamCS, FlashCS, QuadSpiFlashCS,	// Disable the three memory chips
	ClkPort,                          				// the 100 MHz incoming clock signal
	BtnL, BtnU, BtnD, BtnR,							// the Left, Up, Down, and the Right buttons BtnL, BtnR,
	BtnC,											// the center button (this is our reset in most of our designs)
	Sw7, Sw6, Sw5, Sw4, Sw3, Sw2, Sw1, Sw0,			// 8 switches
	Ld7, Ld6, Ld5, Ld4, Ld3, Ld2, Ld1, Ld0,			// 8 LEDs
	An3, An2, An1, An0,								// 4 anodes
	Ca, Cb, Cc, Cd, Ce, Cf, Cg,						// 7 cathodes
	Dp												// Dot Point Cathode on SSDs
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
	output vga_h_sync, vga_v_sync, vga_r, vga_g, vga_b;

	
	/*  LOCAL SIGNALS  */

	wire Reset, ClkPort;
	wire board_clk, sys_clk, vga_clk;
	wire [1:0] ssdscan_clk;
	reg [26:0] DIV_CLK;
	
	reg [7:0] SSD_Output;
	
	wire Select_Pulse;
	wire Reset_Pulse;
	wire Right_Pulse;
	wire Left_Pulse;
	wire Quit_Pulse;
	
	// State wires
	wire q_Initial, q_MenuPlay, q_MenuPractice, q_MenuScores, q_MenuQuit, q_PlayInitial, q_Play, q_PlayDone, q_PracticeInitial, q_Practice, q_PracticeDone, q_Scores, q_Done;
	
	// Data wires
	reg [7:0] userNumber;
	wire [7:0] outputNumber;
	wire [7:0] playerScore;
	
	

	
	// SSD Control signals
	reg [3:0] SSD;
	wire [3:0] SSD3, SSD2, SSD1, SSD0;
	reg [7:0] SSD_CATHODES;
	reg vga_r, vga_g, vga_b;
	
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


	assign Reset = BtnD;
	
//------------
	// Our clock is too fast (100MHz) for SSD scanning
	// create a series of slower "divided" clocks
	// each successive bit is 1/2 frequency
	always @(posedge board_clk, posedge Reset) begin							
		if (Reset)
			DIV_CLK <= 0;
		else
			DIV_CLK <= DIV_CLK + 1'b1;
	end
	
	always @ (posedge board_clk, posedge Reset) begin
		userNumber <= {Sw7, Sw6, Sw5, Sw4, Sw3, Sw2, Sw1, Sw0};
	end
	
//-------------------	
	// In this design, we run the core design at full 50MHz clock!
	assign sys_clk = board_clk;
	// assign sys_clk = DIV_CLK[25];

//------------
// INPUT: SWITCHES & BUTTONS
	// BtnL is used as both Start and Acknowledge. 
	// To make this possible, we need a single clock producing  circuit.
	
	ee201_debouncer #(.N_dc(28)) ee201_debouncer_0 (.CLK(sys_clk), .RESET(Reset), .PB(BtnL), .DPB( ), .SCEN(BtnL_Pulse), .MCEN( ), .CCEN( ));
	ee201_debouncer #(.N_dc(28)) ee201_debouncer_1 (.CLK(sys_clk), .RESET(Reset), .PB(BtnR), .DPB( ), .SCEN(BtnR_Pulse), .MCEN( ), .CCEN( ));
	ee201_debouncer #(.N_dc(28)) ee201_debouncer_2 (.CLK(sys_clk), .RESET(Reset), .PB(BtnU), .DPB( ), .SCEN(BtnU_Pulse), .MCEN( ), .CCEN( ));
	ee201_debouncer #(.N_dc(28)) ee201_debouncer_3 (.CLK(sys_clk), .RESET(Reset), .PB(BtnC), .DPB( ), .SCEN(BtnC_Pulse), .MCEN( ), .CCEN( ));
	ee201_debouncer #(.N_dc(28)) ee201_debouncer_4 (.CLK(sys_clk), .RESET(Reset), .PB(BtnD), .DPB( ), .SCEN(BtnD_Pulse), .MCEN( ), .CCEN( ));
	
	// BtnR is used to generate in_AB_Pulse to record the values of 
	// the inputs A and B as set on the switches.
	// BtnU is used as CEN_Pulse to allow single-stepping
	assign { CEN_Pulse } = { BtnR_Pulse || BtnU_Pulse || BtnL_Pulse || BtnC_Pulse || BtnD_Pulse };

//------------
// DESIGN
	// On two pushes of BtnR, numbers A and B are recorded in Ain and Bin
    // (registers of the TOP) respectively
	always @ (posedge sys_clk, posedge Reset) begin
		if(Reset) begin			// ****** TODO  in Part 2 ******
			userNumber <=  8'b00000000;
			//outputNumber <= 8'b00000000;
		end
		
		else begin
			if (q_Play || q_Practice) begin
				//userNumber <= {Sw7, Sw6, Sw5, Sw4, Sw3, Sw2, Sw1, Sw0};
			end
		end
		
		//convert SDD display number
		if (q_Practice) begin
			//user output is the SSD output
			SSD_Output <= userNumber;
		end
		else begin
			//otherwise it should be the random number
			SSD_Output <= outputNumber;
		end
	end
	
	// the state machine module
	binary_game game_instance(
		.Clk(sys_clk), 
		.Reset(Reset_Pulse), 
		.Select(Select_Pulse), 
		.Quit(Quit_Pulse), 
		.selectRight(Right_Pulse), 
		.selectLeft(Left_Pulse), 
		.userNumber(userNumber), 
		.outputNumber(outputNumber), 
		.playerScore(playerScore),
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
	
	hvsync_generator syncgen(.clk(vga_clk), .reset(Reset), .vga_h_sync(vga_h_sync), .vga_v_sync(vga_v_sync), .inDisplayArea(inDisplayArea), .CounterX(CounterX), .CounterY(CounterY));

//------------
// VGA Signal driving!
	wire R = CounterY >= 120 && CounterY <= 240 && CounterX[7:2] == 6'b111111;
	wire G = CounterY >= 120 && CounterY <= 240 && CounterY[7:2] == 6'b111111;
	wire B = CounterY >= 120 && CounterY <= 240 && CounterY[7:2] == 6'b111111;
	
	always @(posedge vga_clk)
	begin
		vga_r <= R & inDisplayArea;
		vga_g <= G & inDisplayArea;
		vga_b <= B & inDisplayArea;
	end

//------------
// OUTPUT: LEDS
	
	//assign {} = {q_I, q_Sub, q_Mult, q_Done};
	assign {Ld7, Ld6, Ld5, Ld4, Ld3, Ld2, Ld1, Ld0} = { userNumber };
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
	/*
	assign SSD3 = (q_Mult | q_Done) ? AB_GCD[7:4]  : q_I ? Ain[7:4] : A[7:4];
	assign SSD2 = (q_Mult | q_Done) ? AB_GCD[3:0]  : q_I ? Ain[3:0] : A[3:0];
	assign SSD1 = (q_Mult | q_Done) ? i_count[7:4]  : q_I ? Bin[7:4] : B[7:4];
	assign SSD0 = (q_Mult | q_Done) ? i_count[3:0]  : q_I ? Bin[3:0] : B[3:0];
	*/

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
	assign An3	= !(~(ssdscan_clk[1]) && ~(ssdscan_clk[0]));  // when ssdscan_clk = 00
	assign An2	= !(~(ssdscan_clk[1]) &&  (ssdscan_clk[0]));  // when ssdscan_clk = 01
	assign An1	=  !((ssdscan_clk[1]) && ~(ssdscan_clk[0]));  // when ssdscan_clk = 10
	assign An0	=  !((ssdscan_clk[1]) &&  (ssdscan_clk[0]));  // when ssdscan_clk = 11
	
	
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

