from edalize import *
import os

work_root = 'build'
files = [
    {'name' : os.path.relpath('seven_segment.sv', work_root), 'file_type' : 'systemVerilogSource'},
    {'name' : os.path.relpath('FunCounter4.sv', work_root), 'file_type' : 'systemVerilogSource'},
    {'name' : os.path.relpath('counter_top.sv', work_root), 'file_type' : 'systemVerilogSource'},
    {'name' : os.path.relpath('basys3.xdc', work_root), 'file_type' : 'xdc'}
]
tool = 'symbiflow'
edam = {
    'files' : files,
    'name' : 'Counter',
    'parameters' : {},
    'toplevel' : 'counter_top',
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