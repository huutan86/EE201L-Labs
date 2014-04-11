// 	A Verilog module to test the divider described in divider.v
//
// 	Written by Gandhi Puvvada  Date: 7/17/98, 2/15/2008
//
//      File name: divider_timing_tb.v
// ------------------------------------------------------------------------
//	In this test bench we are using repeated code for test #1, #2, #3, #4.
//	This is not desirable. Refer to divider_tb_str.v for an improved
//	coding style using a task for the repeated code.
// ------------------------------------------------------------------------

`timescale 1 ns / 100 ps

module divider_tb ;

reg [3:0] Xin_tb, Yin_tb;
reg Start_tb, Ack_tb, Clk_tb, Reset_tb;
wire Done_tb;
wire [3:0] Quotient_tb, Remainder_tb;
integer  Clk_cnt;

parameter CLK_PERIOD = 10;


divider_timing divider_1 (Xin_tb, Yin_tb, Start_tb, Ack_tb, Clk_tb, Reset_tb, 
				Done_tb, Quotient_tb, Remainder_tb);

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
    forever
       begin
	      #(CLK_PERIOD) Clk_cnt = Clk_cnt + 1;
       end 
  end

initial
  begin  : STIMULUS
	   Xin_tb = 8;		// initial values
	   Yin_tb = 4'b0100;    // these are not important
	   Start_tb = 0;		// except for avoiding red color
	   Ack_tb = 0;          // in the initial portion of the waveform.

	wait (!Reset_tb);    // wait until reset is over
	@(posedge Clk_tb);    // wait for a clock

// test #1 begin
	@(posedge Clk_tb);
	 #2;  // a little (2ns) after the clock edge
	   Xin_tb = 15;
	   Yin_tb = 2;
	   Start_tb = 1;	// After a little while provide START
	@(posedge Clk_tb); // After waiting for a clock
	 #5;
	   Start_tb = 0;	// After a little while remove START

	wait (Done_tb);  // wait until the UUT (DIVIDE_1) is done

	$display ("Inputs:   Xin = %d and Yin = %d", Xin_tb, Yin_tb);
	$display ("Results:  Quotient = %d and Remainder = %d", 
					Quotient_tb, Remainder_tb);
	 #4;  // wait a little (4ns) (we want to show a little delay to represent
	             // that the Higher-Order system take a little time to respond)
	   Ack_tb = 1;	// Provide ACK
	@(posedge Clk_tb); // Wait for a clock
	 #1;
	   Ack_tb = 0;	// Remove ACK
// test #1 end

// test #2 begin
	@(posedge Clk_tb);
	 #2;
	   Xin_tb = 5;
	   Yin_tb = 8;
	   Start_tb = 1;	// After a little while provide START
	@(posedge Clk_tb); 
	 #5;
	   Start_tb = 0;	// After a little while remove START

	wait (Done_tb);

	$display ("Inputs:   Xin = %d and Yin = %d", Xin_tb, Yin_tb);
	$display ("Results:  Quotient = %d and Remainder = %d", 
					Quotient_tb, Remainder_tb);
	 #4;
	   Ack_tb = 1;	// Provide ACK
	@(posedge Clk_tb);
	 #1;
	   Ack_tb = 0;	// Remove ACK
// test #2 end

// test #3 begin
	@(posedge Clk_tb);
	 #2;
	   Xin_tb = 11;
	   Yin_tb = 3;
	   Start_tb = 1;	// After a little while provide START
	@(posedge Clk_tb);
	 #5;
	   Start_tb = 0;	// After a little while remove START

	wait (Done_tb);

	$display ("Inputs:   Xin = %d and Yin = %d", Xin_tb, Yin_tb);
	$display ("Results:  Quotient = %d and Remainder = %d", 
					Quotient_tb, Remainder_tb);
	 #4;
	   Ack_tb = 1;	// Provide ACK
	@(posedge Clk_tb);
	 #1;
	   Ack_tb = 0;	// Remove ACK
// test #3 end


// test #4 begin
	@(posedge Clk_tb);
	 #2;
	   Xin_tb = 15;
	   Yin_tb = 1;
	   Start_tb = 1;	// After a little while provide START
	@(posedge Clk_tb);
	 #5;
	   Start_tb = 0;	// After a little while remove START

	wait (Done_tb);

	$display ("Inputs:   Xin = %d and Yin = %d", Xin_tb, Yin_tb);
	$display ("Results:  Quotient = %d and Remainder = %d", 
					Quotient_tb, Remainder_tb);
	 #4;
	   Ack_tb = 1;	// Provide ACK
	@(posedge Clk_tb);
	 #1;
	   Ack_tb = 0;	// Remove ACK
// test #4 end

	// $finish;  This will try to close the ModelSim. 
	//           So we commented it out
  end // STIMULUS


endmodule  // divider_tb
