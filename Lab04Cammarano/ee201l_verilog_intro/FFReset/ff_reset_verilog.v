//----------------------------------------------------------------------------
//	A verilog module for a ff_reset (based on my vhdl module ff_reset.vhd)

//	Written by Gandhi Puvvada  Date: 2/15/2008

//	File name: ff_reset.v

//      Analyze and simulate for 550ns in modelsim. 
//      Answer all questions posted below.
//----------------------------------------------------------------------------
// When you compile this design in synopsys, use the following command so that,
// the mapped design can NOT use complex cells with builtin muxes. 
//    set_dont_use lcb500kv/FDS*
//----------------------------------------------------------------------------
/*       The flip-flop outputs are:
              Q_bad_r      =  The BAD coding results in treating the RESET 
                               as a Data-enable control.
              Q_async_r    =  FF with asynchronous reset
              Q_sync_r     =  FF with synchronous reset
              Q_no_r       =  FF with no reset at all
              Q_async_r_de =  FF with asynchronous reset with Data Enable
              Q_sync_r_de  =  FF with synchronous reset with Data Enable
              Q_no_r_de    =  FF with Data Enable but no reset at all 
                                (suitable for data registers)
  
          -- Analyze the first 3 or 4 clocks (clock count Clk_CNT = 0 to 3).
             Initally why some FF outputs were undefined and some were defined?
             FFs which started with unknown output differed in the time when 
             they came out of that unknown state to a known value.
				 
				 Some of the outputs were undefined because the clock signal begins as low.
				 The Q_bad_r flip flop starts as undefined because of the faulty if-else logic
				 governing its reset and D values. If reset is low, it keeps the previous value,
				 which, at this point, was undefined. The Q_no_r_de
  
          -- Why Flip-flops differed at the beginning of clock count 7 and why 
             again at the beginning of clock count 8 the FF outputs became 
             the same?
  
				 The flip flops Q_no_r and Q_no_r_de do not remain the same as the other flip flops at
				 clock 7 because they do not reveive input from reset (which becomes low), where as the
				 other flip flops do. At clock 8, the de signal goes to zero, causing the two flip flops
				 to match the other flip flops.
					
          -- Differences during clock count 12
			 
				 The Q_bad_r flip flop outputs D, unlike the other flip flops, because it does not reset on the
				 reset signal like the other flip-flops.
  
          -- Differences at the beginning of clock count 13
			 
				 No observed difference.
  
          -- Why didn't inactivating the data_enable between 
             clock count 14 and 15 did not produce any differences 
             between the FF outputs?
				 
				 Reset has the highest priority within the if-else statements in the flip flop logic.
*/ //-----------------------------------------------------------------------------
module ff_reset (
    D, Clk, Reset_b, de, // de = Data Enable
    Q_bad_r, Q_async_r, Q_sync_r, Q_no_r,
    Q_async_r_de, Q_sync_r_de, Q_no_r_de	);

input  D, Clk, Reset_b, de;
output Q_bad_r, Q_async_r, Q_sync_r, Q_no_r ;
output Q_async_r_de, Q_sync_r_de, Q_no_r_de ;
reg Q_bad_r, Q_async_r, Q_sync_r, Q_no_r ;
reg Q_async_r_de, Q_sync_r_de, Q_no_r_de ;


	// Flip-flop with BAD reset
	// This Reset_b acts like high active data-enable control!
//------------
  always @(posedge Clk, posedge Reset_b) 
    begin	: FF_BAD_R					
        if (!Reset_b)
		    ; // nothing to do
        else
				Q_bad_r <= D;
    end
//------------

	// Flip-flop with asynchronous reset
//------------
  always @(posedge Clk, posedge Reset_b) 
    begin	: FF_ASYNC_R					
        if (!Reset_b)
		Q_async_r <= 1'b0;
        else
		Q_async_r <= D;
    end
//------------

	// Flip-flop with synchronous reset
//------------
	always @(posedge Clk) begin : FF_SYNC_R					
		if (!Reset_b)
			Q_sync_r <= 1'b0;	// TODO
		else
			Q_sync_r <= D;
	end
//------------

	// Flip-flop without reset
//------------
  always @(posedge Clk) 
    begin	: FF_NO_R				
		Q_no_r <= D;
    end
//------------


	// Flip-flop with asynchronous reset and Data Enable (de)
//------------
	always @(posedge Clk, posedge Reset_b) begin : FF_ASYNC_R_DE					
		if (!Reset_b)
			Q_async_r_de  <= 1'b0;	// TODO
		else if (de)
		Q_async_r_de  <= D;
	end
//------------


	// Flip-flop with synchronous reset and Data Enable (de)
//------------
  always @(posedge Clk) 
    begin	: FF_SYNC_R_DE					
        if (!Reset_b)
		Q_sync_r_de  <= 1'b0;	// TODO
        else if (de)
		Q_sync_r_de  <= D;
    end
//------------


	// Flip-flop without reset but with Data Enable (de)
//------------
  always @(posedge Clk) 
    begin	: FF_NO_R_DE					
      if (de)
		Q_no_r_de <= D;
    end
//------------

endmodule
