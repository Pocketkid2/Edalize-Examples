###################################################################
# basys3.xdc
#
# This file is based on the master constraints file for laboratory assignments used
# at BYU for ECEN 220. 
#
#
###################################################################

# This file was edited to conform to NextPNR constraint inputs

# # Buttons 
set_property LOC U18 [get_ports btnc]

set_property IOSTANDARD LVCMOS33 [get_ports btnc]

# # Switches
set_property LOC V17 [get_ports sw[0]]
set_property LOC V16 [get_ports sw[1]]
set_property LOC W17 [get_ports sw[2]]
set_property LOC W16 [get_ports sw[3]]

set_property IOSTANDARD LVCMOS33 [get_ports sw[0]]
set_property IOSTANDARD LVCMOS33 [get_ports sw[1]]
set_property IOSTANDARD LVCMOS33 [get_ports sw[2]]
set_property IOSTANDARD LVCMOS33 [get_ports sw[3]]

# # Seven-Segment Display
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