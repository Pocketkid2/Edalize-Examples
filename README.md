# Edalize Examples
A set of examples used for testing the F4PGA backend inside the Edalize python module. F4PGA is an open source toolchain flow for compiling Verilog/SystemVerilog to an FPGA bitstream. Edalize is a python module that abstracts away logic design tools from the projects themselves, and provides backends for many existing tools and flows. This repository was created to aid in the development of the F4PGA flow inside edalize, and targets [the latest Edalize development branch from BYU](https://github.com/byuccl/edalize/tree/f4pga_flow).

The goal is for each design in this repo to have an edalize script for a traditional Vivado flow, as well as two scripts for F4PGA flows (one with VPR as the place and route tool and the other with NextPNR instead). The Vivado test is considered the baseline, as all projects most at the very least work properly through Vivado.

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

#### Vivado script (baseline)

| Project name      | Bitstream Compiles? | Design Works? | Date of last test |
| ----------------- | ------------------- | ------------- | ----------------- |
| blinky            | Yes                 | Yes           | 10/4/2022         |
| four-functions    | Yes                 | Yes           | 10/4/2022         |
| arithmetic        | Yes                 | Yes           | 10/4/2022         |
| seven-segment     | Yes                 | Yes           | 10/4/2022         |
| counter           | Yes                 | Yes           | 10/4/2022         |
| stopwatch         | Yes                 | Yes           | 10/4/2022         |
| debounce          | Yes                 | Yes           | 10/4/2022         |
| transmitter (tx)  | Yes                 | Yes           | 10/4/2022         |
| codebreaker       | Yes                 | Yes           | 10/4/2022         |
| receiver (rx)     | Yes                 | Yes           | 10/4/2022         |
| pong              | Yes                 | Yes           | 10/4/2022         |

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
