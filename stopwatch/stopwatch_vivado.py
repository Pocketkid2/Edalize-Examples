from edalize import *
import os

work_root = 'build'
files = [
    {'name' : os.path.relpath('mod_counter.sv', work_root), 'file_type' : 'systemVerilogSource'},
    {'name' : os.path.relpath('SevenSegmentControl.sv', work_root), 'file_type' : 'systemVerilogSource'},
    {'name' : os.path.relpath('stopwatch.sv', work_root), 'file_type' : 'systemVerilogSource'},
    {'name' : os.path.relpath('stopwatch_top.sv', work_root), 'file_type' : 'systemVerilogSource'},
    {'name' : os.path.relpath('basys3.xdc', work_root), 'file_type' : 'xdc'}
]

tool = 'vivado'
edam = {
    'files' : files,
    'name' : 'Stopwatch',
    'parameters' : {},
    'toplevel' : 'stopwatch_top',
    'tool_options' : {'vivado' : {'part' : 'xc7a35tcpg236-1'}}
}

backend = get_edatool(tool)(edam = edam, work_root = work_root)
os.makedirs(work_root)
backend.configure()