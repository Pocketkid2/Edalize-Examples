from edalize import *
import os

work_root = 'build_vivado'
files = [
    {'name' : os.path.relpath('seven_segment.sv', work_root), 'file_type' : 'systemVerilogSource'},
    {'name' : os.path.relpath('seven_segment_top.sv', work_root), 'file_type' : 'systemVerilogSource'},
    {'name' : os.path.relpath('basys3.xdc', work_root), 'file_type' : 'xdc'}
]
tool = 'vivado'
edam = {
    'files' : files,
    'name' : 'SevenSegment',
    'parameters' : {},
    'toplevel' : 'seven_segment_top',
    'tool_options' : {'vivado' : {'part' : 'xc7a35tcpg236-1'}}
}

backend = get_edatool(tool)(edam = edam, work_root = work_root)
os.makedirs(work_root)
backend.configure()
backend.build()
backend.run()