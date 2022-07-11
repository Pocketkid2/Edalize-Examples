## Clock
set_property -dict { PACKAGE_PIN W5    IOSTANDARD LVCMOS33 } [get_ports clk]
create_clock -period 10.0 [get_ports clk]

## Buttons 
set_property -dict { PACKAGE_PIN U18   IOSTANDARD LVCMOS33 } [get_ports btnc]

## Switches
set_property -dict { PACKAGE_PIN V17   IOSTANDARD LVCMOS33 } [get_ports sw[0]]
set_property -dict { PACKAGE_PIN V16   IOSTANDARD LVCMOS33 } [get_ports sw[1]]

## Seven-Segment Display
set_property -dict { PACKAGE_PIN W7    IOSTANDARD LVCMOS33 } [get_ports segment[0]]
set_property -dict { PACKAGE_PIN W6    IOSTANDARD LVCMOS33 } [get_ports segment[1]] 
set_property -dict { PACKAGE_PIN U8    IOSTANDARD LVCMOS33 } [get_ports segment[2]] 
set_property -dict { PACKAGE_PIN V8    IOSTANDARD LVCMOS33 } [get_ports segment[3]] 
set_property -dict { PACKAGE_PIN U5    IOSTANDARD LVCMOS33 } [get_ports segment[4]] 
set_property -dict { PACKAGE_PIN V5    IOSTANDARD LVCMOS33 } [get_ports segment[5]] 
set_property -dict { PACKAGE_PIN U7    IOSTANDARD LVCMOS33 } [get_ports segment[6]] 
set_property -dict { PACKAGE_PIN V7    IOSTANDARD LVCMOS33 } [get_ports segment[7]] 
set_property -dict { PACKAGE_PIN U2    IOSTANDARD LVCMOS33 } [get_ports anode[0]] 
set_property -dict { PACKAGE_PIN U4    IOSTANDARD LVCMOS33 } [get_ports anode[1]] 
set_property -dict { PACKAGE_PIN V4    IOSTANDARD LVCMOS33 } [get_ports anode[2]] 
set_property -dict { PACKAGE_PIN W4    IOSTANDARD LVCMOS33 } [get_ports anode[3]] 

## Configuration options
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]