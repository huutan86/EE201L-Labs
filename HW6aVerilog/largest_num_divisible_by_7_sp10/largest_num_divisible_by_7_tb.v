// EE201L RTL Exercises
// largest_num_divisible_by_7_tb.v
// Written by Suraj Abraham, Gandhi Puvvada 
// March 1, 2009, March 4, 2010
 
`timescale 1 ns / 100 ps

module largest_num_divisible_by_7_tb ;

wire [7:0] Max_tb;
reg Start_tb, Ack_tb, Clk_tb, Reset_tb;
wire  Qi_tb, Ql_tb, Qdiv_tb, Qdf_tb, Qdnf_tb;

reg [4*8:1] state_string; // 4 character state string for displaying state in text mode in the waveform

integer  Clk_cnt, file_results; // file_results is a logical name for the physical file output_results.txt here.
reg [3:0] test_number = 0;
reg [127:0] M_tb;

localparam CLK_PERIOD = 20;

largest_num_divisible_by_7 UUT (Max_tb, Start_tb, Ack_tb, Clk_tb, Reset_tb, 
				 Qi_tb, Ql_tb, Qdiv_tb, Qdf_tb, Qdnf_tb);
				 
always @(*)
	begin
		case ({Qi_tb, Ql_tb, Qdiv_tb, Qdf_tb, Qdnf_tb})
			5'b10000: state_string = "INI ";
			5'b01000: state_string = "LD_X";
			5'b00100: state_string = "DIV ";
			5'b00010: state_string = "D_F ";
			5'b00001: state_string = "D_NF";
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
	      #(CLK_PERIOD) Clk_cnt <= Clk_cnt + 1;
       end 
  end

initial
  begin  : STIMULUS
	file_results = $fopen("output_results.txt", "w");
	test_number = 0;
	   M_tb = 128'h00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00; 
	   memory_initialization (M_tb);
                       // these initalization before reset are not important
	   Start_tb = 0;		// except for avoiding red color
	   Ack_tb = 0;          // in the initial portion of the waveform.

	wait (!Reset_tb);    // wait until reset is over
	@(posedge Clk_tb);    // wait for a clock

// test #1 begin
    // You should find 93H as the largest divisible_by_7 number
	// You will reach DONE_F state from LOAD_X state.
	M_tb = 128'h12_84_93_04_93_02_85_0E_34_23_83_90_04_64_97_34;
	test_number = test_number + 1;
	run_test (M_tb, test_number);

// test #1 end

// test #2 begin
    // This test should conclude that there is no divisible-by-7 number
	// You should reach the DONE_NF state from LOAD_X state.
	M_tb = 128'h00_01_39_53_00_68_73_91_61_39_29_59_60_39_56_73; 
	test_number = test_number + 1;
	run_test (M_tb, test_number);
	
// test #2 end

// test #3 begin
    // This test should conclude that there is no divisible-by-7 number
	// You should reach the DONE_NF state from DIV_N_UPD state.
	M_tb = 128'h01_00_39_53_00_68_73_91_61_39_29_59_60_39_56_73; 
	test_number = test_number + 1;
	run_test (M_tb, test_number);

// test #3 end

// test #4 begin
    // You should find 85H as the largest divisible_by_7 number
	// You will reach DONE_F state from DIV_N_UPD state.
	M_tb = 128'h85_00_39_53_00_68_73_91_62_38_29_59_60_38_56_73; 
	test_number = test_number + 1;
	run_test (M_tb, test_number);

// test #4 end

     $fdisplay (file_results, "All tests concluded.");
	 $fclose (file_results);
	 $display ("\n All tests concluded. Inspect the text file output_results.txt. \n Current Clock Count = %0d ", Clk_cnt);
	 
	 $stop;
	end // STIMULUS
	
/*
task memory_initialization; 
    input [127:0] M_local_tb;
	begin
		UUT.M[0]  = M_local_tb[7:0]; // notice the "." (DOT) notation for hierarchical 
        UUT.M[1]  = M_local_tb[15:8]; // referencing of signals hidden in UUT
        UUT.M[2]  = M_local_tb[23:16];
        UUT.M[3]  = M_local_tb[31:24];
        UUT.M[4]  = M_local_tb[39:32];
        UUT.M[5]  = M_local_tb[47:40];
        UUT.M[6]  = M_local_tb[55:48];
        UUT.M[7]  = M_local_tb[63:56];
        UUT.M[8]  = M_local_tb[71:64];
        UUT.M[9]  = M_local_tb[79:72];
        UUT.M[10] = M_local_tb[87:80];
        UUT.M[11] = M_local_tb[95:88];
        UUT.M[12] = M_local_tb[103:96];
        UUT.M[13] = M_local_tb[111:104];
        UUT.M[14] = M_local_tb[119:112];
        UUT.M[15] = M_local_tb[127:120]; 
	end
endtask
*/	
/*		
task memory_initialization; 
    input [127:0] M_local_tb;
	integer i;
	begin
		for (i=0; i<=15; i = i +1)
		UUT.M[i]  = {M_local_tb[(i*8)+7],M_local_tb[(i*8)+6],M_local_tb[(i*8)+5],M_local_tb[(i*8)+4],
					 M_local_tb[(i*8)+3],M_local_tb[(i*8)+2],M_local_tb[(i*8)+1],M_local_tb[(i*8)+0]};
	end
endtask
*/
task memory_initialization; 
    input [127:0] M_local_tb;   // we could have avoided passing argument for this task as all parent variables are visible to the task.
	integer i, j;
	begin
		for (i=0; i<=15; i = i +1)
		    for (j=0; j<=7; j = j +1)
		UUT.M[i][j]  = M_local_tb[(i*8)+j];
	end
endtask
		
task run_test;
	input [127:0] M_16x8_tb; // we could have avoided passing argument for this task as all parent variables are visible to the task.
	input [7:0] test_numb;   // we could have avoided passing argument for this task as all parent variables are visible to the task.
	integer Start_clock_count, Clocks_taken;
	begin
		// test begins
		@(posedge Clk_tb);
		#2;
		memory_initialization (M_16x8_tb);
		Start_tb = 1;	// After a little while provide START
		@(posedge Clk_tb); 
		#5;
		Start_tb = 0;	// After a little while remove START
		Start_clock_count = Clk_cnt;
		wait (Qdf_tb | Qdnf_tb);
		#5;
		Clocks_taken = Clk_cnt - Start_clock_count;
		if (Qdf_tb == 1) 
		   begin
		    $fdisplay (file_results, "Test number  %d: Found %d decimal = %h hex as the largest divisible by 7 number.", test_numb, Max_tb, Max_tb);
		    $display ("Test number %d: Found %d decimal = %h hex as the largest divisible by 7 number.", test_numb, Max_tb, Max_tb);
		   end
		else 
		   begin
		    $fdisplay (file_results, "Test number  %d: Could not find any divisible by 7 number.  Max_tb remained as %d. ", test_numb, Max_tb);	
		    $display ("Test number %d: Could not find any divisible by 7 number.  Max_tb remained as %d. ", test_numb, Max_tb);		
		   end
		$fdisplay (file_results, "           Clock taken for this test = %0d. \n", Clocks_taken);
		$display ("           Clock taken for this test = %0d. \n", Clocks_taken);
		#4;
		Ack_tb = 1;	// Provide ACK
		@(posedge Clk_tb);
		#1;
		Ack_tb = 0;	// Remove ACK
		// test ends
	end
endtask

endmodule  
