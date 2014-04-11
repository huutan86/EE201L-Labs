// File     : divider_timing_top.v 
// Author   : Gandhi Puvvada
// Revision : 2.2
// Date     : Nov 10, 2008, 4/3/2012 (adjustment to suit Nexys-3)

module divider_timing_top
       (ClkPort,                                    // System Clock
        MemOE, MemWR, RamCS, FlashCS, QuadSpiFlashCS,
        BtnL, BtnU, BtnR, BtnD, BtnC,	             // the Left, Up, Right, Down, and Center buttons
        Sw0, Sw1, Sw2, Sw3, Sw4, Sw5, Sw6, Sw7,     // 8 Switches
        Ld0, Ld1, Ld2, Ld3, Ld4, Ld5, Ld6, Ld7,     // 8 LEDs
		  An0, An1, An2, An3,                         // 4 seven-LEDs
		  Ca, Cb, Cc, Cd, Ce, Cf, Cg, Dp
		  );
                                    
	input    ClkPort;
	input    BtnL, BtnU, BtnD, BtnR, BtnC;
	input    Sw0, Sw1, Sw2, Sw3, Sw4, Sw5, Sw6, Sw7;
	output   Ld0, Ld1, Ld2, Ld3, Ld4,Ld5, Ld6, Ld7;
	output   An0, An1, An2, An3;
	output   Ca, Cb, Cc, Cd, Ce, Cf, Cg, Dp;
	  
	// ROM drivers: Control signals on Memory chips (to disable them) 	
	output 	MemOE, MemWR, RamCS, FlashCS, QuadSpiFlashCS;  

	// local signal declaration
	wire Reset;
	wire board_clk;
	wire [3:0] Xin, Yin;
	wire Start, Ack, Clk;
	wire Done;
	wire [3:0] Quotient, Remainder;

	//------------ 
	// ClkPort travels throughout our design,
	// it is necessary to provide global routing to these signals. 
	// The BUFGPs buffer the input ports and connect them to the global 
	// routing resources in the FPGA.
	
	BUF BUF2 (board_clk, ClkPort);

	// BUFGP BUFGP2 (Reset, BtnC); In the case of Spartan 3E (on Nexys-2 board), we were using BUFGP to provide global routing for the reset signal. But Spartan 6 (on Nexys-3) does not allow this.
	assign Reset = BtnC;	

	// Disable the three memories so that they do not interfere with the rest of the design.
	assign {MemOE, MemWR, RamCS, FlashCS, QuadSpiFlashCS} = 5'b11111;

	// The Switch values are the values of the X and Y inputs
	// Buttons are used to indicate start and ack signals
	assign Xin   =  {Sw7, Sw6, Sw5, Sw4};
	assign Yin   =  {Sw3, Sw2, Sw1, Sw0};
	assign Start =  BtnL; 
	assign Ack   =  BtnR;
	assign Clk   =  board_clk; 

	// Port map the divider component
	divider_timing divider (.Clk(Clk), .Reset(Reset), 
													.Xin(Xin), .Yin(Yin), 
													.Start(Start), .Ack(Ack), 
													.Done(Done), .Quotient(Quotient), .Remainder(Remainder));

	// Turn 4 seven-LEDs on all the time
	assign {An0, An1, An2, An3} = 4'b0000;

	// The Quotient and Remainder are displayed on the LEDs	  
	assign {Ld7, Ld6, Ld5, Ld4, Ld3, Ld2, Ld1, Ld0} = {Quotient,Remainder} ;
	
	// Output dash ("-") on 4 seven-LEDs when DONE
	assign {Ca, Cb, Cc, Cd, Ce, Cf, Cg, Dp} = Done ? 8'b11111101 : 8'b11111111;

endmodule