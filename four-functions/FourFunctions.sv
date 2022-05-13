`timescale 1ns / 1ps
`default_nettype none
/***************************************************************************
*
* Module: FourFunctions.sv
*
* Author: Adam Taylor
* Class: ECEN 220 - Fall 2021
* Date: Tuesday, September 21st, 2021
*
* Description: This was my original submission for ECEn220 Lab 3 during Fall 2021
*
*
****************************************************************************/


module FourFunctions(
    input wire logic A, B, C,
    output logic O1, O2, O3, O4
    );
    
    // function 1
    logic Abar, AandC, BandAbar;
    or(O1, AandC, BandAbar);
    and(AandC, A, C);
    and(BandAbar, B, Abar);
    not(Abar, A);
    
    // function 2
    logic Cbar, AorCbar, BandC;
    and(O2, AorCbar, BandC);
    or(AorCbar, A, Cbar);
    and(BandC, B, C);
    not(Cbar, C);
    
    // function 3
    logic Bbar, AandBbar;
    and(AandBbar, A, Bbar);
    or(O3, AandBbar, C);
    not(Bbar, B);
    
    // function 4
    logic AandB, BbarAndCbar;
    and(AandB, A, B);
    and(BbarAndCbar, Bbar, Cbar);
    or(O4, AandB, BbarAndCbar);
    
endmodule
