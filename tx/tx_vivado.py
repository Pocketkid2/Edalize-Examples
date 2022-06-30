from edalize import *
import os

work_root = 'build_vivado'
files = [
    {'name' : os.path.relpath('debounce.sv', work_root), 'file_type' : 'systemVerilogSource'},
    {'name' : os.path.relpath('SevenSegmentControl.sv', work_root), 'file_type' : 'systemVerilogSource'},
    {'name' : os.path.relpath('tx.sv', work_root), 'file_type' : 'systemVerilogSource'},
    {'name' : os.path.relpath('tx_top.sv', work_root), 'file_type' : 'systemVerilogSource'},
    {'name' : os.path.relpath('basys3.xdc', work_root), 'file_type' : 'xdc'}
]

tool = 'vivado'
edam = {
    'files' : files,
    'name' : 'Transmitter',
    'parameters' : {},
    'toplevel' : 'tx_top',
    'tool_options' : {'vivado' : {'part' : 'xc7a35tcpg236-1'}}
}

backend = get_edatool(tool)(edam = edam, work_root = work_root)
os.makedirs(work_root)
backend.configure()
backend.build()
backend.run()