//////////////////////////////////////////////////////////////////////////////////
// Author:      Brandon Franzke
// Create Date: 2013-02-04
// Modified:      
// File Name:   ee201_roller_top.v 
// Description: 
//
//
// Revision:	 1.1
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module ee201_roller_top (   
		MemOE, MemWR, RamCS, FlashCS, QuadSpiFlashCS, // Disable the three memory chips

      	ClkPort,							// the 100 MHz incoming clock signal
		
		// BtnL, BtnU, BtnD, BtnR,			// the Left, Up, Down, and the Right buttons 
		BtnL,
		BtnC,								// the center button (this is our reset in most of our designs)
		// Sw7, Sw6, Sw5, Sw4, Sw3, Sw2, Sw1, Sw0,	// 8 switches
		// Ld7, Ld6, Ld5, Ld4, Ld3, Ld2, Ld1, Ld0,	// 8 LEDs
		An3, An2, An1, An0,					// 4 anodes
		Ca, Cb, Cc, Cd, Ce, Cf, Cg,			// 7 cathodes
		Dp									// Dot Point Cathode on SSDs
	  );

	// Control signals on Memory chips 	(to disable them)
	output 	MemOE, MemWR, RamCS, FlashCS, QuadSpiFlashCS;
	//------------------	
	// Disable the three memories so that they do not interfere with the rest of the design.
	assign {MemOE, MemWR, RamCS, FlashCS, QuadSpiFlashCS} = 5'b11111;


	//------------------
	//**  INPUTS **/
	
	// Clock & Reset I/O
	input		ClkPort;
	// Project Specific Inputs
	input		BtnL, BtnC;	
	
	// debounced and single clock BtnL
	wire		BtnL_SCEN, BtnL_DBP;
	

	//------------------
	//**  OUTPUTS **/
	
	// SSD Outputs
	output 	Cg, Cf, Ce, Cd, Cc, Cb, Ca, Dp;
	output 	An0, An1, An2, An3;	
	

	//------------------
	//**  LOCAL SIGNALS **/
	
	wire		Reset, ClkPort;
	wire		board_clk, sys_clk;
	wire   		ssdscan_clk;
	reg [26:0]	DIV_CLK;
	//wire [4:0] 	X;
	//wire [2:0] X;
	wire [0:0] X;
	
	reg  [6:0] SSD_CATHODES0, SSD_CATHODES3;	
	reg  [6:0] SSD_CATHODES;
	

	//------------------		
	//** CLOCK DIVISION **/
	
	BUFGP BUFGP1 (board_clk, ClkPort); 	
	
	assign Reset = BtnC;
	
	//------------------
	// Our clock is too fast (100MHz) for SSD scanning
	// create a series of slower "divided" clocks
	// each successive bit is 1/2 frequency
  	always @(posedge board_clk, posedge Reset) 	
    	begin							
        	if (Reset)
				DIV_CLK <= 0;
        	else
				DIV_CLK <= DIV_CLK + 1'b1;
    	end
	//------------------	
	assign	sys_clk = board_clk;


	//------------------
	//** INPUT: SWITCHES & BUTTONS **/
	ee201_debouncer #(.N_dc(25)) debouncer_L (
		.CLK(sys_clk), .RESET(Reset), 
		.PB(BtnL), 
		.DPB(BtnL_DPB), 
		.SCEN(BtnL_SCEN), .MCEN( ), .CCEN( )
	);


	//------------------
	//** DESIGN **/
	
	/**
	TODO: complete parameter list
	HINT: check ee201_roller parameter list
	**/
	ee201_roller DR1 (
		/* */
		.Clk(sys_clk),
		.Reset(Reset),
		.NewX(BtnL),
		.X(X)
	);		
								
	//------------------
	//** SSD (Seven Segment Display) **/
	
	// need a scan clk for the seven segment display 
	// 191Hz (50MHz / 2^18) works well
	/**
	TODO: 
	1. complete the An3 assign
	2. disable An1, An2 (Active LOW)
	**/
	assign ssdscan_clk = DIV_CLK[17];	
	assign An0	= ~ssdscan_clk;  // ssdscan_clk = 0
	assign An1	= 1'b1;
	assign An2	= 1'b1;
	assign An3	= ssdscan_clk;  // ssdscan_clk = 1
	
	
	/**
	TODO: complete the mux for SSD_CATHODES = SSD0 / SSD3
	disable SSD when button pressed (BtnL_DPB = 1)
	**/
	always @ (*)
	begin : SSD_SCAN_OUT
		case ({ssdscan_clk, BtnL_DPB}) 
			2'b00: SSD_CATHODES = SSD_CATHODES0 ;
			2'b10: SSD_CATHODES = SSD_CATHODES3 ;				
			default: SSD_CATHODES = 7'b1111111;
		endcase
	end	
	
	/**
	TODO: complete the cathode assign
	turn OFF decimal point
	**/
	assign {Ca, Cb, Cc, Cd, Ce, Cf, Cg, Dp} = {SSD_CATHODES, 1'b1};
	
	
	// Following is Hex-to-SSD conversion
	/**
	TODO: complete the missing cathode values
	**/
	always @ (*) 
	begin : HEX_TO_SSD
		case (X)
			4'b0000: SSD_CATHODES0 = 7'b0000001 ; // 0
			4'b0001: SSD_CATHODES0 = 7'b1001111 ; // 1
			4'b0010: SSD_CATHODES0 = 7'b0010010 ; // 2
			4'b0011: SSD_CATHODES0 = 7'b0000110 ; // 3
			4'b0100: SSD_CATHODES0 = 7'b1001100 ; // 4
			4'b0101: SSD_CATHODES0 = 7'b0100100 ; // 5
			4'b0110: SSD_CATHODES0 = 7'b0100000 ; // 6
			4'b0111: SSD_CATHODES0 = 7'b0001111 ; // 7
			4'b1000: SSD_CATHODES0 = 7'b0000000 ; // 8
			4'b1001: SSD_CATHODES0 = 7'b0000100 ; // 9
			4'b0111: SSD_CATHODES0 = 7'b0001111 ; // 7
			4'b1000: SSD_CATHODES0 = 7'b0000000 ; // 8
			4'b1001: SSD_CATHODES0 = 7'b0000100 ; // 9
			4'b1010: SSD_CATHODES0 = 7'b0001000 ; // A
			4'b1011: SSD_CATHODES0 = 7'b1100000 ; // B
			4'b1100: SSD_CATHODES0 = 7'b0110001 ; // C
			4'b1101: SSD_CATHODES0 = 7'b1000010 ; // D
			4'b1110: SSD_CATHODES0 = 7'b0110000 ; // E
			4'b1111: SSD_CATHODES0 = 7'b0111000 ; // F    
			default: SSD_CATHODES0 = 7'bXXXXXXX ; // default is not needed as we covered all cases
		endcase
	end
	
	
	/**
	TODO: complete the missing cathode assignment for "H"
	**/
	always @ (*)
	begin: HEX_TO_HEAD_OR_TAIL
		case (X[0])
		    1'b0: SSD_CATHODES3 = 7'b1001000 ; // HEAD
		    1'b1: SSD_CATHODES3 = 7'b1111010 ; // TAIL
	  		default: SSD_CATHODES3 = 7'bXXXXXXX ; // default is not needed as we covered all cases
	  endcase
	end
	
endmodule



