`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:17:24 03/14/2014
// Design Name:   ee201_GCD
// Module Name:   C:/Xilinx_projects/EE201L-Labs/Lab08Cammarano/ee201_gcd_testbench/ee201_GCD_tb_part1.v
// Project Name:  ee201_gcd_testbench
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ee201_GCD
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ee201_GCD_tb_part3;

	// Inputs
	reg Clk;
	reg CEN;
	reg Reset;
	reg Start;
	reg Ack;
	reg [7:0] Ain;
	reg [7:0] Bin;

	// Outputs
	wire [7:0] A;
	wire [7:0] B;
	wire [7:0] AB_GCD;
	wire [7:0] i_count;
	wire q_I;
	wire q_Sub;
	wire q_Mult;
	wire q_Done;
	reg [6*8:0] state_string; 
	
	// Test output values
	reg[12:0] test_number = 0;
	integer Clk_cnt;
	integer Start_clock_count;
	integer Clocks_taken;
	integer file_results;
	integer a;
	integer b;
	
	// Parameters
	parameter CLK_PERIOD = 20;

	// Instantiate the Unit Under Test (UUT)
	ee201_GCD uut (
		.Clk(Clk), 
		.CEN(CEN), 
		.Reset(Reset), 
		.Start(Start), 
		.Ack(Ack), 
		.Ain(Ain), 
		.Bin(Bin), 
		.A(A), 
		.B(B), 
		.AB_GCD(AB_GCD), 
		.i_count(i_count), 
		.q_I(q_I), 
		.q_Sub(q_Sub), 
		.q_Mult(q_Mult), 
		.q_Done(q_Done)
	);

	initial begin : CLOCK_GENERATOR
		Clk = 0;
		
		forever begin
			# (CLK_PERIOD / 2) Clk = ~Clk;
		end
	end	
	
	initial begin : CLOCK_COUNTER
		Clk_cnt = 0;
		# (0.6 * CLK_PERIOD);
		forever begin
			#(CLK_PERIOD) Clk_cnt = Clk_cnt + 1;
		end
	end
	
	initial begin : RESET_GENERATOR
		Reset = 1;
		#(2 * CLK_PERIOD) Reset = 0;
	end
	
	task APPLY_STIMULUS;
		input [7:0] Ain_value;
		input [7:0] Bin_value;
		begin
			
			// Initialize Inputs
			Clk = 0;
			CEN = 1;
			Reset = 0;
			Start = 0;
			Ack = 0;
			Ain = 0;
			Bin = 0;

			// Wait for global reset to finish
			#100;
			
			// Test 1 GCD(24, 36)
			test_number = test_number + 1'b1;
			Clocks_taken = 0;
			Clk_cnt = 0;
			Start_clock_count = 0;
			
			Ain = Ain_value;
			Bin = Bin_value;

			#20;
			
			// Generate a reset
			Reset = 1;
			#20;
			Reset = 0;
			#20;
			
			// Generate a start pulse
			Start = 1;
			#40;
			Start = 0;
			Start_clock_count = Clk_cnt;
			
			// We set a delay for the state machine to run to completion

			wait(q_Done);
			@(negedge Clk);
			
			// Concluding test 1
			Clocks_taken = Clk_cnt - Start_clock_count;		
			
			// Display GCD information
			$fdisplay (file_results, "Test number  %0d: \n Ain = %0d, Bin = %0d, GCD = %0d .", test_number, Ain, Bin, AB_GCD);
			$display ("Test number  %0d: \n Ain = %0d, Bin = %0d, GCD = %0d .", test_number, Ain, Bin, AB_GCD);
			
			// Display Clock information
			$fdisplay (file_results, "Clocks taken for this test = %0d. \n", Clocks_taken);
			$display ("Clocks taken for this test = %0d. \n", Clocks_taken);
			
			Ack = 1;
			#20;
			Ack = 0;
			#20;	
		end
	
	endtask
	
	initial begin : STIMULUS
	
		file_results = $fopen("ee201_gcd_Part3_output.txt", "w");
		
		// Initialize Inputs
		Clk = 0;
		CEN = 1;
		Reset = 0;
		Start = 0;
		Ack = 0;
		Ain = 0;
		Bin = 0;
		
		Clocks_taken = 0;
		Clk_cnt = 0;
		Start_clock_count = 0;

		// Wait for global reset to finish
		wait (!Reset);    // wait until reset is over
		@(posedge Clk);    // wait for a clock
		
		// For loop for testing numbers 2-63
		for(a = 2; a <= 63; a = a + 1) begin
			for(b = 2; b <= 63; b = b + 1) begin

				APPLY_STIMULUS (a, b);
			end
		end
		$fdisplay(file_results, "\n All tests concluded.");
		$display("\n All tests concluded.");
		$stop;
	end
	
	always @(*) begin
		case ({q_I, q_Sub, q_Mult, q_Done})
			4'b1000: state_string = "q_I";  // ****** TODO ******
			4'b0100: state_string = "q_Sub";       // Fill-in the three lines
			4'b0010: state_string = "q_Mult";
			4'b0001: state_string = "q_Done";
		endcase
	end
      
endmodule

