/***************************************************************************
* Module: top_pong
*
* Author: Jeff Goeders
* Date: May 13, 2019
*
* Description: Top-level module for Pong on Nexys4DDR board.
****************************************************************************/

`default_nettype none


module top_pong(
    input wire logic            clk,
    input wire logic            CPU_RESETN,

    output logic        [3:0]   VGA_R,
    output logic        [3:0]   VGA_G,
    output logic        [3:0]   VGA_B,
    output logic                VGA_HS,
    output logic                VGA_VS,

    output logic        [3:0]   anode,
    output logic        [7:0]   segment,
    
    input wire logic            btnu,
    input wire logic            btnd,
    input wire logic            btnl,
    input wire logic            btnr
);

logic           clk_100;
logic           clk_25;
logic           reset;

logic   [2:0]   vga_color;
logic   [8:0]   vga_x;
logic   [7:0]   vga_y;
logic           vga_wr_en;

logic   [7:0]   P1score;
logic   [7:0]   P2score;

assign reset = /*~*/CPU_RESETN;

Pong Pong_inst(
    .clk(clk_100),
    .reset(reset),
    .LPaddleUp(btnu),
    .LPaddleDown(btnl),
    .RPaddleUp(btnr),
    .RPaddleDown(btnd),
    .vga_x(vga_x),
    .vga_y(vga_y),
    .vga_wr_en(vga_wr_en),
    .vga_color(vga_color),
    .P1score(P1score),
    .P2score(P2score)
);

clk_generator clk_generator_inst
 (
    .clk_100(clk_100),
    .clk_25(clk_25),
    .clk_in_100(clk)
 );

BitmapToVga BitmapToVga_inst(
    .VGA_R(VGA_R),
    .VGA_G(VGA_G),
    .VGA_B(VGA_B),
    .clk(clk_100),
    .clk_vga(clk_25),
    .VGA_hsync(VGA_HS),
    .VGA_vsync(VGA_VS),
    .reset(reset),
    .wr_en(vga_wr_en),
    .x(vga_x),
    .y(vga_y),
    .color(vga_color)
);

SevenSegmentControl SSC (
    .clk(clk_100),
    .reset(reset),		
    .dataIn({P1score, P2score}), 
    .digitDisplay(8'b1111),
    .digitPoint(8'b0100),
    .anode(anode),
    .segment(segment)
);


endmodule