`timescale 1ns / 1ps
`default_nettype none
/***************************************************************************
*
* Module: seven_segment_top.sv
*
* Author: Adam Taylor
* Class: ECEN 220 - Fall 2021
* Date: Tuesday, Oct 12, 2021
*
* Description: Maps a hex value character (input) to a seven-segment display (output)
*
*
****************************************************************************/


module seven_segment_top(
        input wire logic [3:0] sw,
        input wire logic btnc,
        output logic [7:0] segment,
        output logic [3:0] anode
    );
    
    // Pass in sw wire as data input, and pass in the first 7 bits of segment as the output
    seven_segment S0(.data(sw), .segment(segment[6:0]));
    
    // Turn on the decimal point whenever the button is pressed
    assign segment[7] = ~btnc;
    
    // Turn on the rightmost seven-segment display but turn off the other three
    assign anode = 4'b1110;
    
endmodule