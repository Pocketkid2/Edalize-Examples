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

tool = 'symbiflow'
edam = {
    'files' : files,
    'name' : 'Stopwatch',
    'parameters' : {},
    'toplevel' : 'stopwatch_top',
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