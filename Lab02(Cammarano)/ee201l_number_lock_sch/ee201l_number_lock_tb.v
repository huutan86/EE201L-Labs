
`timescale 1ns / 1ps

module ee201l_number_lock_ee201l_number_lock_sch_tb();

// Inputs
   reg sysclk;
   reg reset;
   reg u;
   reg z;

// Output
   wire [10:0] state;

// Bidirs

// Instantiate the UUT
   ee201l_number_lock UUT (
		.sysclk(sysclk), 
		.reset(reset), 
		.state(state), 
		.u(u), 
		.z(z)
   );
// Initialize Inputs
initial begin sysclk = 0; end
always	begin #100; sysclk = ~ sysclk; end
initial begin reset = 1; #120; reset = 0; end

// Run test case 1, 2 and 3 and make sure by simulation that the design works
// as aspected. To run test case 2, comment the 2 lines of code for test case 1
// and uncomment the 2 lines of code below test case 2.

//test case 1
initial begin u = 0; #520; u = 1;  #500; u = 0; #1000; u = 1; #500; u = 0; #500; u = 1; #500; u = 0; end
initial begin z = 0; #1200; z = 1; #500; z = 0; end

//test case 2
//initial begin u = 0; #520; u = 1;  #500; u = 0; #1000; u = 1; #500; u = 0; end
//initial begin z = 0; end

//test case 3
//initial begin u = 0; #520; u = 1;  #500; u = 0; #1000; u = 1; #500; u = 0; end
//initial begin z = 0; #1200; z = 1; #570; z = 0; #1250; z = 1; #500; z = 0;  end
endmodule
