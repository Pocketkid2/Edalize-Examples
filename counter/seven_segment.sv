`timescale 1ns / 1ps
`default_nettype none
/***************************************************************************
*
* Module: seven_segment.sv
*
* Author: Adam Taylor
* Class: ECEN 220 - Fall 2021
* Date: Tuesday, Oct 12, 2021
*
* Description: Maps a hex value character (input) to a seven-segment display (output)
*
*
****************************************************************************/


module seven_segment(
        input wire logic [3:0] data,
        output logic [6:0] segment
    );
    
    // CA (segment[0]) - Sum of Products Structural SV (method one)
    // Each term output is described by CA_term1, CA_term2, etc...
    logic [3:0] data_not;
    
    not(data_not[0], data[0]);
    not(data_not[1], data[1]);
    not(data_not[2], data[2]);
    not(data_not[3], data[3]);
    
    logic CA_term1, CA_term2, CA_term3, CA_term4;
    
    and(CA_term1, data[0], data_not[1], data_not[2], data_not[3]);
    and(CA_term2, data_not[0], data_not[1], data[2], data_not[3]);
    and(CA_term3, data[0], data[1], data_not[2], data[3]);
    and(CA_term4, data[0], data_not[1], data[2], data[3]);
    
    or(segment[0], CA_term1, CA_term2, CA_term3, CA_term4);
    
    // CB (segment[1]) - Dataflow SV (method four)
    // Using unminimized sum of products
    
    assign segment[1] = 
            (data == 4'b0101) || 
            (data == 4'b0110) || 
            (data == 4'b1011) || 
            (data == 4'b1100) || 
            (data == 4'b1110) || 
            (data == 4'b1111); 
    
    // CC (segment[2]) - Dataflow SV (ternary operator) (method three)
    // Using unminimized sum of products
    
    assign segment[2] = 
            (data == 4'b0010) ? 1:
            (data == 4'b1100) ? 1:
            (data == 4'b1110) ? 1:
            (data == 4'b1111) ? 1:
            0;
    
    // CD (segment[3])  - Dataflow SV (method four)
    // Using unminimized sum of products
    
    assign segment[3] = 
            (data == 4'b0001) || 
            (data == 4'b0100) || 
            (data == 4'b0111) || 
            (data == 4'b1010) || 
            (data == 4'b1111); 
    
    // CE (segment[4])- Datavlow SV (method four)
    // Using unminimized sum of products
    
    assign segment[4] = 
            (data == 4'b0001) || 
            (data == 4'b0011) || 
            (data == 4'b0100) || 
            (data == 4'b0101) || 
            (data == 4'b0111) || 
            (data == 4'b1001); 
    
    // CF (segment[5])- Dataflow SV (method four)
    // Using unminimized sum of products
    
    assign segment[5] = 
            (data == 4'b0001) || 
            (data == 4'b0010) || 
            (data == 4'b0011) || 
            (data == 4'b0111) || 
            (data == 4'b1101); 
    
    
    // CG (segment[6]) - Sum of Products (minimized) Structural SV (method two)
    // Each term output is described by CG_term1, CG_term2, etc...
    // The first two terms (3`2`1`0` and 3`2`1`0 have been minimized to 3`2`1`)
    // The inverse of data is taken from the data_not wire defined for CA
    
    logic CG_term1, CG_term2, CG_term3;
    
    and(CG_term1, data_not[1], data_not[2], data_not[3]);
    and(CG_term2, data[0], data[1], data[2], data_not[3]);
    and(CG_term3, data_not[0], data_not[1], data[2], data[3]);
    
    or(segment[6], CG_term1, CG_term2, CG_term3);
    
    
    
endmodule