# Edalize-Examples
A set of examles you can use to test a F4PGA/Symbiflow project through Edalize and run on Basys3 board

## Instructions
Enter a project directory, make sure you are in a python environment that has F4PGA/Sybmiflow and Edalize installed (conda recommended), and then run `python <project>.py`

### Note
If the script does not include `backend.build()` at the end of the script, it will not actually run the tools, but rather simply generate the makefile in the build directory. You'll have to either manually enter the build directory and run make or add that line to the end of the python script (usually after `backend.configure()`, which creates the makefile)

### Current working status
In some cases Vivado was tested where it was suspected that F4PGA compatibility was lacking

| Design | Status |
| ------ | ------ |
| Four Functions | Compiles and runs in F4PGA |
| Arithmetic | Compiles and runs in F4PGA |
| Seven Segment | Compiles and runs in F4PGA |
| Counter | Compiles and runs in F4PGA and Vivado |
| Stopwatch | Compiles and runs in Vivado |
| Debounce | Compiles and runs in F4PGA and Vivado |
| Transmitter | Compiles and runs in F4PGA |
| Codebreaker | Compiles and runs in Vivado |
| Receiver | Compiles and runs in F4PGA |
| Pong | Compiles and runs in F4PGA |
