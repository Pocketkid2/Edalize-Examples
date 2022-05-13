`timescale 1ns / 1ps
`default_nettype none
/***************************************************************************
*
* Module: FunRegister
*
* Author: Adam Taylor
* Class: ECEN 220, Section 1, Fall 2021
* Date: October 19th, 2021
*
* Description: Single bit register as seen in the textbook Figure 16.4
*
*
****************************************************************************/


module FunRegister(
        input wire logic CLK, DIN, LOAD,
        output wire Q, NXT
    );
    
    // If LOAD is true, NXT (flip flop input) becomes Din, if false, NXT (flip flop next value) becomes Q (flip flop current value)
    assign NXT = LOAD ? DIN : Q;
    
    // Instance flip flop with input CLK and NXT, and output Q
    FDCE my_ff (.Q(Q), .C(CLK), .CE(1'b1), .CLR(1'b0), .D(NXT));

endmodule
