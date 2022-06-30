`timescale 1ns / 1ps
`default_nettype none
/***************************************************************************
*
* Module: mod_counter.sv
*
* Author: Adam Taylor
* Date: June 30th, 2022
*
* MOD_VALUE determines when rollover happens
* BITS determines how large the counter is (0...2^n-1)
*
*
****************************************************************************/


module mod_counter #(parameter MOD_VALUE=10, BITS=4) (
        input wire logic clk, reset, increment,
        output logic rolling_over, 
		output logic [BITS-1:0] count
    );
    
    always_ff @(posedge clk)
      if (reset && !increment)
        count <= 0;
      else if (!reset && increment)
        count <= (count + 1) % MOD_VALUE;
        
    assign rolling_over = increment && (count == (MOD_VALUE-1));
    
endmodule