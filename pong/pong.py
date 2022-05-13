from edalize import *
import os

work_root = 'build'
files = [
    {'name' : os.path.relpath('clk_generator.v', work_root), 'file_type' : 'verilogSource'},
    {'name' : os.path.relpath('BallDrawer.sv', work_root), 'file_type' : 'systemVerilogSource'},
    {'name' : os.path.relpath('VLineDrawer.sv', work_root), 'file_type' : 'systemVerilogSource'},
    {'name' : os.path.relpath('SevenSegmentControl.sv', work_root), 'file_type' : 'systemVerilogSource'},
    {'name' : os.path.relpath('bitmaptovga.sv', work_root), 'file_type' : 'systemVerilogSource'},
    {'name' : os.path.relpath('top_pong.sv', work_root), 'file_type' : 'systemVerilogSource'},
    {'name' : os.path.relpath('Pong.sv', work_root), 'file_type' : 'systemVerilogSource'},
    {'name' : os.path.relpath('basys3.xdc', work_root), 'file_type' : 'xdc'}
]

tool = 'symbiflow'
edam = {
    'files' : files,
    'name' : 'Pong',
    'parameters' : {},
    'toplevel' : 'top_pong',
    'tool_options' : {'symbiflow' :
                        {'arch' : 'xilinx',
                        'package' : 'cpg236-1',
                        'part' : 'xc7a35t',
                        'vendor' : 'xilinx',
                        'pnr' : 'vpr'}}
}

backend = get_edatool(tool)(edam = edam, work_root = work_root)
os.makedirs(work_root)
backend.configure()