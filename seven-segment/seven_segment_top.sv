`timescale 1ns / 1ps
`default_nettype none
/***************************************************************************
*
* Module: seven_segment_top.sv
*
* Author: Adam Taylor
* Date: June 28th, 2022
*
* Displays four digits on the seven-segment display with data from the switches
*
*
****************************************************************************/


module seven_segment_top(
        input wire logic clk,
        input wire logic [15:0] sw,
        output logic [7:0] segment,
        output logic [3:0] anode
    );
    
    // Pass in the switch data directly to the seven segment controller
    SevenSegmentControl S0(
        .clk(clk), 
        .reset(1'b0), 
        .dataIn(sw), 
        .digitDisplay(4'b1111),
        .digitPoint(4'b0000),
        .anode(anode),
        .segment(segment));
    
endmodule