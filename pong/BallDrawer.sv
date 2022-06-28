`timescale 1ns / 1ps
`default_nettype none
/***************************************************************************
*
* Module: BallDrawer
*
* Author: Adam Taylor
* Date: June 28th, 2022
*
* Contains a state machine used to draw a ball
*
*
****************************************************************************/


module BallDrawer(
    input wire logic clk, reset, start,
    input wire logic [8:0] x_in,
    input wire logic [7:0] y_in,
    output logic draw, done,
    output logic [8:0] x_out,
    output logic [7:0] y_out
    );
    
    // State definitions
    typedef enum logic [2:0] {START, PIXEL00, PIXEL01, PIXEL02, PIXEL03, FINISH, ERR='X} StateType;
    StateType ns, cs;
    
    // Flip flops for state machine
    always_ff @(posedge clk)
        cs <= ns;
        
    // Input and output forming logic for state machine
    always_comb
    begin
        // Default values
        draw = 0;
        done = 0;
        x_out = 0;
        y_out = 0;
        ns = ERR;
        
        if (reset)
            ns = START;
        else
            case (cs)
                START:
                    if (start)
                        ns = PIXEL00;
                    else
                        ns = START;
                PIXEL00:
                begin
                    draw = 1;
                    x_out = x_in;
                    y_out = y_in;
                    ns = PIXEL01;
                end
                PIXEL01:
                begin
                    draw = 1;
                    x_out = x_in + 1;
                    y_out = y_in;
                    ns = PIXEL02;
                end
                PIXEL02:
                begin
                    draw = 1;
                    x_out = x_in;
                    y_out = y_in + 1;
                    ns = PIXEL03;
                end
                PIXEL03:
                begin
                    draw = 1;
                    x_out = x_in + 1;
                    y_out = y_in + 1;
                    ns = FINISH;
                end
                FINISH:
                begin
                    done = 1;
                    if (start)
                        ns = FINISH;
                    else
                        ns = START;
                end
            endcase
    end
    
endmodule
