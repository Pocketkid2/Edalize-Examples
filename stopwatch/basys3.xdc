###################################################################
# basys3_220.xdc
#
# This is a master constraints file for laboratory assignments used
# at BYU for ECEN 220. 
#
# You should uncomment those lines that define ports that you used
# in your top-level design. You should also change the name of the 
# port in the .xdc file to match your corresponding top-level port.
#
###################################################################

# # Clock (uncomment both lines)
set_property -dict { PACKAGE_PIN W5    IOSTANDARD LVCMOS33 } [get_ports { clk }]; 
create_clock -period 10.0 [get_ports {clk}]

# # Buttons 
set_property -dict { PACKAGE_PIN U18   IOSTANDARD LVCMOS33 } [get_ports { btnc }];

# # Switches
set_property -dict { PACKAGE_PIN V17   IOSTANDARD LVCMOS33 } [get_ports { sw }]; 

# # Seven-Segment Display
set_property -dict { PACKAGE_PIN W7    IOSTANDARD LVCMOS33 } [get_ports { segment[0] }]; 
set_property -dict { PACKAGE_PIN W6    IOSTANDARD LVCMOS33 } [get_ports { segment[1] }]; 
set_property -dict { PACKAGE_PIN U8    IOSTANDARD LVCMOS33 } [get_ports { segment[2] }]; 
set_property -dict { PACKAGE_PIN V8    IOSTANDARD LVCMOS33 } [get_ports { segment[3] }]; 
set_property -dict { PACKAGE_PIN U5    IOSTANDARD LVCMOS33 } [get_ports { segment[4] }]; 
set_property -dict { PACKAGE_PIN V5    IOSTANDARD LVCMOS33 } [get_ports { segment[5] }]; 
set_property -dict { PACKAGE_PIN U7    IOSTANDARD LVCMOS33 } [get_ports { segment[6] }]; 
set_property -dict { PACKAGE_PIN V7    IOSTANDARD LVCMOS33 } [get_ports { segment[7] }]; 
set_property -dict { PACKAGE_PIN U2    IOSTANDARD LVCMOS33 } [get_ports { anode[0] }]; 
set_property -dict { PACKAGE_PIN U4    IOSTANDARD LVCMOS33 } [get_ports { anode[1] }]; 
set_property -dict { PACKAGE_PIN V4    IOSTANDARD LVCMOS33 } [get_ports { anode[2] }]; 
set_property -dict { PACKAGE_PIN W4    IOSTANDARD LVCMOS33 } [get_ports { anode[3] }]; 