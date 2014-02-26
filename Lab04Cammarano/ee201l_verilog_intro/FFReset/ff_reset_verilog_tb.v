//------------------------------------------------------------------------------
//      A verilog testbench to test the ff_reset (based on my VHDL ff_reset_tb.vhd)

//	Written by Gandhi Puvvada  Date: 2/15/2008

//	File name: ff_reset_tb.v
//------------------------------------------------------------------------------

`timescale 1 ns / 100 ps

module ff_reset_tb (); // The empty parentheses are optional


        parameter Clk_period = 30;


reg	D_tb, Clk_tb, Reset_b_tb, De_tb;
wire	Q_bad_r_tb, Q_async_r_tb, Q_sync_r_tb, Q_no_r_tb; 
wire	Q_async_r_de_tb, Q_sync_r_de_tb, Q_no_r_de_tb ;
integer  Clk_cnt;

// instantiate the DUT (design Under Test> and optionally any other components

 ff_reset ff_reset_1 (
		  D_tb, Clk_tb, Reset_b_tb, De_tb,
		  Q_bad_r_tb, Q_async_r_tb, Q_sync_r_tb, Q_no_r_tb, 
		  Q_async_r_de_tb, Q_sync_r_de_tb, Q_no_r_de_tb
		  );

initial
  begin  : CLK_GENERATOR
    Clk_tb = 0;
    forever
       begin
	  #(Clk_period/2) Clk_tb = ~Clk_tb;
       end 
  end

initial
  begin  : RESET_GENERATOR
    Reset_b_tb = 0;
    #(2 * Clk_period) Reset_b_tb = 1;
  end

initial
  begin  : CLK_COUNTER
    Clk_cnt = 0;
    forever
       begin
	  #(Clk_period) Clk_cnt = Clk_cnt + 1;
       end 
  end

initial
  begin  : STIMULUS_D_tb

	#0                  D_tb = 1'b1; 
	#(Clk_period * 2.1) D_tb = 1'b0; 
	#(Clk_period * 1  ) D_tb = 1'b1; 
	#(Clk_period * 2  ) D_tb = 1'b0; 
	#(Clk_period * 1  ) D_tb = 1'b1; 
	#(Clk_period * 1  ) D_tb = 1'b0; 
	#(Clk_period * 1  ) D_tb = 1'b1; 
	#(Clk_period * 2  ) D_tb = 1'b0; 
	#(Clk_period * 1  ) D_tb = 1'b1; 
	#(Clk_period * 1  ) D_tb = 1'b0; 
	#(Clk_period * 3  ) D_tb = 1'b1; 
	#(Clk_period * 1  ) D_tb = 1'b0; 

   end


initial
  begin  : STIMULUS_Reset_b_tb 

	#0                  Reset_b_tb  = 1'b0; 
	#(Clk_period * 3.1) Reset_b_tb  = 1'b1; 
	#(Clk_period * 3  ) Reset_b_tb  = 1'b0; 
	#(Clk_period * 2  ) Reset_b_tb  = 1'b1; 
	#(Clk_period * 4  ) Reset_b_tb  = 1'b0; 
	#(Clk_period * 0.7) Reset_b_tb  = 1'b1; 

   end


initial
  begin  : STIMULUS_de_tb 

	#0                  De_tb  = 1'b0; 
	#(Clk_period * 2.3) De_tb  = 1'b1; 
	#(Clk_period * 6  ) De_tb  = 1'b0; 
	#(Clk_period * 1  ) De_tb  = 1'b1; 
	#(Clk_period * 5  ) De_tb  = 1'b0; 
	#(Clk_period * 0.5) De_tb  = 1'b1; 

   end

endmodule
//------------------------------------------------------------------------------
