`timescale 1ns / 1ps
`default_nettype none
/***************************************************************************
*
* Module: Codebreaker.sv
*
* Author: Adam Taylor
* Class: ECEN 220 - Fall 2021
* Date: Tuesday, November 16th, 2021
*
* Description: The central module that contains the codebreaker state machine
*
*
****************************************************************************/


module Codebreaker(
        input wire logic clk, reset, start, done_drawing_plaintext,
        output logic stopwatch_run, draw_plaintext, 
        output logic [15:0] key_display, 
        output logic [127:0] plaintext_to_draw
    );
    
    // Check that each byte of the plaintext is A-Z,0-9 or space.
    logic plaintext_is_ascii;
    assign plaintext_is_ascii = ((plaintext_to_draw[127:120] >= "A" && plaintext_to_draw[127:120] <= "Z") || (plaintext_to_draw[127:120] >= "0" && plaintext_to_draw[127:120] <= "9") || (plaintext_to_draw[127:120] == " ")) &&
                            ((plaintext_to_draw[119:112] >= "A" && plaintext_to_draw[119:112] <= "Z") || (plaintext_to_draw[119:112] >= "0" && plaintext_to_draw[119:112] <= "9") || (plaintext_to_draw[119:112] == " ")) &&
                            ((plaintext_to_draw[111:104] >= "A" && plaintext_to_draw[111:104] <= "Z") || (plaintext_to_draw[111:104] >= "0" && plaintext_to_draw[111:104] <= "9") || (plaintext_to_draw[111:104] == " ")) &&
                            ((plaintext_to_draw[103:96] >= "A" && plaintext_to_draw[103:96] <= "Z") || (plaintext_to_draw[103:96] >= "0" && plaintext_to_draw[103:96] <= "9") || (plaintext_to_draw[103:96] == " ")) &&
                            ((plaintext_to_draw[95:88] >= "A" && plaintext_to_draw[95:88] <= "Z") || (plaintext_to_draw[95:88] >= "0" && plaintext_to_draw[95:88] <= "9") || (plaintext_to_draw[95:88] == " ")) &&
                            ((plaintext_to_draw[87:80] >= "A" && plaintext_to_draw[87:80] <= "Z") || (plaintext_to_draw[87:80] >= "0" && plaintext_to_draw[87:80] <= "9") || (plaintext_to_draw[87:80] == " ")) &&
                            ((plaintext_to_draw[79:72] >= "A" && plaintext_to_draw[79:72] <= "Z") || (plaintext_to_draw[79:72] >= "0" && plaintext_to_draw[79:72] <= "9") || (plaintext_to_draw[79:72] == " ")) &&
                            ((plaintext_to_draw[71:64] >= "A" && plaintext_to_draw[71:64] <= "Z") || (plaintext_to_draw[71:64] >= "0" && plaintext_to_draw[71:64] <= "9") || (plaintext_to_draw[71:64] == " ")) &&
                            ((plaintext_to_draw[63:56] >= "A" && plaintext_to_draw[63:56] <= "Z") || (plaintext_to_draw[63:56] >= "0" && plaintext_to_draw[63:56] <= "9") || (plaintext_to_draw[63:56] == " ")) &&
                            ((plaintext_to_draw[55:48] >= "A" && plaintext_to_draw[55:48] <= "Z") || (plaintext_to_draw[55:48] >= "0" && plaintext_to_draw[55:48] <= "9") || (plaintext_to_draw[55:48] == " ")) &&
                            ((plaintext_to_draw[47:40] >= "A" && plaintext_to_draw[47:40] <= "Z") || (plaintext_to_draw[47:40] >= "0" && plaintext_to_draw[47:40] <= "9") || (plaintext_to_draw[47:40] == " ")) &&
                            ((plaintext_to_draw[39:32] >= "A" && plaintext_to_draw[39:32] <= "Z") || (plaintext_to_draw[39:32] >= "0" && plaintext_to_draw[39:32] <= "9") || (plaintext_to_draw[39:32] == " ")) &&
                            ((plaintext_to_draw[31:24] >= "A" && plaintext_to_draw[31:24] <= "Z") || (plaintext_to_draw[31:24] >= "0" && plaintext_to_draw[31:24] <= "9") || (plaintext_to_draw[31:24] == " ")) &&
                            ((plaintext_to_draw[23:16] >= "A" && plaintext_to_draw[23:16] <= "Z") || (plaintext_to_draw[23:16] >= "0" && plaintext_to_draw[23:16] <= "9") || (plaintext_to_draw[23:16] == " ")) &&
                            ((plaintext_to_draw[15:8] >= "A" && plaintext_to_draw[15:8] <= "Z") || (plaintext_to_draw[15:8] >= "0" && plaintext_to_draw[15:8] <= "9") || (plaintext_to_draw[15:8] == " ")) &&
                            ((plaintext_to_draw[7:0] >= "A" && plaintext_to_draw[7:0] <= "Z") || (plaintext_to_draw[7:0] >= "0" && plaintext_to_draw[7:0] <= "9") || (plaintext_to_draw[7:0] == " "));

    
    
    // State machine internal signals
    logic done, enable;
    logic [23:0] key;
    logic [127:0] cyphertext;
    
    
    // User given cypher text (2) and pass the key to the LED output
    assign cyphertext = 128'hb8935bbf5f819bcfec46da11d5393d4f;
    assign key_display = key[23:8];
    
    // State definitions for state machines
    typedef enum logic[2:0] {IDLE, DECR, CHECK, DISP, DONE, ERR='X} StateType;
    StateType ns, cs;
    
    // Increment key when we are in the check state but the decrypted cipher is not readable
    always_ff @(posedge clk)
        if (reset)
            key <= 0;
        else if (cs == CHECK && plaintext_is_ascii == 0)
            key <= key + 1;
    
    // Input and output forming logic for state machine
    always_comb
    begin
        // Default values
        ns = ERR;
        enable = 0;
        draw_plaintext = 0;
        
        // The stop watch is running whenever we're not idle or finished
        stopwatch_run = (cs != IDLE) && (cs != DONE);
        
        // Reset takes precedence, resets state
        if (reset)
        begin
            ns = IDLE;
        end
        else
            case (cs)
                IDLE:   // If we are in the IDLE state, we move forward when start is 1
                    if (start)
                        ns = DECR;
                    else
                        ns = IDLE;
                DECR:   // If we are in the DECR[EMENT] state, we enable the decrypt module and move on only when done signal received
                begin
                    enable = 1;
                    if (done)
                        ns = CHECK;
                    else
                        ns = DECR;
                end
                CHECK:  // If we are in the CHECK state, we look at the value of is_ascii, and move on if yes, and return to decrypt state if not (while adding one to the key value)
                begin
                    if (plaintext_is_ascii)
                        ns = DISP;
                    else
                        begin
                            ns = DECR;
                        end
                end
                DISP:   // If we are in the DISP[LAY] state, we assert draw signal and wait for the draw done signal before moving on.
                begin
                    draw_plaintext = 1;
                    if (done_drawing_plaintext)
                        ns = DONE;
                    else
                        ns = DISP;
                end
                DONE:   // If we are in the DONE state, we simply hold (unless reset goes high)
                    if (reset)
                        ns = IDLE;
                    else
                        ns = DONE;
            endcase
    end
    
    // Flip flops for state machine
    always_ff @(posedge clk)
        cs <= ns;
    
    // Instantiate the decrypt module
    decrypt_rc4 decrypt_inst(.clk(clk), .reset(reset), .enable(enable), .key(key), .bytes_in(cyphertext), .bytes_out(plaintext_to_draw), .done(done));
    
endmodule