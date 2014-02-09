//////////////////////////////////////////////////////////////////////////////////
// Author:			Brandon Franzke, Gandhi Puvvada, Bilal Zafar
// Create Date:		02/17/2008, 2/6/2012 
// File Name:		ee201_numlock_top.v [EXERCISE given to studnents]
// Description: 
//
//
// Revision: 		2.1
// Additional Comments: Students: Search for the "TODO" sections and complete them.
//                                There are about eleven "TODO" sections.
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module ee201_numlock_top (   
		MemOE, MemWR, RamCS, FlashCS, QuadSpiFlashCS, // Disable the three memory chips

        ClkPort,                           // the 100 MHz incoming clock signal
		
		// BtnL, BtnU, BtnD, BtnR,            // the Left, Up, Down, and the Right buttons 
		
		//                              // the center button (this is our reset in most of our designs)
		// Sw7, Sw6, Sw5, Sw4, Sw3, Sw2, Sw1, Sw0, // 8 switches

		Ld7, Ld6, Ld5, Ld4, Ld3, Ld2, Ld1, Ld0, // 8 LEDs
		An3, An2, An1, An0,			       // 4 anodes
		Ca, Cb, Cc, Cd, Ce, Cf, Cg,        // 7 cathodes
		Dp                                 // Dot Point Cathode on SSDs
	  );


	/*  INPUTS */
	// Clock & Reset I/O
	input		ClkPort;	
// TODO: DEFINE THE INPUTS (buttons and switches) you need for this project
// make sure to add those to the ee201_numlock_top PORT list also!	
	// Project Specific Inputs
	input		;	
	
	
	
	/*  OUTPUTS */
	// Control signals on Memory chips 	(to disable them)
	output 	MemOE, MemWR, RamCS, FlashCS, QuadSpiFlashCS;
	// Project Specific Outputs
	// LEDs
	output 	Ld0, Ld1, Ld2, Ld3, Ld4, Ld5, Ld6, Ld7;
	// SSD Outputs
	output 	Cg, Cf, Ce, Cd, Cc, Cb, Ca, Dp;
	output 	An0, An1, An2, An3;	
	
	
	
	/*  LOCAL SIGNALS */
	wire			reset, ClkPort;
	wire			board_clk, sys_clk;
	wire [1:0]		ssdscan_clk;
	reg [26:0]	    DIV_CLK;
	wire 			U, Z;
	wire 			q_I, q_G1get, q_G1, q_G10get, q_G10, q_G101get, q_G101, q_G1011get, q_G1011, q_Opening, q_Bad;
	wire 			Unlock;	
	reg [3:0] 		state_num;
	reg [3:0] 		state_sum;
	wire [3:0] 		selected_state;
	reg 			hot1_state_error;	
	reg 			selected_state_value;	
	reg [3:0]		SSD;
	wire [3:0]		SSD0, SSD1, SSD2, SSD3;	
	reg [6:0]  		SSD_CATHODES;
	wire [6:0] 		SSD_CATHODES_blinking;	

	
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

	// BUFGP BUFGP2 (reset, BtnC); In the case of Spartan 3E (on Nexys-2 board), we were using BUFGP to provide global routing for the reset signal. But Spartan 6 (on Nexys-3) does not allow this.
	assign reset = BtnC;
	
//------------
	// Our clock is too fast (100MHz) for SSD scanning
	// create a series of slower "divided" clocks
	// each successive bit is 1/2 frequency
// TODO: create the sensitivity list
	always @ ()  
	begin : CLOCK_DIVIDER
      if (reset)
			DIV_CLK <= 0;
      else
			// just incrementing makes our life easier
// TODO: add the incrementer code
			;
	end		
//------------	
	// pick a divided clock bit to assign to system clock
	// your decision should not be "too fast" or you will not see you state machine working
	assign	sys_clk = DIV_CLK[25]; // DIV_CLK[25] (~1.5Hz) = (100MHz / 2**26)
	

//------------
// INPUT: SWITCHES & BUTTONS
	// BtnL/BtnR is abstract
	// let's form some wire aliases with easier naming (U and Z, for UNO and ZERO) 

// TODO: add the lines to assign your I/O inputs to U and Z
	assign {U,Z} = /* */;
	
	
	// switches used to send the value of a specific state to LD6

	assign selected_state = {Sw3, Sw2, Sw1, Sw0};
	

//------------
// DESIGN

	
	ee201_numlock_sm SM1(.Clk(sys_clk), .reset(reset), 
								.q_I(q_I), 

								);		
// TODO: finish the port list
// make sure you are following the naming scheme above
								
	
	// convert the 1-hot state to a hex-number for easy display	
	
	`define QI_NUM			4'b0000
	`define QG1GET_NUM		4'b0001
	`define QG1_NUM			4'b0010
	`define QG10GET_NUM		4'b0011
	`define QG10_NUM		4'b0100
	`define QG101GET_NUM	4'b0101
	`define QG101_NUM		4'b0110
	`define QG1011GET_NUM	4'b0111
	`define QG1011_NUM		4'b1000
	`define QOPENING_NUM	4'b1001
	`define QBAD_NUM		4'b1010
	
	always @ ( q_I, q_G1get, q_G1, q_G10get, q_G10, q_G101get, q_G101, q_G1011get, q_G1011, q_Opening, q_Bad )
	begin : ONE_HOT_TO_HEX
		(* full_case, parallel_case *) // to avoid prioritization (Verilog 2001 standard)
		case ( {q_I, q_G1get, q_G1, q_G10get, q_G10, q_G101get, q_G101, q_G1011get, q_G1011, q_Opening, q_Bad} )		

// TODO: complete the 1-hot encoder	

		endcase
	end
	
	
//------------
// OUTPUT: LEDS
	assign {Ld7,Ld6,Ld5,Ld4} = state_num;
	
	// display 1-hot state errors
	// add all of the state bits.  if the sum != 1 then we have a problem
	// we need to support 0-10 so sum must be 4-bit
		
	always @ (q_I, q_G1get, q_G1, q_G10get, q_G10, q_G101get, q_G101, q_G1011get, q_G1011, q_Opening, q_Bad)
	begin
	// TODO: finish the logic for state_sum
		state_sum =     ;
	end
	
	// we could do the following with an assign statement also. 
	// Ofcourse, then we need to declare hot1_state_error as a wire.
	// assign hot1_state_error = (state_sum != 4'b0001) ? 1'b1 : 1'b0;
	// Or we can avoid this intermediate hot1_state_error altogether!
	// assign Ld2 = (state_sum != 4'b0001) ? 1'b1 : 1'b0;

	always @ (state_sum)
	begin
		hot1_state_error = (state_sum != 4'b0001) ? 1'b1 : 1'b0;
	end
	
	assign Ld2 = hot1_state_error;	
	
	// display the value of selected state
	
	always @ ( selected_state, q_I, q_G1get, q_G1, q_G10get, q_G10, q_G101get, q_G101, q_G1011get, q_G1011, q_Opening, q_Bad )
	begin : SELECTED_STATE_VALUE
		(* full_case, parallel_case *) // to avoid prioritization (Verilog 2001 standard)
		case ( selected_state )		
			`QI_NUM: 			selected_state_value = q_I;
			`QG1GET_NUM: 		selected_state_value = q_G1get;
			`QG1_NUM: 			selected_state_value = q_G1;
			`QG10GET_NUM: 		selected_state_value = q_G10get;			
			`QG10_NUM: 			selected_state_value = q_G10;
			`QG101GET_NUM: 		selected_state_value = q_G101get;
			`QG101_NUM: 		selected_state_value = q_G101;
			`QG1011GET_NUM: 	selected_state_value = q_G1011get;	
			`QG1011_NUM: 		selected_state_value = q_G1011;	
			`QOPENING_NUM: 		selected_state_value = q_Opening;	
			`QBAD_NUM: 			selected_state_value = q_Bad;			
		endcase
	end	
	assign Ld3 = selected_state_value;
	
	assign {Ld1, Ld0} = {U, Z};
	
	
	
//------------
// SSD (Seven Segment Display)

// TODO: finish the assignment for SSD3, SSD2, SSD1	
	assign SSD3 =    ;
	assign SSD2 =    ;
	assign SSD1 =    ;
	assign SSD0 = state_num;
	
	
	// need a scan clk for the seven segment display 
	
	// 100 MHz / 2^18 = 381.5 cycles/sec ==> frequency of DIV_CLK[17]
	// 100 MHz / 2^19 = 190.7 cycles/sec ==> frequency of DIV_CLK[18]
	// 100 MHz / 2^20 =  95.4 cycles/sec ==> frequency of DIV_CLK[19]
	
	// 381.5 cycles/sec (2.62 ms per digit) [which means all 4 digits are lit once every 10.5 ms (reciprocal of 95.4 cycles/sec)] works well.
	
	//                  --|  |--|  |--|  |--|  |--|  |--|  |--|  |--|  |   
    //                    |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | 
	//  DIV_CLK[17]       |__|  |__|  |__|  |__|  |__|  |__|  |__|  |__|
	//
	//               -----|     |-----|     |-----|     |-----|     |
    //                    |  0  |  1  |  0  |  1  |     |     |     |     
	//  DIV_CLK[18]       |_____|     |_____|     |_____|     |_____|
	//
	//         -----------|           |-----------|           |
    //                    |  0     0  |  1     1  |           |           
	//  DIV_CLK[19]       |___________|           |___________|
	//
	
	assign ssdscan_clk = DIV_CLK[19:18];
	
	assign An0	= !(~(ssdscan_clk[1]) && ~(ssdscan_clk[0]));  // when ssdscan_clk = 00
	assign An1	= !(~(ssdscan_clk[1]) &&  (ssdscan_clk[0]));  // when ssdscan_clk = 01
	assign An2	= !( (ssdscan_clk[1]) && ~(ssdscan_clk[0]));  // when ssdscan_clk = 10
	assign An3	= !( (ssdscan_clk[1]) &&  (ssdscan_clk[0]));  // when ssdscan_clk = 11
	
	
	always @ (ssdscan_clk, SSD0, SSD1, SSD2, SSD3)
	begin : SSD_SCAN_OUT
		case (ssdscan_clk) 
		
// TODO: finish the multiplexor to scan through SSD0-SSD3 with ssdscan_clk[1:0]

		endcase 
	end	
	
	
	// and finally convert SSD_num to ssd
// TODO: write the code to enable "blinking"
	// we want the CATHODES to turn "on-off-on-off" with system clock
	// while we are in state: OPENING
	assign SSD_CATHODES_blinking = /*  */ | ( {7{/* */ & /*  */}} );
	assign {Ca, Cb, Cc, Cd, Ce, Cf, Cg, Dp} = /*    */;

	// Following is Hex-to-SSD conversion. Even though
	always @ (SSD) 
	begin : HEX_TO_SSD
		case (SSD)
// TODO: write cases for 0-9
			4'b1010: SSD_CATHODES = 7'b0001000 ; // A
			4'b1011: SSD_CATHODES = 7'b1100000 ; // B
			4'b1100: SSD_CATHODES = 7'b0110001 ; // C
			4'b1101: SSD_CATHODES = 7'b1000010 ; // D
			4'b1110: SSD_CATHODES = 7'b0110000 ; // E
			4'b1111: SSD_CATHODES = 7'b0111000 ; // F    
			default: SSD_CATHODES = 7'bXXXXXXX ; // default is not needed as we covered all cases
		endcase
	end	
	
endmodule


