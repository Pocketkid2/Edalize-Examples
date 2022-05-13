`timescale 1ns / 1ps
`default_nettype none
/***************************************************************************
*
* Module: tx.sv
*
* Author: Adam Taylor
* Class: ECEN 220 - Fall 2021
* Date: Tuesday, November 9th, 2021
*
* Description: The UART Transmitter
*
*
****************************************************************************/


module tx(
        input wire logic clk, Reset, Send, 
	input wire logic [7:0] Din,
        output logic Sent, Sout
    );
    
    // TIMER CODE
    logic timerDone, clrTimer; // The only internal signal here is baud_timer_Q, the rest are used elsewhere
    logic [12:0] baud_timer_Q;
    
    // If the current timer value is 5208 (the number of clock cycles, rounded down)
    assign timerDone = (baud_timer_Q == 5208);
    
    // If we are clearing or done, reset, otherwise increment
    always_ff @(posedge clk)
        if (clrTimer || timerDone)
            baud_timer_Q <= 0;
        else
            baud_timer_Q <= baud_timer_Q + 1;
    
    
    
    // BIT COUNTER CODE
    logic bitDone, incBit, clrBit;
    logic [2:0] bitNum;  // None of these are completely internal signals
    
    // If the bit counter reaches 7, assert high on the bitDone wire
    assign bitDone = (bitNum == 7);
    
    // If clrBit, reset counter, if incBit, increment counter, otherwise hold
    always_ff @(posedge clk)
        if (clrBit)
            bitNum <= 0;
        else if (incBit)
            bitNum <= bitNum + 1;
    
    
    
    // FINITE STATE MACHINE CODE
    logic startBit, dataBit, parityBit; // None of these are completely internal signals
    
    // Define states for state machine
    typedef enum logic[2:0] {IDLE, START, BITS, PAR, STOP, ACK, ERR='X} StateType;
    StateType ns, cs;    
    
    // IFL and OFL for state machine
    always_comb
    begin
        // Defaults
        ns = ERR;
        clrTimer = 0;
        clrBit = 0;
        startBit = 0;
        dataBit = 0;
        incBit = 0;
        parityBit = 0;
        Sent = 0;
        
        // If reset, start in IDLE state, otherwise run state machine code
        if (Reset)
            ns = IDLE;
        else
            case (cs)
                IDLE:
                    begin
                        clrTimer = 1;
                        if (Send)
                            ns = START;
                        else
                            ns = IDLE;
                    end
                START:
                    begin
                        startBit = 1;
                        if (timerDone)
                        begin
                            clrBit = 1;
                            ns = BITS;
                        end
                        else
                            ns = START;
                    end
                BITS:
                    begin
                        dataBit = 1;
                        if (timerDone && bitDone)
                            ns = PAR;
                        else if (timerDone && !bitDone)
                        begin
                            ns = BITS;
                            incBit = 1;
                        end
                        else
                            ns = BITS;
                    end
                PAR:
                    begin
                        parityBit = 1;
                        if (timerDone)
                            ns = STOP;
                        else
                            ns = PAR;
                    end
                STOP:
                    begin
                        if (timerDone)
                            ns = ACK;
                        else
                            ns = STOP;
                    end
                ACK:
                    begin
                        Sent = 1;
                        if (Send)
                            ns = ACK;
                        else
                            ns = IDLE;
                    end
            endcase
    end
    
    // Flip Flops for state machine
    always_ff @(posedge clk)
        cs <= ns;
    
    
    
    // DATAPATH AND PARITY GENERATOR
    
    // This code is copied from the textbook
    always_ff @(posedge clk)
        if (startBit)
            Sout <= 0;
        else if (dataBit)
            Sout <= Din[bitNum];
        else if (parityBit)
            Sout <= ~^Din;
        else
            Sout <= 1;
    
    
    
endmodule