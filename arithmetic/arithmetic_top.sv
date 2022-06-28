`timescale 1ns / 1ps
`default_nettype none
/***************************************************************************
*
* Module: arithmetic_top.sv
*
* Author: Adam Taylor
* Date: June 28th, 2022
*
* The top module for adding the switch data and displaying it over LED
*
*
****************************************************************************/


module arithmetic_top(
    input wire logic [15:0] sw,
    input wire logic sub,
    output logic [7:0] led,
    output logic overflow
    );
    
    // Define an 8 bit wire for B, which will be inverted by the XOR gates if we are doing subtraction
    logic [7:0] b;
    
    xor(b[0], sw[8], sub);
    xor(b[1], sw[9], sub);
    xor(b[2], sw[10], sub);
    xor(b[3], sw[11], sub);
    xor(b[4], sw[12], sub);
    xor(b[5], sw[13], sub);
    xor(b[6], sw[14], sub);
    xor(b[7], sw[15], sub);
    
    // Call main adder using subtract flag as the carry in and the 8 bit B wire for the B input
    Add8 ADDER(.a(sw[7:0]), .b(b), .cin(sub), .s(led));
    
    // Check for overflow by first creating a signal for inverted sign bits (the left most bit)
    logic not_sign_a, not_sign_b, not_sign_sum;
    
    // sw[7]  is the leftmost bit of A
    // b[7]   is the leftmost bit of B
    // led[7] is the leftmost bit of S (sum)
    not(not_sign_a, sw[7]);
    not(not_sign_b, b[7]);
    not(not_sign_sum, led[7]);
    
    // Create two wires for the results of each product for the overflow sum-of-product expression
    logic ABnotS, AnotBnotS;
    
    and(ABnotS, sw[7], b[7], not_sign_sum);
    and(AnotBnotS, not_sign_a, not_sign_b, led[7]);
    
    or(overflow, ABnotS, AnotBnotS);
    
endmodule