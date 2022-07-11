from edalize import *
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
    'tool_options'  : {
        'f4pga': {
            'board' : 'basys3',
            'pnr' : 'vpr'
        }
    }
}

backend = get_edatool(tool)(edam = edam, work_root = work_root)
os.makedirs(work_root)
backend.configure()
backend.build()
backend.run()