from re import M
from edalize import *
from edalize.flows.f4pga import F4pga as F4pga_flow
import os

work_root = 'build_vpr'
files = [
    {'name' : os.path.relpath('BallDrawer.sv', work_root), 'file_type' : 'systemVerilogSource'},
    {'name' : os.path.relpath('bitmaptovga.sv', work_root), 'file_type' : 'systemVerilogSource'},
    {'name' : os.path.relpath('SevenSegmentControl.sv', work_root), 'file_type' : 'systemVerilogSource'},
    {'name' : os.path.relpath('VLineDrawer.sv', work_root), 'file_type' : 'systemVerilogSource'},
    {'name' : os.path.relpath('Pong.sv', work_root), 'file_type' : 'systemVerilogSource'},
    {'name' : os.path.relpath('top_pong.sv', work_root), 'file_type' : 'systemVerilogSource'},
    {'name' : os.path.relpath('clk_generator.v', work_root), 'file_type' : 'verilogSource'},
    {'name' : os.path.relpath('basys3.xdc', work_root), 'file_type' : 'xdc'}
]
edam = {
    'files'         : files,
    'name'          : 'pong',
    'parameters'    : {},
    'toplevel'      : 'top_pong',
    'flow_options'  : {
        "device": "artix7",
        "part": "xc7a35tcpg236-1"
    }
}

backend = F4pga_flow(edam = edam, work_root = work_root)
os.makedirs(work_root)
backend.configure()
#backend.build()
#backend.run()