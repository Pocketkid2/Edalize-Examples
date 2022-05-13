`timescale 1ns / 1ps
`default_nettype none
/***************************************************************************
*
* Module: counter_top.sv
*
* Author: Adam Taylor
* Class: ECEN 220 - Fall 2021
* Date: Tuesday, October 19th, 2021
*
* Description: Top level module for the 4 bit counter
*
*
****************************************************************************/


module counter_top(
        input wire logic btnc, 
	input wire logic [1:0] sw,
        output wire [6:0] segment, 
	output wire [3:0] anode, 
	output wire [3:0] led
    );
    
    // Create a 4 bit wire for intermediating between the counter and the seven segment display
    logic [3:0] current_data;
    
    // Assign the first or left most seven segment to be on
    assign anode = 4'b1110;
    
    // Run the counter with the given inputs and output the data to the intermediate wire
    FunCounter4 COUNTER(.CLK(btnc), .CLR(sw[0]), .INC(sw[1]), .Q(current_data), .NXT(led));
    
    // Run the seven segment module with the current data from the intermediate wire
    seven_segment COMPUTE_DISPLAY(.data(current_data), .segment(segment));
    
endmodule