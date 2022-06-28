# Clock
set_property LOC W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10.000 [get_ports clk]

# LED
set_property LOC U16 [get_ports q]
set_property IOSTANDARD LVCMOS33 [get_ports q]