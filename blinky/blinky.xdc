## Clock signal
set_property -dict { PACKAGE_PIN W5 IOSTANDARD LVCMOS33 } [get_ports clk]
create_clock -period 10.000 [get_ports clk]

## LED
set_property -dict { PACKAGE_PIN U16 IOSTANDARD LVCMOS33 } [get_ports q]

## Configuration options
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]
