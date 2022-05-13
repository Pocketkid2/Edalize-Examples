`timescale 1ns / 1ps
`default_nettype none
/***************************************************************************
*
* Module: FunRegister4
*
* Author: Adam Taylor
* Class: ECEN 220, Section 1, Fall 2021
* Date: October 19th, 2021
*
* Description: Four bit register as seen in the textbook Figure 16.5
*
*
****************************************************************************/


module FunRegister4(
        input wire logic CLK, LOAD,
	input wire logic [3:0] DIN,
        output wire [3:0] Q, 
	output wire [3:0] NXT
    );
    
    // If LOAD is true, NXT (flip flop input) becomes Din, if false, NXT (flip flop next value) becomes Q (flip flop current value)
    assign NXT = LOAD ? DIN : Q;
    
    // Instance flip flops with inputs CLK and NXT, and output Q
    FDCE my_ff1 (.Q(Q[0]), .C(CLK), .CE(1'b1), .CLR(1'b0), .D(NXT[0]));
    FDCE my_ff2 (.Q(Q[1]), .C(CLK), .CE(1'b1), .CLR(1'b0), .D(NXT[1]));
    FDCE my_ff3 (.Q(Q[2]), .C(CLK), .CE(1'b1), .CLR(1'b0), .D(NXT[2]));
    FDCE my_ff4 (.Q(Q[3]), .C(CLK), .CE(1'b1), .CLR(1'b0), .D(NXT[3]));
    
endmodule
