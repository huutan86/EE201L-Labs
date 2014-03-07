`timescale 1ns / 1ps

//----------------------------------------------------------------------------------
// Design Name:    Unsigned Matrix Multiplication  C(m x p) = A(m x n) * B(n x p) 
// File name: matrix_multiplication_tb.v
// Module Name:    matrix_multiplication_tb  (Testbench) 
// Written by Hoang Le and Gandhi Puvvada
// Date: 3/3/2009, 3/13/2010
//----------------------------------------------------------------------------------

module matrix_multiplication_tb;

localparam
	 M_VALUE          = 2,
	 N_VALUE          = 8,
	 P_VALUE          = 3,
	 M_ADDRESS_WIDTH  = 1,
	 N_ADDRESS_WIDTH  = 3,
	 P_ADDRESS_WIDTH  = 2,

	 DATA_WIDTH       = 4,
	
	 CLOCK_PERIOD   = 20;
	
localparam
	 QINIT     = 3'b001,
	 QCOMPUTE  = 3'b010,
	 QDONE     = 3'b100,
	 QUNK      = 3'bXXX;

	reg [4*8:1] state_string; // to display states in symbolic names in the waveform

	// Inputs to the UUT
	reg clk;
	reg reset;
	reg start;
	reg ack;
	// reg [DATA_WIDTH-1:0] din;

	// Outputs from the UUT
	wire done;

	// Instantiate the Unit Under Test (UUT)
	// (clk, reset, m_1_value, n_1_value, p_1_value, start, ack, done)
	matrix_multiplication #(.M_VALUE(M_VALUE), .N_VALUE(N_VALUE), .P_VALUE(P_VALUE), 
	 .M_ADDRESS_WIDTH(M_ADDRESS_WIDTH), .N_ADDRESS_WIDTH(N_ADDRESS_WIDTH), .P_ADDRESS_WIDTH(P_ADDRESS_WIDTH),
	 .DATA_WIDTH(DATA_WIDTH)) 
	UUT (
		.clk(clk), .reset(reset),
		.start(start), .ack(ack), .done(done)
		);

	// Internal variables
	integer fileA, fileB, fileC, arg_count;
	integer ind_m, ind_n, ind_p; // local indices similar to i,k, j
	// integer num_A [0:N_VALUE-1];
	// integer num_B [0:P_VALUE-1];
	reg [DATA_WIDTH-1:0] num_A [0:N_VALUE-1];
	reg [DATA_WIDTH-1:0] num_B [0:P_VALUE-1];
	
	reg [2*DATA_WIDTH+N_ADDRESS_WIDTH-1:0] num_C[0:M_VALUE-1][0:P_VALUE-1];
	// Actually we do not need m x p temporary locations for the number C in the
	// test bench, as we deal with one row at a time. So, we should be able to
	// manage with p temporary locations for the p items in a row.
	// A little more thought reveals to us that for all the three items
	// (num_A, num_B, num__C), we need only one temporary location each
	// as we read or write one item in a row at a time. Further num_A
	// single item and num_B single item can be combined into one num_AB as
	// num_A and num_B are of the same size ([DATA_WIDTH-1:0]).
	// The iteger data type for num_A and num_B may not hurt as data read
	// will be interpreted as positive (in the absence of a minus in the 
	// input numbers. But a similar integer declaration for num_C would
	// treat the result as a signed number.
	
	// The above declaration can be avoided by rewriting the following two lines
	// below as shown.
	/* Lines to be re-written
	num_C[ind_m][ind_p] = UUT.C[ind_m][ind_p];
	$sformat(string, "%s\t%d", string, num_C[ind_m][ind_p]);
	*/
	/* The above two lines can be re-written as
	$sformat(string, "%s\t%d", string, UUT.C[ind_m][ind_p]);
	*/
	reg [256*8:1] string; // a maximum of 256 characters can be stored in this string
	integer  Clk_cnt, Start_clock_count, Clocks_taken;
	
	/*
	File reading and writing: Here, we need to read the two input files, input_A.txt
	for the A matrix (a m x n matrix) and the input_B.txt for the B matrix (a n x p) 
	matrix. And finally write to the output_results.txt the C matrix (a m x p matrix).
	We read a line (a row) at a time and write a line (a row) at a time.
	The m x n A matrix has m rows, so m lines, each with n numbers are to be read.
	The n numbers in a row of A matrix are read into num_A [0:N_VALUE-1] locations.
	Similarly, the p numbers of a row of the B matrix (a n x p matrix) are read
	into the num_B [0:P_VALUE-1] integer registers.
	*/
	
	// Task to read stimuli from files
	task read_A_B_matrices;
		begin
			$display("\nMatrix A");
			fileA = $fopen("input_A.txt", "r");
			for (ind_m=0; ind_m<M_VALUE; ind_m=ind_m+1) // for all the rows in the file
				begin  // for each row in the file
					string = "\n"; // start the growing string with a new line character
					// The 256 character string variable is padded with zeros on the left
					// Zeros are null characters and are not printed later.
					for (ind_n=0; ind_n<N_VALUE; ind_n=ind_n+1) // for all the items in a row
						begin // for each item in the row 
							arg_count = $fscanf(fileA, "%d", num_A[ind_n]); // read one item
							$sformat(string, "%s\t%d", string, num_A[ind_n]); 
							// the previous value of the "string" is concatenated with the 
							// the item read (represented in decimal format in this string)
							// to form the new string
							UUT.A[ind_m][ind_n] = num_A[ind_n];
							// The item read is deposited into the matrix A in the UUT.
							// This kind of initialization of the matrix by test bench
							// is perhaps not the best way. But, you do not design 
							// matrix multiplier as a separate component as it needs  
							// access to the input and output matrices which belong to 
							// the higher system. So, the higher system design usually  
							// includes the matrix multiplier design in its design (rather 
							// than defining it as a separate component).
						end
					$display("%s", string);	// display the line on the console
				end
			$fclose(fileA);
			
			$display("\nMatrix B");
			fileB = $fopen("input_B.txt", "r");
			for (ind_n=0; ind_n<N_VALUE; ind_n=ind_n+1)
				begin
					string = "\n";
					for (ind_p=0; ind_p<P_VALUE; ind_p=ind_p+1)
						begin
							arg_count = $fscanf(fileB, "%d", num_B[ind_p]);
							$sformat(string, "%s\t%d", string, num_B[ind_p]);
							UUT.B[ind_n][ind_p] = num_B[ind_p];
						end
					$display("%s", string);	
				end
			$fclose(fileB);

			end
	endtask
	
	// Task to read the result from UUT and write it out to the output file, output_results.txt
	task read_C_Matrix;
		begin
			fileC = $fopen("output_results.txt", "w");
			$display("\n Result of C = A x B is\n");
			$fdisplay(fileC, "\n Result of C = A x B is\n");
			for (ind_m=0; ind_m<M_VALUE; ind_m=ind_m+1) // for all the rows in the matrix
				begin // for each row (there are p items in a row)
					string = "\n";
					for (ind_p=0; ind_p<P_VALUE; ind_p=ind_p+1)
						begin
							num_C[ind_m][ind_p] = UUT.C[ind_m][ind_p];
							$sformat(string, "%s\t%d", string, num_C[ind_m][ind_p]);
						end	
					$display("%s", string);
					$fwrite(fileC, "%s\n\n", string);
				end	
			$display ("\n Clocks_taken = %d . \n", Clocks_taken);
			$fdisplay (fileC, "\n Clocks_taken = %d . \n", Clocks_taken);
			$fclose(fileC);
		end
	endtask
	
	initial begin	
		// Initialize Inputs to UUT
		reset = 1;
		start = 0;
		ack = 0;
		
		// Wait 2 clock periods and inactivate reset
		@(posedge clk); @(posedge clk); #(CLOCK_PERIOD/5);
		reset = 0;
		
		// Add stimulus here
		read_A_B_matrices;
		@(posedge clk); #(CLOCK_PERIOD/5);
		start = 1;
		@(posedge clk); #(CLOCK_PERIOD/5);
		start = 0;
		Start_clock_count = Clk_cnt;
		
		// Wait for done signal
		@(posedge done); #(CLOCK_PERIOD/5);
		Clocks_taken = Clk_cnt - Start_clock_count;
		read_C_Matrix;
		
		// Acknowledge the receipt of the results
		@(posedge clk); #(CLOCK_PERIOD/5);
		ack = 1;
		@(posedge clk); #(CLOCK_PERIOD/5);
		ack = 0;
		
	end
      
	initial begin: clock_generator
		clk = 0;
		forever begin
			#(CLOCK_PERIOD/2); clk = ~ clk; 
		end
	end
	
	initial
	  begin  : CLK_COUNTER
		Clk_cnt = 0;
		#(CLOCK_PERIOD * 0.6); // wait unti a little after the positive edge
		forever
		  begin
			#(CLOCK_PERIOD) Clk_cnt <= Clk_cnt + 1;
		  end 
	  end
	 
	  always @(*)
		  case (UUT.state) // UUT.state works here only in presynthesis simulation
			QINIT   	:		state_string = " ini";
			QCOMPUTE	:		state_string = "comp";
			QDONE  		:		state_string = "done";
			default  	: 		state_string = "unkn";
		  endcase

endmodule

