`timescale 1ns / 1ps
`default_nettype none
/***************************************************************************
*
* Module: mod_counter.sv
*
* Author: Adam Taylor
* Class: ECEN 220 - Fall 2021
* Date: Tuesday, October 26th, 2021
*
* Description: This module is a modulo counter, with parameters for how many bits to count with, and which value to use as the modulo
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