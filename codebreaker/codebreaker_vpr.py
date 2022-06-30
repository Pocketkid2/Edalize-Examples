from edalize import *
import os

work_root = 'build_vpr'
files = [
    {'name' : os.path.relpath('clk_generator.v', work_root), 'file_type' : 'verilogSource'},
    {'name' : os.path.relpath('CharDrawer_serial.sv', work_root), 'file_type' : 'systemVerilogSource'},
    {'name' : os.path.relpath('codebreaker_serial_top.sv', work_root), 'file_type' : 'systemVerilogSource'},
    {'name' : os.path.relpath('Codebreaker.sv', work_root), 'file_type' : 'systemVerilogSource'},
    {'name' : os.path.relpath('decrypt_rc4.sv', work_root), 'file_type' : 'systemVerilogSource'},
    {'name' : os.path.relpath('mod_counter.sv', work_root), 'file_type' : 'systemVerilogSource'},
    {'name' : os.path.relpath('SevenSegmentControl.sv', work_root), 'file_type' : 'systemVerilogSource'},
    {'name' : os.path.relpath('stopwatch.sv', work_root), 'file_type' : 'systemVerilogSource'},
    {'name' : os.path.relpath('tx.sv', work_root), 'file_type' : 'systemVerilogSource'},
    {'name' : os.path.relpath('basys3.xdc', work_root), 'file_type' : 'xdc'}
]

tool = 'f4pga'
edam = {
    'files' : files,
    'name' : 'Codebreaker',
    'parameters' : {},
    'toplevel' : 'codebreaker_serial_top',
    'tool_options' : {
        'f4pga': {
            'arch': 'xilinx',
            'device_type': 'artix7',
            'device_name': 'xc7a50t_test',
            'part' : 'xc7a35tcpg236-1',
            'pnr' : 'vpr'
        }
    }
}

backend = get_edatool(tool)(edam = edam, work_root = work_root)
os.makedirs(work_root)
backend.configure()
backend.build()
backend.run()