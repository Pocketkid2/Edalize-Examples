`timescale 1ns / 1ps
`default_nettype none
/***************************************************************************
*
* Module: counter4.sv
*
* Author: Adam Taylor
* Date: June 28th, 2022
*
* Four bit register-counter that rolls over at 10 to 0 (decimal instead of hex)
*
*
****************************************************************************/


module counter4(
        input wire logic CLK, CLR, INC,
        output wire [3:0] Q, 
	    output wire [3:0] NXT,
        output wire ROLL
    );
    
    // If CLR high, reset to zero
    // If INC high, add one (mod ten)
    // Else maintain
    assign NXT = (CLR & ~INC) ? 0000 : 
                 (~CLR & INC) ? ((Q + 1) % 10) :
                 Q;

    // If Q is 9 (about to rollover) set ROLL high
    assign ROLL = (Q == 4'd9) ? 1'b1 : 1'b0;
                 
    // Instance flip flops with inputs CLK and NXT, and output Q
    FDCE my_ff1 (.Q(Q[0]), .C(CLK), .CE(1'b1), .CLR(1'b0), .D(NXT[0]));
    FDCE my_ff2 (.Q(Q[1]), .C(CLK), .CE(1'b1), .CLR(1'b0), .D(NXT[1]));
    FDCE my_ff3 (.Q(Q[2]), .C(CLK), .CE(1'b1), .CLR(1'b0), .D(NXT[2]));
    FDCE my_ff4 (.Q(Q[3]), .C(CLK), .CE(1'b1), .CLR(1'b0), .D(NXT[3]));
    
endmodule
