`timescale 1ns / 1ps
`default_nettype none
/***************************************************************************
*
* Module: VLineDrawer
*
* Author: Adam Taylor
* Date: June 28th, 2022
*
* Contains a state machine used to draw a vertical line
*
*
****************************************************************************/


module VLineDrawer(
        input wire logic clk, reset, start,
        input wire logic [8:0] x_in,
        input wire logic [7:0] y_in, height,
        output logic draw, done,
        output logic [8:0] x_out,
        output logic [7:0] y_out
    );
    
    // Pixel counter
    logic [7:0] q;
    logic q_reset, q_increment;
    always_ff @(posedge clk)
        if (q_reset)
            q <= 0;
        else if (q_increment)
            q <= q + 1;
        else
            q <= q;
        
    
    // State definitions
    typedef enum logic [1:0] {START, PIXEL, FINISH, ERR='X} StateType;
    StateType ns, cs;
    
    // Flip flops for state machine
    always_ff @(posedge clk)
        cs <= ns;
        
    // Input and output forming logic for state machines
    always_comb
    begin
        // Default values
        draw = 0;
        done = 0;
        x_out = 0;
        y_out = 0;
        ns = ERR;
        q_reset = 0;
        q_increment = 0;
        
        if (reset)
            ns = START;
        else
            case (cs)
                START:
                begin
                    q_reset = 1;
                
                    if (start)
                        ns = PIXEL;
                    else
                        ns = START;
                end
                PIXEL:
                begin
                    draw = 1;
                    q_increment = 1;
                
                    if (q < height)
                    begin
                        x_out = x_in;
                        y_out = y_in + q;
                        ns = PIXEL;
                    end
                    
                    if (q == height - 1)
                    begin
                        done = 1;
                        ns = FINISH;
                    end
                end
                FINISH:
                    if (start)
                        ns = FINISH;
                    else
                        ns = START;
            endcase
    end
    
endmodule
