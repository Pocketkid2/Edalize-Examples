# Edalize Examples
A set of examles you can use to test a Verilog/SystemVerilog FPGA project using the F4PGA (previously known as Symbiflow) toolchain through [the latest Edalize development branch from BYU](https://github.com/byuccl/edalize/tree/f4pga_flow)

The goal is for each design in this repo to have an edalize script for a traditional Vivado flow, as well as two scripts for F4PGA flows (one with VPR and the other with NextPNR).

## Instructions
Simply run the python script of your choice, making sure your current environment has all of the tools available (Such as vivado or f4pga)

### Note
Edalize has three stages: 
1. Configure, which generates the Makefile and any necessary toolchain files.
2. Build, which executes the Makefile (usually this means compiling verilog to a bitstream).
3. Run, which executes a run step configured by the Edalize flow. For F4PGA this means downloading the bitstream to the target board via USB.

Each of these stages corresponds to a method on the backend (Edatool class) provided by Edalize. See the scripts for examples.

### Testing result tables

As a way of recording progress and tracking bugs, I've created the following tables showing my results from running the scripts in this repo which use a recent install of the Vivado and F4PGA tools. 

#### Vivado script

| Project name      | Bitstream Compiles? | Design Works? | Date of last test |
| ----------------- | ------------------- | ------------- | ----------------- |
| blinky            |
| four-functions    |
| arithmetic        |
| seven-segment     |
| counter           |
| stopwatch         |
| debounce          |
| transmitter (tx)  |
| codebreaker       | 
| receiver (rx)     |
| pong              |

#### VPR script

| Project name      | Bitstream Compiles? | Design Works? | Date of last test |
| ----------------- | ------------------- | ------------- | ----------------- |
| blinky            |
| four-functions    |
| arithmetic        |
| seven-segment     |
| counter           |
| stopwatch         |
| debounce          |
| transmitter (tx)  |
| codebreaker       | 
| receiver (rx)     |
| pong              |

#### NextPNR script

| Project name      | Bitstream Compiles? | Design Works? | Date of last test |
| ----------------- | ------------------- | ------------- | ----------------- |
| blinky            |
| four-functions    |
| arithmetic        |
| seven-segment     |
| counter           |
| stopwatch         |
| debounce          |
| transmitter (tx)  |
| codebreaker       | 
| receiver (rx)     |
| pong              |
