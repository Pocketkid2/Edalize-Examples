from edalize import *
import os

work_root = 'build'
files = [
    {'name' : os.path.relpath('blinky.v', work_root), 'file_type' : 'verilogSource'},
    {'name' : os.path.relpath('blinky.xdc', work_root), 'file_type' : 'xdc'}
]
tool = 'vivado'
edam = {
    'files'         : files,
    'name'          : 'blinky_project',
    'parameters'    : {},
    'toplevel'      : 'blinky',
    'tool_options' : {'vivado' : {'part' : 'xc7a35tcpg236-1'}}
}

backend = get_edatool(tool)(edam = edam, work_root = work_root)
os.makedirs(work_root)
backend.configure()
#backend.build()