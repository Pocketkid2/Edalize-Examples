from edalize import *
import os

work_root = 'build'
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
tool = 'f4pga'
edam = {
    'files'         : files,
    'name'          : 'pong',
    'parameters'    : {},
    'toplevel'      : 'top_pong',
    'flow_options' : {
        'arch': 'xilinx',
        'device_type': 'artix7',
        'device_name': 'xc7a50t_test',
        'part' : 'xc7a35tcpg236-1'}
}

backend = get_edatool(tool)(edam = edam, work_root = work_root)
os.makedirs(work_root)
backend.configure()
#backend.build()