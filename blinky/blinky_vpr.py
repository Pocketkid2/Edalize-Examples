from edalize import *
from edalize.flows.f4pga import F4pga as F4pga_flow
import os

work_root = 'build_vpr'
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
    'flow_options'  : {
        "device": "artix7",
        "part": "xc7a35tcpg236-1",
        "chip": "xc7a50t_test"
    }
}

backend = F4pga_flow(edam = edam, work_root = work_root)
os.makedirs(work_root)
backend.configure()
backend.build()
backend.run([])