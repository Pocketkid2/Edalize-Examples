###################################################################
# basys3.xdc
#
# This file is based on the master constraints file for laboratory assignments used
# at BYU for ECEN 220. 
#
#
###################################################################

# # Buttons 
set_property -dict { PACKAGE_PIN U18   IOSTANDARD LVCMOS33 } [get_ports { btnc }];

# # Switches
set_property -dict { PACKAGE_PIN V17   IOSTANDARD LVCMOS33 } [get_ports { sw[0] }]; 
set_property -dict { PACKAGE_PIN V16   IOSTANDARD LVCMOS33 } [get_ports { sw[1] }]; 
set_property -dict { PACKAGE_PIN W16   IOSTANDARD LVCMOS33 } [get_ports { sw[2] }]; 
set_property -dict { PACKAGE_PIN W17   IOSTANDARD LVCMOS33 } [get_ports { sw[3] }]; 

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