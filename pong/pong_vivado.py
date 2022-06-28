from edalize import *
import os

work_root = 'build_vivado'
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
tool = 'vivado'
edam = {
    'files'         : files,
    'name'          : 'pong',
    'parameters'    : {},
    'toplevel'      : 'top_pong',
    'tool_options'  : {'vivado' : {'part' : 'xc7a35tcpg236-1'}}
}

backend = get_edatool(tool)(edam = edam, work_root = work_root)
os.makedirs(work_root)
backend.configure()
backend.build()
backend.run()