## Clock
set_property LOC W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10.00 [get_ports clk]

## Buttons
set_property LOC U18 [get_ports btnc]
set_property LOC T18 [get_ports btnu]
set_property LOC W19 [get_ports btnl]
set_property LOC T17 [get_ports btnr]
set_property LOC U17 [get_ports btnd]

set_property IOSTANDARD LVCMOS33 [get_ports btnc]
set_property IOSTANDARD LVCMOS33 [get_ports btnu]
set_property IOSTANDARD LVCMOS33 [get_ports btnl]
set_property IOSTANDARD LVCMOS33 [get_ports btnr]
set_property IOSTANDARD LVCMOS33 [get_ports btnd]

## Seven-Segment Display
set_property LOC W7 [get_ports segment[0]]
set_property LOC W6 [get_ports segment[1]]
set_property LOC U8 [get_ports segment[2]]
set_property LOC V8 [get_ports segment[3]]
set_property LOC U5 [get_ports segment[4]]
set_property LOC V5 [get_ports segment[5]]
set_property LOC U7 [get_ports segment[6]]
set_property LOC V7 [get_ports segment[7]]
set_property LOC U2 [get_ports anode[0]]
set_property LOC U4 [get_ports anode[1]]
set_property LOC V4 [get_ports anode[2]]
set_property LOC W4 [get_ports anode[3]]

set_property IOSTANDARD LVCMOS33 [get_ports segment[0]]
set_property IOSTANDARD LVCMOS33 [get_ports segment[1]]
set_property IOSTANDARD LVCMOS33 [get_ports segment[2]]
set_property IOSTANDARD LVCMOS33 [get_ports segment[3]]
set_property IOSTANDARD LVCMOS33 [get_ports segment[4]]
set_property IOSTANDARD LVCMOS33 [get_ports segment[5]]
set_property IOSTANDARD LVCMOS33 [get_ports segment[6]]
set_property IOSTANDARD LVCMOS33 [get_ports segment[7]]
set_property IOSTANDARD LVCMOS33 [get_ports anode[0]]
set_property IOSTANDARD LVCMOS33 [get_ports anode[1]]
set_property IOSTANDARD LVCMOS33 [get_ports anode[2]]
set_property IOSTANDARD LVCMOS33 [get_ports anode[3]]

## VGA Connector
set_property LOC G19 [get_ports VGA_R[0]]
set_property LOC H19 [get_ports VGA_R[1]]
set_property LOC J19 [get_ports VGA_R[2]]
set_property LOC N19 [get_ports VGA_R[3]]

set_property LOC J17 [get_ports VGA_G[0]]
set_property LOC H17 [get_ports VGA_G[1]]
set_property LOC G17 [get_ports VGA_G[2]]
set_property LOC D17 [get_ports VGA_G[3]]

set_property LOC N18 [get_ports VGA_B[0]]
set_property LOC L18 [get_ports VGA_B[1]]
set_property LOC K18 [get_ports VGA_B[2]]
set_property LOC J18 [get_ports VGA_B[3]]

set_property LOC P19 [get_ports VGA_HS]
set_property LOC R19 [get_ports VGA_VS]

set_property IOSTANDARD LVCMOS33 [get_ports VGA_R[0]]
set_property IOSTANDARD LVCMOS33 [get_ports VGA_R[1]]
set_property IOSTANDARD LVCMOS33 [get_ports VGA_R[2]]
set_property IOSTANDARD LVCMOS33 [get_ports VGA_R[3]]

set_property IOSTANDARD LVCMOS33 [get_ports VGA_G[0]]
set_property IOSTANDARD LVCMOS33 [get_ports VGA_G[1]]
set_property IOSTANDARD LVCMOS33 [get_ports VGA_G[2]]
set_property IOSTANDARD LVCMOS33 [get_ports VGA_G[3]]

set_property IOSTANDARD LVCMOS33 [get_ports VGA_B[0]]
set_property IOSTANDARD LVCMOS33 [get_ports VGA_B[1]]
set_property IOSTANDARD LVCMOS33 [get_ports VGA_B[2]]
set_property IOSTANDARD LVCMOS33 [get_ports VGA_B[3]]

set_property IOSTANDARD LVCMOS33 [get_ports VGA_HS]
set_property IOSTANDARD LVCMOS33 [get_ports VGA_VS]