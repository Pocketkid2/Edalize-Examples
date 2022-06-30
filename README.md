# Edalize-Examples
A set of examles you can use to test a Verilog/SystemVerilog FPGA project using the F4PGA (previously known as Symbiflow) toolchain through [the latest Edalize development branch from BYU](https://github.com/byuccl/edalize/tree/student_refactor)

The goal is for each design in this repo to have an edalize script for a traditional Vivado flow, as well as two scripts for F4PGA flows (one with VPR and the other with NextPNR).

## Instructions
Simply run the python script of your choice, making sure your current environment has all of the tools available (Such as vivado or f4pga)

### Note
Edalize has three stages: 
1. Configure, which generates the Makefile and any necessary toolchain files.
2. Build, which executes the Makefile (usually this means compiling verilog to a bitstream).
3. Run, which executes a run step configured by the Edalize flow. For F4PGA this means downloading the bitstream to the target board via USB.

Each of these stages corresponds to a method on the backend (Edatool class) provided by Edalize. See the scripts for examples.

### Current working status
This table shows the most recent test status for each particular flow variant. I do these tests on my machine, targeting a Basys3.

| Design          | Status (Vivado)                       | Status (VPR)                  | Status (NextPNR)                      |
| ------          | ---------------                       | ------------                  | ----------------                      | 
| Blinky          | Compiles and works correctly          | Compiles and works correctly  | Compiles and works correctly          |
| Four Functions  | Compiles and works correctly          | Compiles and works correctly  | Compiles but does not work correctly  |
| Arithmetic      | Compiles and works correctly          | Compiles and works correctly  | Compiles and works correctly          |
| Seven Segment   | Compiles and works correctly          | Compiles and works correctly  | Compiles and works correctly          |
| Counter         | Compiles and works correctly          | Compiles and works correctly  | Does not compile (btnc clock issue)   |
| Stopwatch       | 
| Debounce        | Compiles and works correctly          | Compiles and works correctly  | Compiles and works correctly          |
| Transmitter (tx)| Compiles and works correctly          | Compiles and works correctly  | Compiles and works correctly          | 
| Codebreaker     |  
| Receiver (rx)   | Compiles and works correctly          | Compiles and works correctly  | Compiles and works correctly          |
| Pong            | Compiles and works correctly          | Compiles and works correctly  | Does not compile (see [here](https://github.com/gatecat/nextpnr-xilinx/issues/44)) |
