`timescale 1ns / 1ps
`default_nettype none
/***************************************************************************
*
* Module: debounce.sv
*
* Author: Adam Taylor
* Class: ECEN 220 - Fall 2021
* Date: Tuesday, November 2nd, 2021
*
* Description: Finite State Machine for debounce logic
*
*
****************************************************************************/


module debounce(
        input wire logic clk, reset, noisy,
        output logic debounced
    );
    
    // Internal communication code ---------------------
    
    // Signals for clearing the timer (FSM -> Timer) and knowing when the timer has reached the desired time (Timer -> FSM)
    logic clrTimer, timerDone;
    // Signal for timer register
    logic [18:0] q;
    
    // State Machine code ------------------------------
    
    // State register variables (Enum for each of the four states)
    typedef enum logic [1:0] {s0, s1, s2, s3, ERR='X} StateType;
    StateType ns, cs;   // Next State and Current State (2 bit wires)
    
    // Input and output forming logic
    always_comb
    begin
        // Default values
        ns = ERR;
        clrTimer = 0;
        debounced = 0;
        
        // Handle reset case
        if (reset)
        begin
            ns = s0;    // Start in state 0
            clrTimer = 1;   // We are clearing the timer in state 0
        end
        else
            case (cs)
                s0: begin
                        clrTimer = 1;   // We are clearing the timer in state 0
                        
                        if (noisy)
                            ns = s1;    // If we receive a high input, move to state 1 (start timer)
                        else
                            ns = s0;    // Otherwise, just stay the same (if noisy is low)
                    end
                s1: begin
                        if (noisy && timerDone)
                            ns = s2;    // If timer finished, move to debounce high state
                        else if (noisy && !timerDone)
                            ns = s1;    // If timer not finished, stay in current state
                        else
                            ns = s0;    // If noisy signal goes low, return to initial state
                    end
                s2: begin
                        clrTimer = 1;   // We are clearing the timer in state 2
                        debounced = 1;  // We assert debounced high in state 2
                        
                        if (noisy)
                            ns = s2;    // If input is high, stay in current state (debounce high)
                        else
                            ns = s3;    // If input goes low, mvoe to next state (start timer)
                    end
                s3: begin
                        debounced = 1;  // We assert debounced high in state 3
                        
                        if (!noisy && timerDone)
                            ns = s0;    // If timer finished, move to debounce low state
                        else if (!noisy && !timerDone)
                            ns = s3;    // If timer not finished, stay in current state
                        else
                            ns = s2;    // If noisy signal goes high, return to previous state (debounce high)
                    end
            endcase
        
    end
    
    // Flip flops for state machine
    always_ff @(posedge clk)
        cs <= ns;
    
    // Timer code --------------------------------------
    
    // Flip flops for resettable counter
    always_ff @(posedge clk)
        if (clrTimer)
            q <= 0;
        else
            q <= q + 1;
    
    // Combinational logic for knowing when the timer is done
    always_comb
        timerDone = (q >= 500000);
    
    
endmodule