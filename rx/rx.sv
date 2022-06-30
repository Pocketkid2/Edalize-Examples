`timescale 1ns / 1ps
`default_nettype none
/***************************************************************************
*
* Module: rx.sv
*
* Author: Adam Taylor
* Date: June 30th, 2022
*
* A UART Receiver state machine
*
*
****************************************************************************/


module rx(
        input wire logic clk, Reset, Sin, Received,
        output logic Receive, parityErr,
        output logic [7:0] Dout
    );
    
    // BAUD TIMER - 5208 cycles for full, 2604 for half
    logic timerDoneHalf, timerDoneFull, clrTimer;
    logic [12:0] baud_timer_Q;
    
    assign timerDoneHalf = (baud_timer_Q == 2604);
    assign timerDoneFull = (baud_timer_Q == 5208);
    
    always_ff @(posedge clk)
        if (clrTimer || timerDoneFull)
            baud_timer_Q <= 0;
        else
            baud_timer_Q <= baud_timer_Q + 1;
            
            
    // BIT COUNTER
    logic bitDone, clrBit, incBit;
    logic [3:0] bitNum;
    
    assign bitDone = (bitNum == 8);
    
    always_ff @(posedge clk)
        if (clrBit)
            bitNum <= 0;
        else if (incBit)
            bitNum <= bitNum + 1;
            
            
    // SHIFT REGISTER
    logic shift; // called when the state machine wants the shift register to shift
    logic [8:0] shift_registers;
    assign Dout = shift_registers[7:0]; // Pass the register output to Dout
    
    always_ff @(posedge clk)
        if (shift)
            //shift_registers <= {shift_registers[7:0],Sin_sync};
            shift_registers <= {Sin,shift_registers[8:1]};
            
    // PARITY CHECKER
    assign parityErr = ~^shift_registers[8:0];
    
    // STATE MACHINE/CONTROLLER
    // IDLE state is waiting for Sin to go low
    // START state waits for the full bit cycle of the start bit (Sin low)
    // SAMPLE state shifts in Sin at each half point until the counter reaches 9 (8 data bits plus parity bit)
    // HOLD 1 holds from the sample point of the parity bit till the end of that cycle
    // HOLD 2 holds for the full bit cycle of the stop bit (Sin high)
    // DONE state handles the receipt and acknowledgement
    typedef enum logic [2:0] {IDLE, START, SAMPLE, HOLD_1, HOLD_2, DONE, ERR='X} StateType;
    StateType ns, cs;
    
    always_comb
    begin
        // Give everything default values
        ns = ERR;
        clrTimer = 0;
        clrBit = 0;
        shift = 0;
        incBit = 0;
        Receive = 0;
        
        if (Reset)
            ns = IDLE;
        else
            case (cs)
                IDLE:
                begin
                    clrTimer = 1;
                    if (Sin)
                        ns = IDLE;
                    else
                        ns = START;
                end
                START:
                    if (timerDoneFull)
                    begin
                        ns = SAMPLE;
                        clrBit = 1;
                    end
                    else
                        ns = START;
                SAMPLE:
                    if (timerDoneHalf && bitDone)
                    begin
                        shift = 1;
                        ns = HOLD_1;
                    end
                    else if (timerDoneHalf && !bitDone)
                    begin
                        shift = 1;
                        incBit = 1;
                        ns = SAMPLE;
                    end
                    else
                        ns = SAMPLE;
                HOLD_1:
                    if (timerDoneFull)
                        ns = HOLD_2;
                    else
                        ns = HOLD_1;
                HOLD_2:
                    if (timerDoneFull)
                        ns = DONE;
                    else
                        ns = HOLD_2;
                DONE:
                begin
                    Receive = 1;
                    if (Received)
                        ns = IDLE;
                    else
                        ns = DONE;
                end
            endcase
    end
    
    always_ff @(posedge clk)
        cs <= ns;
    
endmodule
