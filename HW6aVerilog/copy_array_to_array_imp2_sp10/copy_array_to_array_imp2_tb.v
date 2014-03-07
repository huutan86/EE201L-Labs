// -------------------------------------------------------------------------------------
// Module: copy_array_to_array_imp2_tb 
// File: copy_array_to_array_imp2_tb.v (testbench for copy_array_to_array_imp2.v)
// By: Ananth Rampura Sheshagiri Rao , Gandhi Puvvada 
// Date: 10/26/2009, 1/31/2010, 3/13/2010
// -------------------------------------------------------------------------------------

`timescale 1 ns / 100 ps

module copy_array_to_array_imp2_tb; // notice empty port list

reg Reset, Clk;
reg Start, Ack;
wire [3:0] Ms_of_I;
// wire [3:0] Ns_of_J; // this is not needed actually
reg signed [3:0] signed_Ns_of_J; // To display elements of N as signed numbers
wire Ns_of_J_Write;
wire [3:0] I, J;
reg [3:0] Ms_of_I_array [9:0] , Ns_of_J_array [9:0];
// The above Ms_of_I_array is the active array. 
// One of the four arrays below is copied into the above array, one at a time.
reg [3:0] Ms_of_I_array1 [9:0], Ms_of_I_array2 [9:0], Ms_of_I_array3 [9:0], Ms_of_I_array4 [9:0];

parameter CLK_PERIOD = 20;

localparam
 INI   = 3'b000,
 LS2C  = 3'b001,
 CBC  = 3'b010,
 DONE  = 3'b100,
 UNKN  = 3'bxxx;
 
reg [4*8:1] state_string;

integer  Clk_cnt, Start_clock_count, Clocks_taken;

integer output_file; // file designator for output_results.txt file
reg [3:0] II_JJ; // Index into M and N array for console display and file output
localparam II_JJ_max  = 4'b1001;
reg [32*8:1] string; // a maximum of 32 characters can be stored in this string
 
task display_M_and_N_arrays;
  begin
	$display("\n The M and the N arrays \n");
	$fdisplay(output_file, "\n The M and the N arrays \n");
	for (II_JJ=0; II_JJ<=II_JJ_max; II_JJ=II_JJ+1) // for all the rows in the matrices
		begin // for each row (there are p items in a row)
			signed_Ns_of_J = Ns_of_J_array[II_JJ];
			string = "\n";
			$sformat(string, "%s\t%d", string, II_JJ); 	// Print the index II_JJ in the string
			$sformat(string, "%s\t%d", string, Ms_of_I_array[II_JJ]); 	// gather M[I] in the string in decimal
			$sformat(string, "%s\t%b", string, Ms_of_I_array[II_JJ]); 	// gather M[I] in the string in binary
			$sformat(string, "%s\t%b", string, Ns_of_J_array[II_JJ]);	// gather N[J] in the string in binary
			$sformat(string, "%s\t%d", string, signed_Ns_of_J);			// gather N[J] in the string in decimal
			$display("%s", string);
			$fwrite(output_file, "%s\n", string);
		end	
	$display ("\n Clocks_taken = %d . \n", Clocks_taken);
	$fdisplay (output_file, "\n Clocks_taken = %d . \n", Clocks_taken);

  end
endtask 

// Instantiating core RTL block in the testbench
copy_array_to_array_imp2 UUT (Reset, Clk, Start, Ack, Ms_of_I, Ns_of_J_Write, I, J);

initial 
   begin
	output_file = $fopen ("output_results.txt", "w"); // create the file "output_results.txt" and open it for writing
   end
   
initial 
   begin 
      Reset <= 1;
      Start <= 0;
      Ack   <= 0;
	  @(posedge Clk); #(CLK_PERIOD/5); // After waiting for a clock (and a little)
      Reset <= ~Reset; // going out of Reset  
	  
	  $display("\n Implementation #2 results \n");
	  $fdisplay(output_file, "\n Implementation #2 results \n");	  
	  
	  // Test #1: Negative numbers start from M[3] 
	  @(posedge Clk); #(CLK_PERIOD/5); // After waiting for a clock (and a little)
	  $display("\n Test #1: Negative numbers start from M[3] \n");
	  $fdisplay(output_file, "\n Test #1: Negative numbers start from M[3] \n");
	  simulate_with_given_array (
					{Ms_of_I_array1[9],
					 Ms_of_I_array1[8],
					 Ms_of_I_array1[7],
					 Ms_of_I_array1[6],
					 Ms_of_I_array1[5],
					 Ms_of_I_array1[4],
					 Ms_of_I_array1[3],
					 Ms_of_I_array1[2],
					 Ms_of_I_array1[1],
					 Ms_of_I_array1[0]}
					);

	// Test #2: Last number negative
	  @(posedge Clk); #(CLK_PERIOD/5); // After waiting for a clock (and a little)
	  $display("\n Test #2: Last number negative \n");
	  $fdisplay(output_file, "\n Test #2: Last number negative \n");
	  simulate_with_given_array (
					{Ms_of_I_array2[9],
					 Ms_of_I_array2[8],
					 Ms_of_I_array2[7],
					 Ms_of_I_array2[6],
					 Ms_of_I_array2[5],
					 Ms_of_I_array2[4],
					 Ms_of_I_array2[3],
					 Ms_of_I_array2[2],
					 Ms_of_I_array2[1],
					 Ms_of_I_array2[0]}
					);
	  
	// Test #3: All numbers negative
	  @(posedge Clk); #(CLK_PERIOD/5); // After waiting for a clock (and a little)
	  $display("\n Test #3: All numbers negative \n");
	  $fdisplay(output_file, "\n Test #3: All numbers negative \n");
	  simulate_with_given_array (
					{Ms_of_I_array3[9],
					 Ms_of_I_array3[8],
					 Ms_of_I_array3[7],
					 Ms_of_I_array3[6],
					 Ms_of_I_array3[5],
					 Ms_of_I_array3[4],
					 Ms_of_I_array3[3],
					 Ms_of_I_array3[2],
					 Ms_of_I_array3[1],
					 Ms_of_I_array3[0]}
					);
	  
	// Test #4: All numbers positive
	  @(posedge Clk); #(CLK_PERIOD/5); // After waiting for a clock (and a little)
	  $display("\n Test #4: All numbers positive \n");
	  $fdisplay(output_file, "\n Test #4: All numbers positive \n");
	  simulate_with_given_array (
					{Ms_of_I_array4[9],
					 Ms_of_I_array4[8],
					 Ms_of_I_array4[7],
					 Ms_of_I_array4[6],
					 Ms_of_I_array4[5],
					 Ms_of_I_array4[4],
					 Ms_of_I_array4[3],
					 Ms_of_I_array4[2],
					 Ms_of_I_array4[1],
					 Ms_of_I_array4[0]}
					);

					
	$display("\n All tests completed. \n");
	$fdisplay(output_file, "\n All tests completed. \n");
	$fclose(output_file);				
	end
	
task simulate_with_given_array;
 input [39:0] passed_on_array_bits;
 begin
	Ms_of_I_array [0] = passed_on_array_bits [ 3: 0];
	Ms_of_I_array [1] = passed_on_array_bits [ 7: 4];
	Ms_of_I_array [2] = passed_on_array_bits [11: 8];
	Ms_of_I_array [3] = passed_on_array_bits [15:12];
	Ms_of_I_array [4] = passed_on_array_bits [19:16];
	Ms_of_I_array [5] = passed_on_array_bits [23:20];
	Ms_of_I_array [6] = passed_on_array_bits [27:24];
	Ms_of_I_array [7] = passed_on_array_bits [31:28];
	Ms_of_I_array [8] = passed_on_array_bits [35:32];
	Ms_of_I_array [9] = passed_on_array_bits [39:36];

	Start <= 0;
      Ack   <= 0;
	  @(posedge Clk); #(CLK_PERIOD/5); // After waiting for a clock (and a little)
      Start <= 1;
	  @(posedge Clk); #(CLK_PERIOD/5); // After waiting for a clock (and a little)
      Start <= 0;	
	  Start_clock_count = Clk_cnt;
	  // wait until the UUT reaches DONE state and then send Ack
	  @(posedge UUT.state[2]);  // DONE  state is given the one-hot code 3'b100 
	  #(CLK_PERIOD/5);
	  // The above two lines work only in pre-synthesis simulation (behavioral simulation).
	  // General guide line is to write a testbench which works fine with the pre-synthesis 
	  // core design as well as post-synthesis netlist. This is to make sure that, we did not
	  // write code creating simulation/synthesis mismatch.
	  // Unlike, in other coding examples, here, we did not bring state flip-flop outputs 
	  // to the top. Hence the synthesis tool has liberty in changing the state coding
	  // from one-hot to encoded state assignment (unless we use special attribute
	  // (* fsm_encoding = "user" *)
	  // Refer to ee201_debounce_DPB_SCEN_CCEN_MCEN.v for an example this attribute usage.
	  // One alternative is to use the condition (J == 4'b1010) as an indication of reaching
	  // the DONE state. We did not want to take this approach as incorrect student designs 
	  // may have J reaching ten before going to the DONE state. 
	  Clocks_taken = Clk_cnt - Start_clock_count;
	  display_M_and_N_arrays; // call the task to display the contents
	  Ack <= 1;
	  @(posedge Clk); #(CLK_PERIOD/5); // After waiting for a clock (and a little)
	  Ack <= 0;
   end
endtask

initial 
   begin
    // Initializing Ms_of_I with some test values
      
    // Negative numbers start from M[3]
      Ms_of_I_array1[0] <= 4'b0010;
      Ms_of_I_array1[1] <= 4'b0101;
      Ms_of_I_array1[2] <= 4'b0111;    
      Ms_of_I_array1[3] <= 4'b1001; // first negative
      Ms_of_I_array1[4] <= 4'b1010;
      Ms_of_I_array1[5] <= 4'b1011;
      Ms_of_I_array1[6] <= 4'b1100;
      Ms_of_I_array1[7] <= 4'b1101;
      Ms_of_I_array1[8] <= 4'b1110;
      Ms_of_I_array1[9] <= 4'b1111;

	// Last number negative
      Ms_of_I_array2[0] <= 4'b0000;
      Ms_of_I_array2[1] <= 4'b0001;
      Ms_of_I_array2[2] <= 4'b0010;    
      Ms_of_I_array2[3] <= 4'b0011; 
      Ms_of_I_array2[4] <= 4'b0100;
      Ms_of_I_array2[5] <= 4'b0101;
      Ms_of_I_array2[6] <= 4'b0110;
      Ms_of_I_array2[7] <= 4'b0111;
      Ms_of_I_array2[8] <= 4'b0111;
      Ms_of_I_array2[9] <= 4'b1001; // first negative

	// All numbers negative
      Ms_of_I_array3[0] <= 4'b1000; // first negative
      Ms_of_I_array3[1] <= 4'b1000;
      Ms_of_I_array3[2] <= 4'b1000;    
      Ms_of_I_array3[3] <= 4'b1001; 
      Ms_of_I_array3[4] <= 4'b1010;
      Ms_of_I_array3[5] <= 4'b1011;
      Ms_of_I_array3[6] <= 4'b1100;
      Ms_of_I_array3[7] <= 4'b1101;
      Ms_of_I_array3[8] <= 4'b1110;
      Ms_of_I_array3[9] <= 4'b1111;

    // All numbers positive
      Ms_of_I_array4[0] <= 4'b0000;
      Ms_of_I_array4[1] <= 4'b0000;
      Ms_of_I_array4[2] <= 4'b0000;    
      Ms_of_I_array4[3] <= 4'b0001; 
      Ms_of_I_array4[4] <= 4'b0010;
      Ms_of_I_array4[5] <= 4'b0011;
      Ms_of_I_array4[6] <= 4'b0100;
      Ms_of_I_array4[7] <= 4'b0101;
      Ms_of_I_array4[8] <= 4'b0110;
      Ms_of_I_array4[9] <= 4'b0111;
      
   end

// generating Clk of 20 ns period
	initial begin: clock_generator
		Clk = 0;
		forever begin
			#(CLK_PERIOD/2) Clk = ~Clk; 
		end
	end


initial
  begin  : CLK_COUNTER
	Clk_cnt = 0;
	#(CLK_PERIOD * 0.6); // wait unti a little after the positive edge
	forever
	  begin
		#(CLK_PERIOD) Clk_cnt <= Clk_cnt + 1;
	  end 
  end
  
assign #1 Ms_of_I = Ms_of_I_array[I];

// Capturing data from RTL into memory
always @ (posedge Clk) 
        begin
			if (Ns_of_J_Write == 1)
		      begin
                Ns_of_J_array[J] <= Ms_of_I_array[I];
			  end
		end 

always @(*)
  case (UUT.state) // UUT.state works here only in presynthesis simulation
	INI   :		state_string = "ini";
	LS2C  :		state_string = "ls2c";
	CBC  :		state_string = "cbc";
	DONE  :		state_string = "done";
	default  : 	state_string = "unkn";
  endcase
  
endmodule