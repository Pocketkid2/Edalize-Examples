from edalize import *
import os

work_root = 'build'
files = [
    {'name' : os.path.relpath('blinky.v', work_root), 'file_type' : 'verilogSource'},
    {'name' : os.path.relpath('blinky.xdc', work_root), 'file_type' : 'xdc'}
]
tool = 'f4pga'
edam = {
    'files'         : files,
    'name'          : 'blinky',
    'parameters'    : {},
    'toplevel'      : 'blinky',
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