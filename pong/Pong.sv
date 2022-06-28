`timescale 1ns / 1ps
`default_nettype none
/***************************************************************************
*
* Module: Pong
*
* Author: Adam Taylor
* Date: June 28th, 2022
*
* Contains a state machine used to run the Pong game
*
*
****************************************************************************/


module Pong (
    input wire logic        clk,
    input wire logic        reset,

    input wire logic        LPaddleUp,
    input wire logic        LPaddleDown,
    input wire logic        RPaddleUp,
    input wire logic        RPaddleDown,

    output logic    [8:0]   vga_x,
    output logic    [7:0]   vga_y,
    output logic    [2:0]   vga_color,
    output logic            vga_wr_en,

    output logic    [7:0]   P1score, P2score
);

localparam              VGA_X_MAX = 319;
localparam              VGA_Y_MAX = 239;

localparam              PADDLE_HEIGHT = 20;

localparam              LPADDLE_X = 10;
localparam              RPADDLE_X = 310;
localparam              PADDLE_SPEED = 2;

// ball drawer signals
logic           [8:0]   ballDrawX;
logic           [7:0]   ballDrawY;
logic                   ballStart, ballDone, ballDrawEn;

// line drawer for paddles
logic           [8:0]   lineX, lineDrawX;
logic           [7:0]   lineY, lineDrawY;
logic                   lineStart, lineDone, lineDrawEn;

// location of ball, paddles
logic           [8:0]   ballX;
logic           [7:0]   ballY, LPaddleY, RPaddleY;

// velocity of ball
logic                   ballMovingRight, ballMovingDown;

// delay counter
logic           [31:0]  timerCount;
logic                   timerDone, timerRst;

logic                   initGame, moveAndScore, erasing, invertErasing;

////////////////// Game Loop Timer /////////////
// Added in exercise 2

always_comb
    timerDone = timerCount == 1000000;  // 1 million clock cycles with 10ns (100MHz) is 10ms

always_ff @(posedge clk)
    if (timerRst)
        timerCount <= 0;
    else
        timerCount <= timerCount + 1;

////////////////// Erasing /////////////////////
// Added in exercise 2

always_ff @(posedge clk)
    if (initGame)
        erasing <= 0;
    else if (invertErasing)
        erasing <= !erasing;
    else
        erasing <= erasing;

////////////////// Ball Location ///////////////
// Added in exercise 1, updated in exercise 2

always_ff @(posedge clk)
    if (initGame) begin
        ballX <= (VGA_X_MAX / 2);
        ballY <= (VGA_Y_MAX / 2);
    end else if (moveAndScore) begin
        if (ballMovingRight)
            ballX <= ballX + 1;
        else
            ballX <= ballX - 1;
        if (ballMovingDown)
            ballY <= ballY + 1;
        else
            ballY <= ballY - 1;
    end else begin
        ballX <= ballX;
        ballY <= ballY;
    end

////////////////// Paddle Locations ////////////
// Added in exercise 1, updated in exercise 3

always_ff @(posedge clk)
    if (initGame) begin
        LPaddleY <= (VGA_Y_MAX / 2) - (PADDLE_HEIGHT / 2);
        RPaddleY <= (VGA_Y_MAX / 2) - (PADDLE_HEIGHT / 2);
    end else if (moveAndScore) begin
        if (LPaddleUp && LPaddleY > 1)
            LPaddleY <= LPaddleY - PADDLE_SPEED;
        else if (LPaddleDown && LPaddleY < (VGA_Y_MAX - PADDLE_HEIGHT - 1))
            LPaddleY <= LPaddleY + PADDLE_SPEED;
        else
            LPaddleY <= LPaddleY;
    
        if (RPaddleUp && RPaddleY > 1)
            RPaddleY <= RPaddleY - PADDLE_SPEED;
        else if (RPaddleDown && RPaddleY < (VGA_Y_MAX - PADDLE_HEIGHT - 1))
            RPaddleY <= RPaddleY + PADDLE_SPEED;
        else
            RPaddleY <= RPaddleY;
    end else begin
        LPaddleY <= LPaddleY;
        RPaddleY <= RPaddleY;
    end

////////////////// Player Score ////////////////
// Added in exercise 1, updated in exercise 4

always_ff @(posedge clk)
    if (initGame) begin
        P1score <= 0;
        P2score <= 0;
    end else if (moveAndScore) begin
        // Add score to player 2 (right paddle player) if we hit the left wall
        if (ballX == 0)
            P2score <= P2score + 1;
        else
            P2score <= P2score;
        // Add score to player 1 (left paddle player) if we hit the right wall
        if (ballX == VGA_X_MAX - 1)
            P1score <= P1score + 1;
        else
            P1score <= P1score;
    end else begin
        P1score <= P1score;
        P2score <= P2score;
    end

////////////////// Ball Direction ///////////////
// Added in exercise 2, updated in exercise 3

always_ff @(posedge clk)
    if (initGame) begin
        ballMovingRight <= 1;
        ballMovingDown <= 1;
    end else begin
        // If ball moving right, switch directions only if colliding with right wall or right paddle
        if (ballMovingRight)
            if (((ballY - 1) >= RPaddleY && ballY <= (RPaddleY + PADDLE_HEIGHT) && ballX == RPADDLE_X - 2) || (ballX >= VGA_X_MAX - 1))
                ballMovingRight <= !ballMovingRight;
            else
                ballMovingRight <= ballMovingRight;
        
        // If ball moving left, switch directions only if colliding with left wall or left paddle
        else
            if (((ballY - 1) >= LPaddleY && ballY <= (LPaddleY + PADDLE_HEIGHT) && ballX == LPADDLE_X + 1) || (ballX <= 0))
                ballMovingRight <= !ballMovingRight;
            else
                ballMovingRight <= ballMovingRight;
                
        // If ball moving down, switch directions only if it's at the top or bottom of the screen
        if (ballMovingDown)
            if (ballY >= VGA_Y_MAX - 1)
                ballMovingDown <= !ballMovingDown;
            else
                ballMovingDown <= ballMovingDown;
        else
            if (ballY <= 0)
                ballMovingDown <= !ballMovingDown;
            else
                ballMovingDown <= ballMovingDown;
    end

////////////////// State Machine ////////////////
// Added in exercise 1, updated in exercise 2

typedef enum logic [2:0] {INIT, BALL, PADDLE_L, PADDLE_R, MOVE, WAIT_TIMER, ERR='X} StateType;    
StateType cs, ns;

always_ff @(posedge clk)
    cs <= ns;

always_comb
begin
    // Defaults
    initGame = 0;
    lineStart = 0;
    ballStart = 0;
    ns = ERR;
    vga_x = 0;
    vga_y = 0;
    vga_wr_en = 0;
    vga_color = 3'b111;
    lineX = 0;
    lineY = 0;
    invertErasing = 0;
    moveAndScore = 0;
    timerRst = 0;
    
    if (erasing)
        vga_color = 0;
    
    if (reset)
        ns = INIT;
    else
        case (cs)
            INIT:
            begin
                initGame = 1;
                ns = PADDLE_L;
            end
            BALL:
                if (ballDone)
                    ns = PADDLE_R;
                else begin
                    ns = BALL;
                    ballStart = 1;
                    // Draw the ball
                    vga_x = ballDrawX;
                    vga_y = ballDrawY;
                    vga_wr_en = ballDrawEn;
                    //vga_color = 3'b111;
                end
            PADDLE_L:
                if (lineDone)
                    ns = BALL;
                else begin
                    ns = PADDLE_L;
                    lineStart = 1;
                    lineX = LPADDLE_X;
                    lineY = LPaddleY;
                    // Draw the left paddle line
                    vga_x = lineDrawX;
                    vga_y = lineDrawY;
                    vga_wr_en = lineDrawEn;
                    //vga_color = 3'b111;
                end
            PADDLE_R:
                if (lineDone && erasing) begin
                    ns = MOVE;
                    invertErasing = 1;
                end else if (lineDone && !erasing) begin
                    ns = WAIT_TIMER;
                    timerRst = 1;
                    invertErasing = 1;
                end else begin
                    ns = PADDLE_R;
                    lineStart = 1;
                    lineX = RPADDLE_X;
                    lineY = RPaddleY;
                    // Draw the right paddle line
                    vga_x = lineDrawX;
                    vga_y = lineDrawY;
                    vga_wr_en = lineDrawEn;
                    //vga_color = 3'b111;
                end
            MOVE:
            begin
                moveAndScore = 1;
                ns = PADDLE_L;
            end
            WAIT_TIMER:
                if  (timerDone)
                    ns = PADDLE_L;
                else
                    ns = WAIT_TIMER;
        endcase
end


////////////////// Drawing Submodules ///////////
BallDrawer BallDrawer_inst(
    .clk(clk),
    .reset(reset),
    .draw(ballDrawEn),
    .start(ballStart),
    .done(ballDone),
    .x_in(ballX),
    .y_in(ballY),
    .x_out(ballDrawX),
    .y_out(ballDrawY)
);

VLineDrawer VLineDrawer_inst(
    .clk(clk),
    .reset(reset),
    .start(lineStart),
    .draw(lineDrawEn),
    .done(lineDone),
    .x_in(lineX),
    .y_in(lineY),
    .x_out(lineDrawX),
    .y_out(lineDrawY),
    .height(PADDLE_HEIGHT)
);

endmodule
