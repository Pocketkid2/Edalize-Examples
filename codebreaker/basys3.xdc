###################################################################
# basys3.xdc
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
set_property -dict { PACKAGE_PIN T18   IOSTANDARD LVCMOS33 } [get_ports { btnu }]; 

# # LEDs
set_property -dict { PACKAGE_PIN U16   IOSTANDARD LVCMOS33 } [get_ports { led[0] }]; 
set_property -dict { PACKAGE_PIN E19   IOSTANDARD LVCMOS33 } [get_ports { led[1] }]; 
set_property -dict { PACKAGE_PIN U19   IOSTANDARD LVCMOS33 } [get_ports { led[2] }]; 
set_property -dict { PACKAGE_PIN V19   IOSTANDARD LVCMOS33 } [get_ports { led[3] }]; 
set_property -dict { PACKAGE_PIN W18   IOSTANDARD LVCMOS33 } [get_ports { led[4] }]; 
set_property -dict { PACKAGE_PIN U15   IOSTANDARD LVCMOS33 } [get_ports { led[5] }]; 
set_property -dict { PACKAGE_PIN U14   IOSTANDARD LVCMOS33 } [get_ports { led[6] }]; 
set_property -dict { PACKAGE_PIN V14   IOSTANDARD LVCMOS33 } [get_ports { led[7] }]; 
set_property -dict { PACKAGE_PIN V13   IOSTANDARD LVCMOS33 } [get_ports { led[8] }]; 
set_property -dict { PACKAGE_PIN V3    IOSTANDARD LVCMOS33 } [get_ports { led[9] }]; 
set_property -dict { PACKAGE_PIN W3    IOSTANDARD LVCMOS33 } [get_ports { led[10] }]; 
set_property -dict { PACKAGE_PIN U3    IOSTANDARD LVCMOS33 } [get_ports { led[11] }]; 
set_property -dict { PACKAGE_PIN P3    IOSTANDARD LVCMOS33 } [get_ports { led[12] }]; 
set_property -dict { PACKAGE_PIN N3    IOSTANDARD LVCMOS33 } [get_ports { led[13] }]; 
set_property -dict { PACKAGE_PIN P1    IOSTANDARD LVCMOS33 } [get_ports { led[14] }]; 
set_property -dict { PACKAGE_PIN L1    IOSTANDARD LVCMOS33 } [get_ports { led[15] }]; 

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

# # UART
set_property -dict { PACKAGE_PIN A18   IOSTANDARD LVCMOS33 } [get_ports { tx_out }]; 