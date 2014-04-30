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
	output vga_h_sync, vga_v_sync, vga_r, vga_g, vga_b;
	
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
	
	reg single;
	reg double;
	reg triple;
	reg [3:0] ones;
	reg [3:0] tens;
	reg [3:0] hundreds;


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
	
	//every clock input switch into user number
	always @ (posedge board_clk, posedge Reset_Pulse) begin
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
	always @ (posedge sys_clk, posedge Reset_Pulse) begin
		if(Reset_Pulse) begin			// ****** TODO  in Part 2 ******
			//userNumber <=  8'b00000000;
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
	
	//*********************************************************************************************************
	//
	//			every clock see how many digits the input has
	//
	//*********************************************************************************************************
		
	always @ (posedge sys_clk) begin

		if (SSD_Output == 8'b00000000) begin
			// 0
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b0;	tens <= 4'b0000;	ones <= 4'b0000;	
		end

		if (SSD_Output == 8'b00000001) begin
			// 1
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b0;	tens <= 4'b0000;	ones <= 4'b0001;	
		end

		if (SSD_Output == 8'b00000010) begin
			// 2
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b0;	tens <= 4'b0000;	ones <= 4'b0010;	
		end

		if (SSD_Output == 8'b00000011) begin
			// 3
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b0;	tens <= 4'b0000;	ones <= 4'b0011;	
		end

		if (SSD_Output == 8'b00000100) begin
			// 4
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b0;	tens <= 4'b0000;	ones <= 4'b0100;	
		end

		if (SSD_Output == 8'b00000101) begin
			// 5
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b0;	tens <= 4'b0000;	ones <= 4'b0101;	
		end

		if (SSD_Output == 8'b00000110) begin
			// 6
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b0;	tens <= 4'b0000;	ones <= 4'b0110;	
		end

		if (SSD_Output == 8'b00000111) begin
			// 7
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b0;	tens <= 4'b0000;	ones <= 4'b0111;	
		end

		if (SSD_Output == 8'b00001000) begin
			// 8
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b0;	tens <= 4'b0000;	ones <= 4'b1000;	
		end

		if (SSD_Output == 8'b00001001) begin
			// 9
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b0;	tens <= 4'b0000;	ones <= 4'b1001;	
		end

		if (SSD_Output == 8'b00001010) begin
			// 10
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0001;	ones <= 4'b0000;	
		end

		if (SSD_Output == 8'b00001011) begin
			// 11
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0001;	ones <= 4'b0001;	
		end

		if (SSD_Output == 8'b00001100) begin
			// 12
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0001;	ones <= 4'b0010;	
		end

		if (SSD_Output == 8'b00001101) begin
			// 13
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0001;	ones <= 4'b0011;	
		end

		if (SSD_Output == 8'b00001110) begin
			// 14
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0001;	ones <= 4'b0100;	
		end

		if (SSD_Output == 8'b00001111) begin
			// 15
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0001;	ones <= 4'b0101;	
		end

		if (SSD_Output == 8'b00010000) begin
			// 16
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0001;	ones <= 4'b0110;	
		end

		if (SSD_Output == 8'b00010001) begin
			// 17
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0001;	ones <= 4'b0111;	
		end

		if (SSD_Output == 8'b00010010) begin
			// 18
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0001;	ones <= 4'b1000;	
		end

		if (SSD_Output == 8'b00010011) begin
			// 19
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0001;	ones <= 4'b1001;	
		end

		if (SSD_Output == 8'b00010100) begin
			// 20
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0010;	ones <= 4'b0000;	
		end

		if (SSD_Output == 8'b00010101) begin
			// 21
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0010;	ones <= 4'b0001;	
		end

		if (SSD_Output == 8'b00010110) begin
			// 22
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0010;	ones <= 4'b0010;	
		end

		if (SSD_Output == 8'b00010111) begin
			// 23
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0010;	ones <= 4'b0011;	
		end

		if (SSD_Output == 8'b00011000) begin
			// 24
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0010;	ones <= 4'b0100;	
		end

		if (SSD_Output == 8'b00011001) begin
			// 25
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0010;	ones <= 4'b0101;	
		end

		if (SSD_Output == 8'b00011010) begin
			// 26
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0010;	ones <= 4'b0110;	
		end

		if (SSD_Output == 8'b00011011) begin
			// 27
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0010;	ones <= 4'b0111;	
		end

		if (SSD_Output == 8'b00011100) begin
			// 28
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0010;	ones <= 4'b1000;	
		end

		if (SSD_Output == 8'b00011101) begin
			// 29
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0010;	ones <= 4'b1001;	
		end

		if (SSD_Output == 8'b00011110) begin
			// 30
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0011;	ones <= 4'b0000;	
		end

		if (SSD_Output == 8'b00011111) begin
			// 31
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0011;	ones <= 4'b0001;	
		end

		if (SSD_Output == 8'b00100000) begin
			// 32
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0011;	ones <= 4'b0010;	
		end

		if (SSD_Output == 8'b00100001) begin
			// 33
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0011;	ones <= 4'b0011;	
		end

		if (SSD_Output == 8'b00100010) begin
			// 34
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0011;	ones <= 4'b0100;	
		end

		if (SSD_Output == 8'b00100011) begin
			// 35
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0011;	ones <= 4'b0101;	
		end

		if (SSD_Output == 8'b00100100) begin
			// 36
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0011;	ones <= 4'b0110;	
		end

		if (SSD_Output == 8'b00100101) begin
			// 37
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0011;	ones <= 4'b0111;	
		end

		if (SSD_Output == 8'b00100110) begin
			// 38
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0011;	ones <= 4'b1000;	
		end

		if (SSD_Output == 8'b00100111) begin
			// 39
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0011;	ones <= 4'b1001;	
		end

		if (SSD_Output == 8'b00101000) begin
			// 40
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0100;	ones <= 4'b0000;	
		end

		if (SSD_Output == 8'b00101001) begin
			// 41
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0100;	ones <= 4'b0001;	
		end

		if (SSD_Output == 8'b00101010) begin
			// 42
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0100;	ones <= 4'b0010;	
		end

		if (SSD_Output == 8'b00101011) begin
			// 43
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0100;	ones <= 4'b0011;	
		end

		if (SSD_Output == 8'b00101100) begin
			// 44
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0100;	ones <= 4'b0100;	
		end

		if (SSD_Output == 8'b00101101) begin
			// 45
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0100;	ones <= 4'b0101;	
		end

		if (SSD_Output == 8'b00101110) begin
			// 46
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0100;	ones <= 4'b0110;	
		end

		if (SSD_Output == 8'b00101111) begin
			// 47
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0100;	ones <= 4'b0111;	
		end

		if (SSD_Output == 8'b00110000) begin
			// 48
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0100;	ones <= 4'b1000;	
		end

		if (SSD_Output == 8'b00110001) begin
			// 49
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0100;	ones <= 4'b1001;	
		end

		if (SSD_Output == 8'b00110010) begin
			// 50
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0101;	ones <= 4'b0000;	
		end

		if (SSD_Output == 8'b00110011) begin
			// 51
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0101;	ones <= 4'b0001;	
		end

		if (SSD_Output == 8'b00110100) begin
			// 52
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0101;	ones <= 4'b0010;	
		end

		if (SSD_Output == 8'b00110101) begin
			// 53
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0101;	ones <= 4'b0011;	
		end

		if (SSD_Output == 8'b00110110) begin
			// 54
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0101;	ones <= 4'b0100;	
		end

		if (SSD_Output == 8'b00110111) begin
			// 55
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0101;	ones <= 4'b0101;	
		end

		if (SSD_Output == 8'b00111000) begin
			// 56
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0101;	ones <= 4'b0110;	
		end

		if (SSD_Output == 8'b00111001) begin
			// 57
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0101;	ones <= 4'b0111;	
		end

		if (SSD_Output == 8'b00111010) begin
			// 58
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0101;	ones <= 4'b1000;	
		end

		if (SSD_Output == 8'b00111011) begin
			// 59
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0101;	ones <= 4'b1001;	
		end

		if (SSD_Output == 8'b00111100) begin
			// 60
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0110;	ones <= 4'b0000;	
		end

		if (SSD_Output == 8'b00111101) begin
			// 61
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0110;	ones <= 4'b0001;	
		end

		if (SSD_Output == 8'b00111110) begin
			// 62
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0110;	ones <= 4'b0010;	
		end

		if (SSD_Output == 8'b00111111) begin
			// 63
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0110;	ones <= 4'b0011;	
		end

		if (SSD_Output == 8'b01000000) begin
			// 64
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0110;	ones <= 4'b0100;	
		end

		if (SSD_Output == 8'b01000001) begin
			// 65
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0110;	ones <= 4'b0101;	
		end

		if (SSD_Output == 8'b01000010) begin
			// 66
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0110;	ones <= 4'b0110;	
		end

		if (SSD_Output == 8'b01000011) begin
			// 67
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0110;	ones <= 4'b0111;	
		end

		if (SSD_Output == 8'b01000100) begin
			// 68
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0110;	ones <= 4'b1000;	
		end

		if (SSD_Output == 8'b01000101) begin
			// 69
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0110;	ones <= 4'b1001;	
		end

		if (SSD_Output == 8'b01000110) begin
			// 70
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0111;	ones <= 4'b0000;	
		end

		if (SSD_Output == 8'b01000111) begin
			// 71
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0111;	ones <= 4'b0001;	
		end

		if (SSD_Output == 8'b01001000) begin
			// 72
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0111;	ones <= 4'b0010;	
		end

		if (SSD_Output == 8'b01001001) begin
			// 73
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0111;	ones <= 4'b0011;	
		end

		if (SSD_Output == 8'b01001010) begin
			// 74
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0111;	ones <= 4'b0100;	
		end

		if (SSD_Output == 8'b01001011) begin
			// 75
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0111;	ones <= 4'b0101;	
		end

		if (SSD_Output == 8'b01001100) begin
			// 76
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0111;	ones <= 4'b0110;	
		end

		if (SSD_Output == 8'b01001101) begin
			// 77
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0111;	ones <= 4'b0111;	
		end

		if (SSD_Output == 8'b01001110) begin
			// 78
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0111;	ones <= 4'b1000;	
		end

		if (SSD_Output == 8'b01001111) begin
			// 79
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b0111;	ones <= 4'b1001;	
		end

		if (SSD_Output == 8'b01010000) begin
			// 80
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b1000;	ones <= 4'b0000;	
		end

		if (SSD_Output == 8'b01010001) begin
			// 81
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b1000;	ones <= 4'b0001;	
		end

		if (SSD_Output == 8'b01010010) begin
			// 82
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b1000;	ones <= 4'b0010;	
		end

		if (SSD_Output == 8'b01010011) begin
			// 83
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b1000;	ones <= 4'b0011;	
		end

		if (SSD_Output == 8'b01010100) begin
			// 84
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b1000;	ones <= 4'b0100;	
		end

		if (SSD_Output == 8'b01010101) begin
			// 85
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b1000;	ones <= 4'b0101;	
		end

		if (SSD_Output == 8'b01010110) begin
			// 86
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b1000;	ones <= 4'b0110;	
		end

		if (SSD_Output == 8'b01010111) begin
			// 87
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b1000;	ones <= 4'b0111;	
		end

		if (SSD_Output == 8'b01011000) begin
			// 88
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b1000;	ones <= 4'b1000;	
		end

		if (SSD_Output == 8'b01011001) begin
			// 89
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b1000;	ones <= 4'b1001;	
		end

		if (SSD_Output == 8'b01011010) begin
			// 90
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b1001;	ones <= 4'b0000;	
		end

		if (SSD_Output == 8'b01011011) begin
			// 91
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b1001;	ones <= 4'b0001;	
		end

		if (SSD_Output == 8'b01011100) begin
			// 92
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b1001;	ones <= 4'b0010;	
		end

		if (SSD_Output == 8'b01011101) begin
			// 93
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b1001;	ones <= 4'b0011;	
		end

		if (SSD_Output == 8'b01011110) begin
			// 94
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b1001;	ones <= 4'b0100;	
		end

		if (SSD_Output == 8'b01011111) begin
			// 95
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b1001;	ones <= 4'b0101;	
		end

		if (SSD_Output == 8'b01100000) begin
			// 96
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b1001;	ones <= 4'b0110;	
		end

		if (SSD_Output == 8'b01100001) begin
			// 97
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b1001;	ones <= 4'b0111;	
		end

		if (SSD_Output == 8'b01100010) begin
			// 98
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b1001;	ones <= 4'b1000;	
		end

		if (SSD_Output == 8'b01100011) begin
			// 99
			triple <= 1'b0;	hundreds <= 4'b0000;	double <= 1'b1;	tens <= 4'b1001;	ones <= 4'b1001;	
		end

		if (SSD_Output == 8'b01100100) begin
			// 100
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b0;	tens <= 4'b0000;	ones <= 4'b0000;	
		end

		if (SSD_Output == 8'b01100101) begin
			// 101
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b0;	tens <= 4'b0000;	ones <= 4'b0001;	
		end

		if (SSD_Output == 8'b01100110) begin
			// 102
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b0;	tens <= 4'b0000;	ones <= 4'b0010;	
		end

		if (SSD_Output == 8'b01100111) begin
			// 103
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b0;	tens <= 4'b0000;	ones <= 4'b0011;	
		end

		if (SSD_Output == 8'b01101000) begin
			// 104
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b0;	tens <= 4'b0000;	ones <= 4'b0100;	
		end

		if (SSD_Output == 8'b01101001) begin
			// 105
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b0;	tens <= 4'b0000;	ones <= 4'b0101;	
		end

		if (SSD_Output == 8'b01101010) begin
			// 106
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b0;	tens <= 4'b0000;	ones <= 4'b0110;	
		end

		if (SSD_Output == 8'b01101011) begin
			// 107
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b0;	tens <= 4'b0000;	ones <= 4'b0111;	
		end

		if (SSD_Output == 8'b01101100) begin
			// 108
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b0;	tens <= 4'b0000;	ones <= 4'b1000;	
		end

		if (SSD_Output == 8'b01101101) begin
			// 109
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b0;	tens <= 4'b0000;	ones <= 4'b1001;	
		end

		if (SSD_Output == 8'b01101110) begin
			// 110
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0001;	ones <= 4'b0000;	
		end

		if (SSD_Output == 8'b01101111) begin
			// 111
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0001;	ones <= 4'b0001;	
		end

		if (SSD_Output == 8'b01110000) begin
			// 112
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0001;	ones <= 4'b0010;	
		end

		if (SSD_Output == 8'b01110001) begin
			// 113
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0001;	ones <= 4'b0011;	
		end

		if (SSD_Output == 8'b01110010) begin
			// 114
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0001;	ones <= 4'b0100;	
		end

		if (SSD_Output == 8'b01110011) begin
			// 115
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0001;	ones <= 4'b0101;	
		end

		if (SSD_Output == 8'b01110100) begin
			// 116
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0001;	ones <= 4'b0110;	
		end

		if (SSD_Output == 8'b01110101) begin
			// 117
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0001;	ones <= 4'b0111;	
		end

		if (SSD_Output == 8'b01110110) begin
			// 118
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0001;	ones <= 4'b1000;	
		end

		if (SSD_Output == 8'b01110111) begin
			// 119
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0001;	ones <= 4'b1001;	
		end

		if (SSD_Output == 8'b01111000) begin
			// 120
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0010;	ones <= 4'b0000;	
		end

		if (SSD_Output == 8'b01111001) begin
			// 121
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0010;	ones <= 4'b0001;	
		end

		if (SSD_Output == 8'b01111010) begin
			// 122
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0010;	ones <= 4'b0010;	
		end

		if (SSD_Output == 8'b01111011) begin
			// 123
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0010;	ones <= 4'b0011;	
		end

		if (SSD_Output == 8'b01111100) begin
			// 124
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0010;	ones <= 4'b0100;	
		end

		if (SSD_Output == 8'b01111101) begin
			// 125
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0010;	ones <= 4'b0101;	
		end

		if (SSD_Output == 8'b01111110) begin
			// 126
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0010;	ones <= 4'b0110;	
		end

		if (SSD_Output == 8'b01111111) begin
			// 127
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0010;	ones <= 4'b0111;	
		end

		if (SSD_Output == 8'b10000000) begin
			// 128
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0010;	ones <= 4'b1000;	
		end

		if (SSD_Output == 8'b10000001) begin
			// 129
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0010;	ones <= 4'b1001;	
		end

		if (SSD_Output == 8'b10000010) begin
			// 130
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0011;	ones <= 4'b0000;	
		end

		if (SSD_Output == 8'b10000011) begin
			// 131
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0011;	ones <= 4'b0001;	
		end

		if (SSD_Output == 8'b10000100) begin
			// 132
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0011;	ones <= 4'b0010;	
		end

		if (SSD_Output == 8'b10000101) begin
			// 133
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0011;	ones <= 4'b0011;	
		end

		if (SSD_Output == 8'b10000110) begin
			// 134
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0011;	ones <= 4'b0100;	
		end

		if (SSD_Output == 8'b10000111) begin
			// 135
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0011;	ones <= 4'b0101;	
		end

		if (SSD_Output == 8'b10001000) begin
			// 136
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0011;	ones <= 4'b0110;	
		end

		if (SSD_Output == 8'b10001001) begin
			// 137
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0011;	ones <= 4'b0111;	
		end

		if (SSD_Output == 8'b10001010) begin
			// 138
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0011;	ones <= 4'b1000;	
		end

		if (SSD_Output == 8'b10001011) begin
			// 139
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0011;	ones <= 4'b1001;	
		end

		if (SSD_Output == 8'b10001100) begin
			// 140
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0100;	ones <= 4'b0000;	
		end

		if (SSD_Output == 8'b10001101) begin
			// 141
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0100;	ones <= 4'b0001;	
		end

		if (SSD_Output == 8'b10001110) begin
			// 142
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0100;	ones <= 4'b0010;	
		end

		if (SSD_Output == 8'b10001111) begin
			// 143
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0100;	ones <= 4'b0011;	
		end

		if (SSD_Output == 8'b10010000) begin
			// 144
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0100;	ones <= 4'b0100;	
		end

		if (SSD_Output == 8'b10010001) begin
			// 145
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0100;	ones <= 4'b0101;	
		end

		if (SSD_Output == 8'b10010010) begin
			// 146
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0100;	ones <= 4'b0110;	
		end

		if (SSD_Output == 8'b10010011) begin
			// 147
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0100;	ones <= 4'b0111;	
		end

		if (SSD_Output == 8'b10010100) begin
			// 148
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0100;	ones <= 4'b1000;	
		end

		if (SSD_Output == 8'b10010101) begin
			// 149
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0100;	ones <= 4'b1001;	
		end

		if (SSD_Output == 8'b10010110) begin
			// 150
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0101;	ones <= 4'b0000;	
		end

		if (SSD_Output == 8'b10010111) begin
			// 151
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0101;	ones <= 4'b0001;	
		end

		if (SSD_Output == 8'b10011000) begin
			// 152
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0101;	ones <= 4'b0010;	
		end

		if (SSD_Output == 8'b10011001) begin
			// 153
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0101;	ones <= 4'b0011;	
		end

		if (SSD_Output == 8'b10011010) begin
			// 154
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0101;	ones <= 4'b0100;	
		end

		if (SSD_Output == 8'b10011011) begin
			// 155
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0101;	ones <= 4'b0101;	
		end

		if (SSD_Output == 8'b10011100) begin
			// 156
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0101;	ones <= 4'b0110;	
		end

		if (SSD_Output == 8'b10011101) begin
			// 157
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0101;	ones <= 4'b0111;	
		end

		if (SSD_Output == 8'b10011110) begin
			// 158
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0101;	ones <= 4'b1000;	
		end

		if (SSD_Output == 8'b10011111) begin
			// 159
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0101;	ones <= 4'b1001;	
		end

		if (SSD_Output == 8'b10100000) begin
			// 160
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0110;	ones <= 4'b0000;	
		end

		if (SSD_Output == 8'b10100001) begin
			// 161
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0110;	ones <= 4'b0001;	
		end

		if (SSD_Output == 8'b10100010) begin
			// 162
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0110;	ones <= 4'b0010;	
		end

		if (SSD_Output == 8'b10100011) begin
			// 163
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0110;	ones <= 4'b0011;	
		end

		if (SSD_Output == 8'b10100100) begin
			// 164
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0110;	ones <= 4'b0100;	
		end

		if (SSD_Output == 8'b10100101) begin
			// 165
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0110;	ones <= 4'b0101;	
		end

		if (SSD_Output == 8'b10100110) begin
			// 166
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0110;	ones <= 4'b0110;	
		end

		if (SSD_Output == 8'b10100111) begin
			// 167
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0110;	ones <= 4'b0111;	
		end

		if (SSD_Output == 8'b10101000) begin
			// 168
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0110;	ones <= 4'b1000;	
		end

		if (SSD_Output == 8'b10101001) begin
			// 169
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0110;	ones <= 4'b1001;	
		end

		if (SSD_Output == 8'b10101010) begin
			// 170
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0111;	ones <= 4'b0000;	
		end

		if (SSD_Output == 8'b10101011) begin
			// 171
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0111;	ones <= 4'b0001;	
		end

		if (SSD_Output == 8'b10101100) begin
			// 172
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0111;	ones <= 4'b0010;	
		end

		if (SSD_Output == 8'b10101101) begin
			// 173
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0111;	ones <= 4'b0011;	
		end

		if (SSD_Output == 8'b10101110) begin
			// 174
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0111;	ones <= 4'b0100;	
		end

		if (SSD_Output == 8'b10101111) begin
			// 175
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0111;	ones <= 4'b0101;	
		end

		if (SSD_Output == 8'b10110000) begin
			// 176
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0111;	ones <= 4'b0110;	
		end

		if (SSD_Output == 8'b10110001) begin
			// 177
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0111;	ones <= 4'b0111;	
		end

		if (SSD_Output == 8'b10110010) begin
			// 178
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0111;	ones <= 4'b1000;	
		end

		if (SSD_Output == 8'b10110011) begin
			// 179
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b0111;	ones <= 4'b1001;	
		end

		if (SSD_Output == 8'b10110100) begin
			// 180
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b1000;	ones <= 4'b0000;	
		end

		if (SSD_Output == 8'b10110101) begin
			// 181
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b1000;	ones <= 4'b0001;	
		end

		if (SSD_Output == 8'b10110110) begin
			// 182
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b1000;	ones <= 4'b0010;	
		end

		if (SSD_Output == 8'b10110111) begin
			// 183
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b1000;	ones <= 4'b0011;	
		end

		if (SSD_Output == 8'b10111000) begin
			// 184
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b1000;	ones <= 4'b0100;	
		end

		if (SSD_Output == 8'b10111001) begin
			// 185
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b1000;	ones <= 4'b0101;	
		end

		if (SSD_Output == 8'b10111010) begin
			// 186
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b1000;	ones <= 4'b0110;	
		end

		if (SSD_Output == 8'b10111011) begin
			// 187
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b1000;	ones <= 4'b0111;	
		end

		if (SSD_Output == 8'b10111100) begin
			// 188
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b1000;	ones <= 4'b1000;	
		end

		if (SSD_Output == 8'b10111101) begin
			// 189
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b1000;	ones <= 4'b1001;	
		end

		if (SSD_Output == 8'b10111110) begin
			// 190
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b1001;	ones <= 4'b0000;	
		end

		if (SSD_Output == 8'b10111111) begin
			// 191
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b1001;	ones <= 4'b0001;	
		end

		if (SSD_Output == 8'b11000000) begin
			// 192
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b1001;	ones <= 4'b0010;	
		end

		if (SSD_Output == 8'b11000001) begin
			// 193
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b1001;	ones <= 4'b0011;	
		end

		if (SSD_Output == 8'b11000010) begin
			// 194
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b1001;	ones <= 4'b0100;	
		end

		if (SSD_Output == 8'b11000011) begin
			// 195
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b1001;	ones <= 4'b0101;	
		end

		if (SSD_Output == 8'b11000100) begin
			// 196
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b1001;	ones <= 4'b0110;	
		end

		if (SSD_Output == 8'b11000101) begin
			// 197
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b1001;	ones <= 4'b0111;	
		end

		if (SSD_Output == 8'b11000110) begin
			// 198
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b1001;	ones <= 4'b1000;	
		end

		if (SSD_Output == 8'b11000111) begin
			// 199
			triple <= 1'b1;	hundreds <= 4'b0001;	double <= 1'b1;	tens <= 4'b1001;	ones <= 4'b1001;	
		end

		if (SSD_Output == 8'b11001000) begin
			// 200
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b0;	tens <= 4'b0000;	ones <= 4'b0000;	
		end

		if (SSD_Output == 8'b11001001) begin
			// 201
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b0;	tens <= 4'b0000;	ones <= 4'b0001;	
		end

		if (SSD_Output == 8'b11001010) begin
			// 202
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b0;	tens <= 4'b0000;	ones <= 4'b0010;	
		end

		if (SSD_Output == 8'b11001011) begin
			// 203
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b0;	tens <= 4'b0000;	ones <= 4'b0011;	
		end

		if (SSD_Output == 8'b11001100) begin
			// 204
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b0;	tens <= 4'b0000;	ones <= 4'b0100;	
		end

		if (SSD_Output == 8'b11001101) begin
			// 205
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b0;	tens <= 4'b0000;	ones <= 4'b0101;	
		end

		if (SSD_Output == 8'b11001110) begin
			// 206
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b0;	tens <= 4'b0000;	ones <= 4'b0110;	
		end

		if (SSD_Output == 8'b11001111) begin
			// 207
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b0;	tens <= 4'b0000;	ones <= 4'b0111;	
		end

		if (SSD_Output == 8'b11010000) begin
			// 208
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b0;	tens <= 4'b0000;	ones <= 4'b1000;	
		end

		if (SSD_Output == 8'b11010001) begin
			// 209
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b0;	tens <= 4'b0000;	ones <= 4'b1001;	
		end

		if (SSD_Output == 8'b11010010) begin
			// 210
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b1;	tens <= 4'b0001;	ones <= 4'b0000;	
		end

		if (SSD_Output == 8'b11010011) begin
			// 211
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b1;	tens <= 4'b0001;	ones <= 4'b0001;	
		end

		if (SSD_Output == 8'b11010100) begin
			// 212
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b1;	tens <= 4'b0001;	ones <= 4'b0010;	
		end

		if (SSD_Output == 8'b11010101) begin
			// 213
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b1;	tens <= 4'b0001;	ones <= 4'b0011;	
		end

		if (SSD_Output == 8'b11010110) begin
			// 214
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b1;	tens <= 4'b0001;	ones <= 4'b0100;	
		end

		if (SSD_Output == 8'b11010111) begin
			// 215
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b1;	tens <= 4'b0001;	ones <= 4'b0101;	
		end

		if (SSD_Output == 8'b11011000) begin
			// 216
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b1;	tens <= 4'b0001;	ones <= 4'b0110;	
		end

		if (SSD_Output == 8'b11011001) begin
			// 217
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b1;	tens <= 4'b0001;	ones <= 4'b0111;	
		end

		if (SSD_Output == 8'b11011010) begin
			// 218
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b1;	tens <= 4'b0001;	ones <= 4'b1000;	
		end

		if (SSD_Output == 8'b11011011) begin
			// 219
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b1;	tens <= 4'b0001;	ones <= 4'b1001;	
		end

		if (SSD_Output == 8'b11011100) begin
			// 220
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b1;	tens <= 4'b0010;	ones <= 4'b0000;	
		end

		if (SSD_Output == 8'b11011101) begin
			// 221
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b1;	tens <= 4'b0010;	ones <= 4'b0001;	
		end

		if (SSD_Output == 8'b11011110) begin
			// 222
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b1;	tens <= 4'b0010;	ones <= 4'b0010;	
		end

		if (SSD_Output == 8'b11011111) begin
			// 223
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b1;	tens <= 4'b0010;	ones <= 4'b0011;	
		end

		if (SSD_Output == 8'b11100000) begin
			// 224
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b1;	tens <= 4'b0010;	ones <= 4'b0100;	
		end

		if (SSD_Output == 8'b11100001) begin
			// 225
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b1;	tens <= 4'b0010;	ones <= 4'b0101;	
		end

		if (SSD_Output == 8'b11100010) begin
			// 226
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b1;	tens <= 4'b0010;	ones <= 4'b0110;	
		end

		if (SSD_Output == 8'b11100011) begin
			// 227
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b1;	tens <= 4'b0010;	ones <= 4'b0111;	
		end

		if (SSD_Output == 8'b11100100) begin
			// 228
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b1;	tens <= 4'b0010;	ones <= 4'b1000;	
		end

		if (SSD_Output == 8'b11100101) begin
			// 229
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b1;	tens <= 4'b0010;	ones <= 4'b1001;	
		end

		if (SSD_Output == 8'b11100110) begin
			// 230
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b1;	tens <= 4'b0011;	ones <= 4'b0000;	
		end

		if (SSD_Output == 8'b11100111) begin
			// 231
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b1;	tens <= 4'b0011;	ones <= 4'b0001;	
		end

		if (SSD_Output == 8'b11101000) begin
			// 232
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b1;	tens <= 4'b0011;	ones <= 4'b0010;	
		end

		if (SSD_Output == 8'b11101001) begin
			// 233
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b1;	tens <= 4'b0011;	ones <= 4'b0011;	
		end

		if (SSD_Output == 8'b11101010) begin
			// 234
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b1;	tens <= 4'b0011;	ones <= 4'b0100;	
		end

		if (SSD_Output == 8'b11101011) begin
			// 235
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b1;	tens <= 4'b0011;	ones <= 4'b0101;	
		end

		if (SSD_Output == 8'b11101100) begin
			// 236
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b1;	tens <= 4'b0011;	ones <= 4'b0110;	
		end

		if (SSD_Output == 8'b11101101) begin
			// 237
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b1;	tens <= 4'b0011;	ones <= 4'b0111;	
		end

		if (SSD_Output == 8'b11101110) begin
			// 238
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b1;	tens <= 4'b0011;	ones <= 4'b1000;	
		end

		if (SSD_Output == 8'b11101111) begin
			// 239
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b1;	tens <= 4'b0011;	ones <= 4'b1001;	
		end

		if (SSD_Output == 8'b11110000) begin
			// 240
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b1;	tens <= 4'b0100;	ones <= 4'b0000;	
		end

		if (SSD_Output == 8'b11110001) begin
			// 241
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b1;	tens <= 4'b0100;	ones <= 4'b0001;	
		end

		if (SSD_Output == 8'b11110010) begin
			// 242
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b1;	tens <= 4'b0100;	ones <= 4'b0010;	
		end

		if (SSD_Output == 8'b11110011) begin
			// 243
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b1;	tens <= 4'b0100;	ones <= 4'b0011;	
		end

		if (SSD_Output == 8'b11110100) begin
			// 244
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b1;	tens <= 4'b0100;	ones <= 4'b0100;	
		end

		if (SSD_Output == 8'b11110101) begin
			// 245
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b1;	tens <= 4'b0100;	ones <= 4'b0101;	
		end

		if (SSD_Output == 8'b11110110) begin
			// 246
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b1;	tens <= 4'b0100;	ones <= 4'b0110;	
		end

		if (SSD_Output == 8'b11110111) begin
			// 247
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b1;	tens <= 4'b0100;	ones <= 4'b0111;	
		end

		if (SSD_Output == 8'b11111000) begin
			// 248
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b1;	tens <= 4'b0100;	ones <= 4'b1000;	
		end

		if (SSD_Output == 8'b11111001) begin
			// 249
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b1;	tens <= 4'b0100;	ones <= 4'b1001;	
		end

		if (SSD_Output == 8'b11111010) begin
			// 250
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b1;	tens <= 4'b0101;	ones <= 4'b0000;	
		end

		if (SSD_Output == 8'b11111011) begin
			// 251
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b1;	tens <= 4'b0101;	ones <= 4'b0001;	
		end

		if (SSD_Output == 8'b11111100) begin
			// 252
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b1;	tens <= 4'b0101;	ones <= 4'b0010;	
		end

		if (SSD_Output == 8'b11111101) begin
			// 253
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b1;	tens <= 4'b0101;	ones <= 4'b0011;	
		end

		if (SSD_Output == 8'b11111110) begin
			// 254
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b1;	tens <= 4'b0101;	ones <= 4'b0100;	
		end

		if (SSD_Output == 8'b11111111) begin
			// 255
			triple <= 1'b1;	hundreds <= 4'b0010;	double <= 1'b1;	tens <= 4'b0101;	ones <= 4'b0101;	
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
	
	hvsync_generator syncgen(.clk(vga_clk), .reset(Reset_Pulse), .vga_h_sync(vga_h_sync), .vga_v_sync(vga_v_sync), .inDisplayArea(inDisplayArea), .CounterX(CounterX), .CounterY(CounterY));

//------------
// VGA Signal driving!
	/////////////////////////////////////////////////////////////////
	///////////////		VGA control starts here		/////////////////
	/////////////////////////////////////////////////////////////////
/*
	parameter BLACK = 8'b00000000;
	parameter WHITE = 8'b11111111;
	parameter RED = 8'b11100000;
	parameter GREEN = 8'b00011100;
	parameter BLUE = 8'b00000011;

	always @(*)
	begin
		vga_r <= R & inDisplayArea;
		vga_g <= G & inDisplayArea;
		vga_b <= B & inDisplayArea;
	end
*/

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
	
	assign SSD0 = {0, 0, 0, 0};
	assign SSD1 = (double) ? tens[3:0] : {0,0,0,0};
	assign SSD2 = (triple) ? {0,0,0,hundreds} : {0,0,0,0};
	assign SSD3 = {0,0,0,0};
	
	
	//assign SSD3 = (q_Practice | q_Play) ? AB_GCD[7:4]  : q_I ? Ain[7:4] : A[7:4];
	//assign SSD2 = (q_Practice | q_Play) ? AB_GCD[3:0]  : q_I ? Ain[3:0] : A[3:0];
	//assign SSD1 = (q_Practice | q_Play) ? i_count[7:4]  : q_I ? Bin[7:4] : B[7:4];
	//assign SSD0 = (q_Practice | q_Play) ? i_count[3:0]  : q_I ? Bin[3:0] : B[3:0];
	

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
			//4'b1010: SSD_CATHODES = 8'b00010001; // A
			//4'b1011: SSD_CATHODES = 8'b11000001; // B
			//4'b1100: SSD_CATHODES = 8'b01100011; // C
			//4'b1101: SSD_CATHODES = 8'b10000101; // D
			//4'b1110: SSD_CATHODES = 8'b01100001; // E
			//4'b1111: SSD_CATHODES = 8'b01110001; // F    
			default: SSD_CATHODES = 8'bXXXXXXXX; // default is not needed as we covered all cases
		endcase
	end	
	
endmodule

