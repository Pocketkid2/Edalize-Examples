`timescale 1ns / 1ps
`default_nettype none
/***************************************************************************
*
* Module: counter_top.sv
*
* Author: Adam Taylor
* Date: June 28th, 2022
*
* Top level module for the 4 bit counter
*
*
****************************************************************************/


module counter_top(
        input wire logic clk,
        input wire logic btnc, 
		input wire logic [1:0] sw,
        output wire [7:0] segment, 
		output wire [3:0] anode, 
		output wire [15:0] led
    );
    
    // Create a 16 bit wire for intermediating between the counter and the seven segment display
    logic [15:0] current_data;
    logic inc_tens, inc_hundreds, inc_thousands;
    logic [3:0] bcd0, bcd1, bcd2, bcd3;
    
    // Each counter handles a single digit on the display, last rollover triggers far left LED
    counter4 COUNTER0(
        .CLK(btnc), .CLR(sw[0]), 
        .INC(sw[1]),            .Q(current_data[3:0]),          
        .NXT(bcd0), .ROLL(inc_tens));
    counter4 COUNTER1(
        .CLK(btnc), .CLR(sw[0]), 
        .INC(inc_tens),         .Q(current_data[7:4]),          
        .NXT(bcd1), .ROLL(inc_hundreds));
    counter4 COUNTER2(
        .CLK(btnc), .CLR(sw[0]), 
        .INC(inc_hundreds),     .Q(current_data[11:8]),         
        .NXT(bcd2), .ROLL(inc_thousands));
    counter4 COUNTER3(
        .CLK(btnc), .CLR(sw[0]), 
        .INC(inc_thousands),    .Q(current_data[15:12]),        
        .NXT(bcd3), .ROLL(led[15]));

	// Convert the four register BCD values to regular binary to display on the LEDs
	bcd2bin CONVERTER(.bcd0(bcd0), .bcd1(bcd1), .bcd2(bcd2), .bcd3(bcd3), .bin(led[13:0]));
    
    // Run the seven segment module with the current data from the intermediate wire
    SevenSegmentControl COMPUTE_DISPLAY(
        .clk(clk), 
        .reset(sw[0]), 
        .dataIn(current_data),
        .digitDisplay(4'b1111),
        .digitPoint(4'b0000),
        .anode(anode),
        .segment(segment));
    
endmodule