// ----------------------------------------------------------------------
// 	A Verilog module to test the ee201_debounce_DPB_SCEN_CCEN_MCEN described in ee201_debounce_DPB_SCEN_CCEN_MCEN.v
//
// 	Written by Gandhi Puvvada  Date: 7/17/98, 2/15/2008, 10/13/08, 2/22/2010, 2/20/2012
//
//      File name: ee201_debounce_DPB_SCEN_CCEN_MCEN_tb_r1.v
// 2/20/2012 Changed the ee201_debounce_DPB_SCEN_CCEN_MCEN_r1.v to use 1.342 sec for MCEN repetitive rate.
// This test bench code is not for synthesis and does not belong to the core design (DUT).
// ------------------------------------------------------------------------

`timescale 1 ns / 100 ps

module ee201_debounce_DPB_SCEN_CCEN_MCEN_tb ;

reg  Clk_tb, Reset_tb;
reg  PB_tb;

wire  DPB_tb, SCEN_tb, MCEN_tb, CCEN_tb;

reg [8*8:0] state_string; // 8-character string

integer  Clk_cnt;

localparam CLK_PERIOD = 20;

//constants used for state naming in the DUT
// These are used for reporting the state as an ascii string
localparam
 INI = 6'b000000,
 W84 = 6'b000001,
 SCEN_st = 6'b111100,
 WS = 6'b100000,
 MCEN_st = 6'b101100,
 CCEN_st = 6'b100100,
 MCEN_cont = 6'b101101,
 CCR = 6'b100001,
 WFCR = 6'b100010;
 
// Instantiate the UUT
// module ee201_debouncer(CLK, RESET, PB, DPB, SCEN, MCEN, CCEN);
ee201_debouncer #(.N_dc(7)) DUT 
        (.CLK(Clk_tb), .RESET(Reset_tb), .PB(PB_tb), .DPB(DPB_tb), .SCEN(SCEN_tb), .MCEN(MCEN_tb), .CCEN(CCEN_tb));

initial
  begin  : CLK_GENERATOR
    Clk_tb = 0;
    forever
       begin
	      #(CLK_PERIOD/2) Clk_tb = ~Clk_tb;
       end 
  end

initial
  begin  : RESET_GENERATOR
    Reset_tb = 1;
    #(2 * CLK_PERIOD) Reset_tb = 0;
  end

initial
  begin  : CLK_COUNTER
    Clk_cnt = 0;
	#(0.5 * CLK_PERIOD);
    forever
       begin
	      #(CLK_PERIOD) Clk_cnt = Clk_cnt + 1;
       end 
  end

initial
  begin  : STIMULUS
  
    PB_tb = 1'b0;
	wait (!Reset_tb);    // wait until reset is over
	@(posedge Clk_tb);    // wait for a clock

// test #1 begin
	@(posedge Clk_tb);
	 #2;  // a little (2ns) after the clock edge
	 
	 
	 PB_tb = 1'b1;
	 # (3*CLK_PERIOD);
	 PB_tb = 1'b0;
	 # (4*CLK_PERIOD);
	 
	 PB_tb = 1'b1;
	 # (4*CLK_PERIOD);
	 PB_tb = 1'b0;
	 # (1*CLK_PERIOD);

	 PB_tb = 1'b1;
	 # (22*CLK_PERIOD);
	 PB_tb = 1'b0;
	 # (3*CLK_PERIOD);
	 
	 PB_tb = 1'b1;
	 # (4*CLK_PERIOD);
	 PB_tb = 1'b0;
	 # (1*CLK_PERIOD);

	 PB_tb = 1'b1;
	 # (145*CLK_PERIOD);
	 PB_tb = 1'b0;
	 # (6*CLK_PERIOD);
	 
	 PB_tb = 1'b1;
	 # (730*CLK_PERIOD);
	 PB_tb = 1'b0;
	 # (1*CLK_PERIOD);
	 
	 PB_tb = 1'b1;
	 # (40*CLK_PERIOD);
	 PB_tb = 1'b0;
	 # (200*CLK_PERIOD);
	 
	 PB_tb = 1'b1;
	 # (600*CLK_PERIOD);
	 PB_tb = 1'b0;
	 # (50*CLK_PERIOD); 
	 
	 $stop;
	 	 
  end // STIMULUS

always @(*)
  begin
	case (DUT.state)    // Note the dot (.) notation for hierarchical
						// referencing of signals hidden in the DUT
		INI: 		state_string  =  "   INI  "; 
		// spaces distributed around the names of the state 
		// to make it an 8-character string
		W84: 		state_string  =   "  W84   ";
		SCEN_st: 	state_string  =   "  SCEN  ";
		WS:			state_string  =   "   WS   ";
		MCEN_st:	state_string  =   " MCEN_st";
		CCEN_st:	state_string  =   " CCEN_st";
		MCEN_cont:	state_string  =   "MCEN_con";
		CCR:		state_string  =   "   CCR  ";
		WFCR:		state_string  =   "  WFCR  ";
	endcase
  end
  

endmodule  // ee201_debounce_DPB_SCEN_CCEN_MCEN_tb