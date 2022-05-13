`timescale 1ns / 1ps
`default_nettype none
/***************************************************************************
*
* Module: FunCounter4.sv
*
* Author: Adam Taylor
* Class: ECEN 220 - Fall 2021
* Date: Tuesday, October 19th, 2021
*
* Description: Four bit register-counter as seen in the textbook Figure 16.7
*
*
****************************************************************************/


module FunCounter4(
        input wire logic CLK, CLR, INC,
        output wire [3:0] Q, 
	output wire [3:0] NXT
    );
    
    // Operate like a 4:1, top line is the 10 value, next line is 01, and the other two cases are handled by the last line.
    assign NXT = (CLR & ~INC) ? 0000 : 
                 (~CLR & INC) ? (Q + 1) :
                 Q;
                 
    // Instance flip flops with inputs CLK and NXT, and output Q
    FDCE my_ff1 (.Q(Q[0]), .C(CLK), .CE(1'b1), .CLR(1'b0), .D(NXT[0]));
    FDCE my_ff2 (.Q(Q[1]), .C(CLK), .CE(1'b1), .CLR(1'b0), .D(NXT[1]));
    FDCE my_ff3 (.Q(Q[2]), .C(CLK), .CE(1'b1), .CLR(1'b0), .D(NXT[2]));
    FDCE my_ff4 (.Q(Q[3]), .C(CLK), .CE(1'b1), .CLR(1'b0), .D(NXT[3]));
    
endmodule