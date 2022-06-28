# Input A (sw[2])
set_property LOC W17 [get_ports A]
set_property IOSTANDARD LVCMOS33 [get_ports A]

# Input B (sw[1])
set_property LOC V16 [get_ports B]
set_property IOSTANDARD LVCMOS33 [get_ports B]

# Input C (sw[0])
set_property LOC V17 [get_ports C]
set_property IOSTANDARD LVCMOS33 [get_ports C]

# Output 1 (led[3])
set_property LOC V19 [get_ports O1]
set_property IOSTANDARD LVCMOS33 [get_ports O1]

# Output 2 (led[2])
set_property LOC U19 [get_ports O2]
set_property IOSTANDARD LVCMOS33 [get_ports O2]

# Output 3 (led[1])
set_property LOC E19 [get_ports O3]
set_property IOSTANDARD LVCMOS33 [get_ports O3]

# Output 4 (led[0])
set_property LOC U16 [get_ports O4]
set_property IOSTANDARD LVCMOS33 [get_ports O4]