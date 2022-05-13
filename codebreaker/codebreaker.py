from edalize import *
import os

work_root = 'build'
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

tool = 'symbiflow'
edam = {
    'files' : files,
    'name' : 'Codebreaker',
    'parameters' : {},
    'toplevel' : 'codebreaker_serial_top',
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