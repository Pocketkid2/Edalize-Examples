`timescale 1ns / 1ps
`default_nettype none
/***************************************************************************
*
* Module: debounce_top.sv
*
* Author: Adam Taylor
* Class: ECEN 220 - Fall 2021
* Date: Tuesday, November 2nd, 2021
*
* Description: Top module for debounce circuit
*
*
****************************************************************************/


module debounce_top(
        input wire logic clk, btnu, btnc,
        output logic [3:0] anode, 
	output logic [7:0] segment
    );
    
    // SYNCHRONIZER ----------------------
    
    // These two wires are for the input Synchronizer module, as a "buffer"
    logic [1:0] input_buf;
    
    // Synchronizer code
    always_ff @(posedge clk)
    begin
        input_buf[1] <= btnc;
        input_buf[0] <= input_buf[1];
    end
    
    // DEBOUNCER -------------------------
    
    // This next wire is the output for the debouncer FSM
    logic debounce_output;
    
    // Instantiate debouncer
    debounce DEBOUNCE_FSM (.clk(clk), .reset(btnu), .noisy(input_buf[0]), .debounced(debounce_output));
    
    // PULSE GENERATOR(s) -------------------
    
    // These next wires are for the pulse generator(s) (one-shot)
    // pulse[0] is the output from the AND gate, the other two are connected to the flip flops
    logic [2:0] pulse_debounced;
    logic [2:0] pulse_undebounced;
    
    // Describe the flip flop logic for the pulse generator(s)
    always_ff @(posedge clk)
    begin
        pulse_debounced[2] <= debounce_output;
        pulse_debounced[1] <= pulse_debounced[2];
        
        pulse_undebounced[2] <= input_buf[0];
        pulse_undebounced[1] <= pulse_undebounced[2];
    end
    
    // Describe the combinational logic for the pulse generator(s)
    always_comb
    begin
        pulse_debounced[0] = pulse_debounced[2] && !pulse_debounced[1];
        
        pulse_undebounced[0] = pulse_undebounced[2] && !pulse_undebounced[1];
    end
        
    // COUNTER(s) ----------------------------
    
    // The counter wires for the flip flops
    logic [7:0] count_debounced_next;
    logic [7:0] count_debounced_current;
    logic [7:0] count_undebounced_next;
    logic [7:0] count_undebounced_current;
    
    // Flip flop logic for both counters
    always_ff @(posedge clk)
    begin
        count_debounced_current <= count_debounced_next;
        count_undebounced_current <= count_undebounced_next;
    end
    
    // Combinational logic for the debounced counter
    always_comb
    begin
        if (btnu)   // If reset button pressed, reset counter
            count_debounced_next = 0;
        else if (pulse_debounced[0])  // If pulse received, increment
            count_debounced_next = count_debounced_current + 1;
        else
            count_debounced_next = count_debounced_current;
    end
    
    // Combinational logic for the undebounced counter
    always_comb
    begin
        if (btnu)   // If reset button pressed, reset counter
            count_undebounced_next = 0;
        else if (pulse_undebounced[0])  // If pulse received, increment
            count_undebounced_next = count_undebounced_current + 1;
        else
            count_undebounced_next = count_undebounced_current;
    end
    
    // SEVEN SEGMENT DISPLAY -------------------
    
    // Initiate the display controller with all the values needed
    SevenSegmentControl SEVEN_SEGMENT_DISPLAY_CONTROLLER (.clk(clk), .reset(btnu), .dataIn({count_undebounced_current,count_debounced_current}), .digitDisplay(4'b1111), .digitPoint(4'b0000), .anode(anode), .segment(segment));
    
endmodule