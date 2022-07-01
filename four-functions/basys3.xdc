# Input A (sw[2])
set_property -dict { PACKAGE_PIN W16 IOSTANDARD LVCMOS33 } [get_ports A]

# Input B (sw[1])
set_property -dict { PACKAGE_PIN V16 IOSTANDARD LVCMOS33 } [get_ports B]

# Input C (sw[0])
set_property -dict { PACKAGE_PIN V17 IOSTANDARD LVCMOS33 } [get_ports C]

# Output 1 (led[3])
set_property -dict { PACKAGE_PIN V19 IOSTANDARD LVCMOS33 } [get_ports O1]

# Output 2 (led[2])
set_property -dict { PACKAGE_PIN U19 IOSTANDARD LVCMOS33 } [get_ports O2]

# Output 3 (led[1])
set_property -dict { PACKAGE_PIN E19 IOSTANDARD LVCMOS33 } [get_ports O3]

# Output 4 (led[0])
set_property -dict { PACKAGE_PIN U16 IOSTANDARD LVCMOS33 } [get_ports O4]

## Configuration options
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]