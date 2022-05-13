# Edalize-Examples
A set of examles you can use to test a F4PGA/Symbiflow project through Edalize and run on Basys3 board

## Instructions
Enter a project directory, make sure you are in a python environment that has F4PGA/Sybmiflow and Edalize installed (conda recommended), and then run `python <project>.py`

### Note
If the script does not include `backend.build()` at the end of the script, it will not actually run the tools, but rather simply generate the makefile in the build directory. You'll have to either manually enter the build directory and run make or add that line to the end of the python script (usually after `backend.configure()`, which creates the makefile)
