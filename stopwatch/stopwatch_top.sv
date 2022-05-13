`timescale 1ns / 1ps
`default_nettype none
/***************************************************************************
*
* Module: stopwatch_top.sv
*
* Author: Adam Taylor
* Class: ECEN 220 - Fall 2021
* Date: Tuesday, October 26th, 2021
*
* Description: This is the top level module that matches the stopwatch to the display and buttons and switches, etc
*
*
****************************************************************************/


module stopwatch_top(
        input wire logic clk, btnc, sw,
        output logic [3:0] anode, 
	output logic [7:0] segment
    );
    
    // Create an intermediate data wire to transfer the four digit data from the stopwatch module to the display module
    logic [15:0] data_wire;
    
    // Instantiate the seven segment display controller, pass in fixed values to turn on all displays and only second decimal point
    SevenSegmentControl SEVEN_SEGMENT_DISPLAY_CONTROLLER (.clk(clk), .dataIn(data_wire), .digitDisplay(4'b1111), .digitPoint(4'b0100), .anode(anode), .segment(segment));
    
    // Instantiate the stopwatch controller, pass out the data
    stopwatch STOPWATCH_CONTROLLER (.clk(clk), .reset(btnc), .run(sw), .digit0(data_wire[3:0]), .digit1(data_wire[7:4]), .digit2(data_wire[11:8]), .digit3(data_wire[15:12]));
    
endmodule