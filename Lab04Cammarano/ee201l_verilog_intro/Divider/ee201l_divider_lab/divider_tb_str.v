// ----------------------------------------------------------------------
// 	A Verilog module to test the divider described in divider.v
//
// 	Written by Gandhi Puvvada  Date: 7/17/98, 2/15/2008, 10/13/08
//
//      File name: divider_tb_str.v 
// ------------------------------------------------------------------------
//	In this testbench, we are using a task.
//	This is an improvement over divider_tb.v
// We kept the module name same as divider_tb.
// So, between divider_tb.v and divider_tb_str.v, the file, which was 
// mostly recently compiled, will define the behavior of the compiled module divider_tb.
// ------------------------------------------------------------------------

`timescale 1 ns / 100 ps
module divider_tb ;

reg [3:0] Xin_tb, Yin_tb;
reg Start_tb, Ack_tb, Clk_tb, Reset_tb;
wire Done_tb;
wire [3:0] Quotient_tb, Remainder_tb;
wire  Qi_tb, Qc_tb, Qd_tb;

parameter HALF_PERIOD = 20;


divider divider_1 (Xin_tb, Yin_tb, Start_tb, Ack_tb, Clk_tb, Reset_tb, 
				Done_tb, Quotient_tb, Remainder_tb, Qi_tb, Qc_tb, Qd_tb);

initial
  begin  : CLK_GENERATOR
    Clk_tb = 0;
    forever
       begin
	  #HALF_PERIOD Clk_tb = ~Clk_tb;
       end 
  end

initial
  begin  : RESET_GENERATOR
    Reset_tb = 1;
    #(4 * HALF_PERIOD) Reset_tb = 0;
  end

task TEST_DIVISION;
 input [3:0] X_value, Y_value;
   begin
   // Note: Between Line A and Line B below,
   // we have placed one copy of the repeated code in divider_tb.v
   // with the only difference in the two lines
   // Xin_tb = X_value;  and Yin_tb = Y_value;
   // We wish to call the task later with specific values for X_value and Y_value.
   // Line A    
	@(posedge Clk_tb);
	 #2;  // a little (2ns) after the clock edge
	   Xin_tb = X_value;
	   Yin_tb = Y_value;
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
	 // Line B
   end
 endtask

initial
  begin  : STIMULUS
	   Xin_tb = 8;		// initial values
	   Yin_tb = 4'b0100;    // these are not important
	   Start_tb = 0;		// except for avoiding red color
	   Ack_tb = 0;          // in the initial portion of the waveform.

	wait (Reset_tb);    // wait until reset is over
	@(posedge Clk_tb);    // wait for a clock

// test #1 begin
	TEST_DIVISION (15, 7);
// test #1 end

// test #2 begin
	TEST_DIVISION (5, 8);
// test #2 end

// test #3 begin
	TEST_DIVISION (11, 3);
// test #3 end

	// $finish;  This will try to close the ModelSim
  end // STIMULUS


endmodule  // Divider_tb