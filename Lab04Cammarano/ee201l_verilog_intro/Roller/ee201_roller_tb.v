`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Author:      Brandon Franzke
// Create Date: 2013-02-04
// Modified:      
// File Name:   ee201_roller_tb.v 
// Description: 
//
//
// Revision: 		1.0
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module ee201_roller_tb;

	// Inputs
	reg Clk;
	reg Reset;
	
	reg BtnL;
	//wire [3:0] X;
	wire [0:0] X;

	// Instantiate the Unit Under Test (UUT)
	/**
	TODO: complete parameter list
	check ee201_roller.v module
	**/
	ee201_roller UUT (
		.Clk(Clk),
		.Reset(Reset),
		.NewX(BtnL),
		.X(X)
	);		  
  
  
	// set to size of sample space (to allow tally print for each value)
	/**
	TODO: set to size of sample space  
	currently roll 1D20 (20-sided die = 0-19)
	  required so tb can print tally for each value
	**/  
	localparam
		//NUMBER_OPTION = 20;
		NUMBER_OPTION = 2;
		//NUMBER_OPTION = 6;
    

	initial begin
		// Initialize Inputs

		Clk = 0;
		Reset = 0;
		BtnL = 0;

		// Wait 100 ns for global reset to finish
		#100;
		Reset = 1;
		#10;		
		Reset = 0;
		#10;
		
		
		// [none]
	end
	
	always begin #5; Clk = ~ Clk; end
	
	
	
	/*
	 * !! DONT MODIFY ANYTHING BELOW !!
	 */
    
  integer i, k;
  integer COUNTS [NUMBER_OPTION-1:0];
  initial begin
    // initialize COUNTS to 0
    for(k=0; k<NUMBER_OPTION; k=k+1)
      COUNTS[k] = 0;
      
    forever
      begin
        // generate a number 0-49, press button if 49 (2%)
        i = $random()%50;
        BtnL = (i > 48);
      
        @(posedge Clk); #1;
        if(BtnL)
          // button pressed
          begin   
            // unpress
            BtnL = 0;
          
            // increment tally and display COUNTS
            COUNTS[X] = COUNTS[X] + 1;  
            for(k=0; k<NUMBER_OPTION; k=k+1)
              $write("%3d ", COUNTS[k]);
            $write("\n");
            
            // delay before possible to press again
            for(k=0; k<50; k=k+1)
              @(posedge Clk);
          end
    end
  end


endmodule

