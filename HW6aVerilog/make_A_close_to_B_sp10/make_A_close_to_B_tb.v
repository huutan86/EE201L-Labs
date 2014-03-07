// EE201L RTL Exercises
// make_A_close_to_B_tb.v
// Written by Suraj Abraham, Gandhi Puvvada 
// March 1, 2009, March 4, 2010
`timescale 1 ns / 100 ps

module make_A_close_to_B_tb ;

reg [11:0] Ain_tb, Bin_tb;
wire [11:0] A_tb;
reg Start_tb, Ack_tb, Clk_tb, Reset_tb;
wire Flag_tb;
wire  Qi_tb, Qc_tb, Qd_tb;
reg [4*8:1] state_string; // 4 character state string for displaying state in text mode in the waveform

integer  Clk_cnt, file_results;
reg [3:0] test_number = 0;

parameter CLK_PERIOD = 20;


make_A_close_to_B UUT (Ain_tb, Bin_tb, Start_tb, Ack_tb, Clk_tb, Reset_tb, 
				Flag_tb, Qi_tb, Qc_tb, Qd_tb, A_tb);

always @(*)
	begin
		case ({Qi_tb, Qc_tb, Qd_tb})
			3'b100: state_string = "INI ";
			3'b010: state_string = "ADJ ";
			3'b001: state_string = "DONE";
			default:  state_string = "UNKN";
		endcase
	end
				
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
	# (0.6 * CLK_PERIOD); // wait until a little after the positive edge
    forever
       begin
	      #(CLK_PERIOD) Clk_cnt = Clk_cnt + 1;
       end 
  end

  task run_test;
  integer Start_clock_count, Clocks_taken;
    begin
		// test begin
		@(posedge Clk_tb);
		#2;  // a little (2ns) after the clock edge
		Start_tb = 1;		// After a little while provide START
		@(posedge Clk_tb); // After waiting for a clock
		#5;
		Start_tb = 0;	// After a little while remove START
		Start_clock_count = Clk_cnt;
		wait (Qd_tb);  // wait until done
		#5;
		Clocks_taken = Clk_cnt - Start_clock_count;
		$fdisplay (file_results, "Test number  %d:  \n Ain = %d, Bin = %d, A_result = %d .", test_number, Ain_tb, Bin_tb, A_tb);
		$display  (              "Test number  %d:  \n Ain = %d, Bin = %d, A_result = %d .", test_number, Ain_tb, Bin_tb, A_tb);
		if (Flag_tb)
		$fdisplay (file_results, "    The flag was set. ");
		else
		$fdisplay (file_results, "    The flag was not set. ");
		if (Flag_tb)
		$display  (              "    The flag was set. ");
		else
		$display  (              "    The flag was not set. ");
		$fdisplay (file_results, "           Clock taken for this test = %0d. \n", Clocks_taken);
		$display ("           Clock taken for this test = %0d. \n", Clocks_taken);
		
		#4;  // wait a little (4ns) (we want to show a little delay to represent
	             // that the Higher-Order system takes a little time to respond)
		Ack_tb = 1;	// Provide ACK
		@(posedge Clk_tb); // Wait for a clock
		#1;
		Ack_tb = 0;	// Remove ACK
		// test  end
    end
  endtask
  
initial
  begin  : STIMULUS
       file_results = $fopen("output_results.txt", "w");
	   Ain_tb = 12'b000000001100;		// initial values
	   Bin_tb = 12'b000000011111;    // these are not important
	   Start_tb = 0;		// except for avoiding red color
	   Ack_tb = 0;          // in the initial portion of the waveform.

	wait (!Reset_tb);    // wait until reset is over
	@(posedge Clk_tb);    // wait for a clock

	
// test #1 begin
	Ain_tb = 138;
	Bin_tb = 312;
	test_number = test_number + 1;
	run_test; 
// test #1 end
	
// test #2 begin
	Ain_tb = 112;
	Bin_tb = 312;
	test_number = test_number + 1;
	run_test; 
// test #2 end

// test #3 begin
	Ain_tb = 132;
	Bin_tb = 312;
	test_number = test_number + 1;
	run_test; 
// test #3 end

// test #4 begin
	Ain_tb = 311;
	Bin_tb = 312;
	test_number = test_number + 1;
	run_test; 
// test #4 end

// test #5 begin
	Ain_tb = 312;
	Bin_tb = 312;
	test_number = test_number + 1;
	run_test; 
// test #5 end

// final messages
     $fdisplay (file_results, "\n All tests concluded.");
	 $fclose (file_results);
	 $display ("\n All tests concluded. Inspect the text file output_results.txt. \n Current Clock Count = %0d ", Clk_cnt);

	 $stop; // ends simulation and enters interactive mode
	// $finish;  This will try to close the ModelSim. 
	//           So we commented it out
  end // STIMULUS


endmodule  // make_A_close_to_B_tb