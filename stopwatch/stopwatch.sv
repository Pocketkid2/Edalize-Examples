`timescale 1ns / 1ps
`default_nettype none
/***************************************************************************
*
* Module: stopwatch.sv
*
* Author: Adam Taylor
* Class: ECEN 220 - Fall 2021
* Date: Tuesday, October 26th, 2021
*
* Description: This module combines 5 modulo counters to allow for 0.01s count, 0.1s count, 1.0s count, and 10s count
*
*
****************************************************************************/


module stopwatch(
        input wire logic clk, reset, run,
        output logic [3:0] digit0, digit1, digit2, digit3
    );
    
    // Define intermediate signals that will tell whether to increment each of the digit counters
    logic inc_d0, inc_d1, inc_d2, inc_d3;
    
    // 10ms counter
    mod_counter #(1000000, 20) TEN_MILLISEC_COUNTER (.clk(clk), .reset(reset), .increment(run), .rolling_over(inc_d0));
    
    // Digit 0 counter
    mod_counter #(10, 4) DIGIT_ZERO_COUNTER (.clk(clk), .reset(reset), .increment(inc_d0), .rolling_over(inc_d1), .count(digit0));
    
    // Digit 1 counter
    mod_counter #(10, 4) DIGIT_ONE_COUNTER (.clk(clk), .reset(reset), .increment(inc_d1), .rolling_over(inc_d2), .count(digit1));
    
    // Digit 2 counter
    mod_counter #(10, 4) DIGIT_TWO_COUNTER (.clk(clk), .reset(reset), .increment(inc_d2), .rolling_over(inc_d3), .count(digit2));
    
    // Digit 3 counter
    mod_counter #(6, 4) DIGIT_THREE_COUNTER (.clk(clk), .reset(reset), .increment(inc_d3), .count(digit3));
    
endmodule