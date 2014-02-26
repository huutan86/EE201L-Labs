`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:43:52 02/07/2014
// Design Name:   ee201_numlock_sm
// Module Name:   C:/Xilinx_projects/EE201L-Labs/Lab03Cammarano/ee201l_number_lock_verilog/ee201_numlock_sm_tb.v
// Project Name:  ee201l_number_lock_verilog
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ee201_numlock_sm
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ee201_numlock_sm_tb;

	// Inputs
	reg Clk;
	reg reset;
	reg u;
	reg z;

	// Outputs
	wire timerout;
	wire q_initial_state;
	wire q_g1get;
	wire q_g1;
	wire q_g10get;
	wire q_g10;
	wire q_g101get;
	wire q_g101;
	wire q_g1011get;
	wire q_g1011;
	wire q_opening;
	wire q_bad;

	// Instantiate the Unit Under Test (UUT)
	ee201_numlock_sm uut (
		.Clk(Clk), 
		.reset(reset), 
		.u(u), 
		.z(z), 
		.timerout(timerout), 
		.q_initial_state(q_initial_state), 
		.q_g1get(q_g1get), 
		.q_g1(q_g1), 
		.q_g10get(q_g10get), 
		.q_g10(q_g10), 
		.q_g101get(q_g101get), 
		.q_g101(q_g101), 
		.q_g1011get(q_g1011get), 
		.q_g1011(q_g1011), 
		.q_opening(q_opening), 
		.q_bad(q_bad)
	);

	initial begin
		Clk = 0;
	end
	
	always begin
		#100;
		Clk = ~ Clk;
	end
	
	initial begin
		reset = 1;
		#120;
		reset = 0;
	end
	
/*	
	//test case 1
	initial begin
		u = 0;
		#520; u = 1;
		#500; u = 0;
		#1000; u = 1;
		#500; u = 0;
		#500; u = 1;
		#500; u = 0;
	end

	initial begin
		z = 0;
		#1200; z = 1;
		#500; z = 0;
	end

	//test case 2
	initial begin u = 0; #520; u = 1;  #500; u = 0; #1000; u = 1; #500; u = 0; end
	initial begin z = 0; end
*/
	//test case 3
	initial begin u = 0; #520; u = 1;  #500; u = 0; #1000; u = 1; #500; u = 0; end
	initial begin z = 0; #1200; z = 1; #570; z = 0; #1250; z = 1; #500; z = 0;  end
      
endmodule

