from re import M
from edalize import *
import os

work_root = 'build_nextpnr'
files = [
    {'name' : os.path.relpath('FourFunctions.sv', work_root), 'file_type' : 'systemVerilogSource'},
    {'name' : os.path.relpath('basys3.xdc', work_root), 'file_type' : 'xdc'},
    {'name' : os.path.relpath('xc7a35t.bin', work_root), 'file_type' : 'bin'}
]

tool = 'f4pga'
edam = {
    'files' : files,
    'name' : 'FourFunctions',
    'parameters' : {},
    'toplevel' : 'FourFunctions',
    'tool_options' : {
        'f4pga': {
            'arch': 'xilinx',
            'device_type': 'artix7',
            'device_name': 'xc7a50t_test',
            'part' : 'xc7a35tcpg236-1',
            'pnr' : 'nextpnr'
        }
    }
}

backend = get_edatool(tool)(edam = edam, work_root = work_root)
os.makedirs(work_root)
backend.configure()
backend.build()
backend.run()