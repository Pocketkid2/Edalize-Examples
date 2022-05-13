`timescale 1ns / 1ps
`default_nettype none
/***************************************************************************
*
* Module: FullAdd.sv
*
* Author: Adam Taylor
* Class: ECEN 220 - Fall 2021
* Date: Tuesday, Sep 28, 2021
*
* Description: This file implements a single-bit full adder
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