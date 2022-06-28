`timescale 1ns / 1ps
`default_nettype none
/***************************************************************************
*
* Module: FullAdd.sv
*
* Author: Adam Taylor
* Date: June 28th, 2022
*
* This module implements a single-bit full adder
*
*
****************************************************************************/


module FullAdd(
    input wire logic a, b, cin,
    output logic s, cout
    );
    
    xor(s, a, b, cin);
    
    logic AandB, BandCin, AandCin;
    
    and(AandB, a, b);
    and(BandCin, b, cin);
    and(AandCin, a, cin);
    or(cout, AandB, BandCin, AandCin);
    
endmodule
