## Clock
set_property LOC W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10.0 [get_ports clk]

## Buttons 
set_property LOC U18 [get_ports btnc]
set_property LOC T18 [get_ports btnu]

set_property IOSTANDARD LVCMOS33 [get_ports btnc]
set_property IOSTANDARD LVCMOS33 [get_ports btnu]

## Switches
set_property LOC V17 [get_ports sw[0]]
set_property LOC V16 [get_ports sw[1]] 
set_property LOC W17 [get_ports sw[2]] 
set_property LOC W16 [get_ports sw[3]] 
set_property LOC W15 [get_ports sw[4]] 
set_property LOC V15 [get_ports sw[5]] 
set_property LOC W14 [get_ports sw[6]] 
set_property LOC W13 [get_ports sw[7]] 

set_property IOSTANDARD LVCMOS33 [get_ports sw[0]]
set_property IOSTANDARD LVCMOS33 [get_ports sw[1]] 
set_property IOSTANDARD LVCMOS33 [get_ports sw[2]] 
set_property IOSTANDARD LVCMOS33 [get_ports sw[3]] 
set_property IOSTANDARD LVCMOS33 [get_ports sw[4]] 
set_property IOSTANDARD LVCMOS33 [get_ports sw[5]] 
set_property IOSTANDARD LVCMOS33 [get_ports sw[6]] 
set_property IOSTANDARD LVCMOS33 [get_ports sw[7]] 

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

## UART
set_property LOC A18 [get_ports tx_out] 
set_property LOC J1  [get_ports tx_debug]

set_property IOSTANDARD LVCMOS33 [get_ports tx_out] 
set_property IOSTANDARD LVCMOS33 [get_ports tx_debug]