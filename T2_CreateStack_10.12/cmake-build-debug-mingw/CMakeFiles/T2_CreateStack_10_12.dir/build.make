# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.20

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "E:\CLion 2021.2.1\bin\cmake\win\bin\cmake.exe"

# The command to remove a file.
RM = "E:\CLion 2021.2.1\bin\cmake\win\bin\cmake.exe" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = E:\Project_Lib\DataStructure\T2_CreateStack_10.12

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = E:\Project_Lib\DataStructure\T2_CreateStack_10.12\cmake-build-debug-mingw

# Include any dependencies generated for this target.
include CMakeFiles/T2_CreateStack_10_12.dir/depend.make
# Include the progress variables for this target.
include CMakeFiles/T2_CreateStack_10_12.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/T2_CreateStack_10_12.dir/flags.make

CMakeFiles/T2_CreateStack_10_12.dir/main.c.obj: CMakeFiles/T2_CreateStack_10_12.dir/flags.make
CMakeFiles/T2_CreateStack_10_12.dir/main.c.obj: ../main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=E:\Project_Lib\DataStructure\T2_CreateStack_10.12\cmake-build-debug-mingw\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/T2_CreateStack_10_12.dir/main.c.obj"
	E:\MinGW-w64\mingw64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles\T2_CreateStack_10_12.dir\main.c.obj -c E:\Project_Lib\DataStructure\T2_CreateStack_10.12\main.c

CMakeFiles/T2_CreateStack_10_12.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/T2_CreateStack_10_12.dir/main.c.i"
	E:\MinGW-w64\mingw64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E E:\Project_Lib\DataStructure\T2_CreateStack_10.12\main.c > CMakeFiles\T2_CreateStack_10_12.dir\main.c.i

CMakeFiles/T2_CreateStack_10_12.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/T2_CreateStack_10_12.dir/main.c.s"
	E:\MinGW-w64\mingw64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S E:\Project_Lib\DataStructure\T2_CreateStack_10.12\main.c -o CMakeFiles\T2_CreateStack_10_12.dir\main.c.s

# Object files for target T2_CreateStack_10_12
T2_CreateStack_10_12_OBJECTS = \
"CMakeFiles/T2_CreateStack_10_12.dir/main.c.obj"

# External object files for target T2_CreateStack_10_12
T2_CreateStack_10_12_EXTERNAL_OBJECTS =

T2_CreateStack_10_12.exe: CMakeFiles/T2_CreateStack_10_12.dir/main.c.obj
T2_CreateStack_10_12.exe: CMakeFiles/T2_CreateStack_10_12.dir/build.make
T2_CreateStack_10_12.exe: CMakeFiles/T2_CreateStack_10_12.dir/linklibs.rsp
T2_CreateStack_10_12.exe: CMakeFiles/T2_CreateStack_10_12.dir/objects1.rsp
T2_CreateStack_10_12.exe: CMakeFiles/T2_CreateStack_10_12.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=E:\Project_Lib\DataStructure\T2_CreateStack_10.12\cmake-build-debug-mingw\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable T2_CreateStack_10_12.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\T2_CreateStack_10_12.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/T2_CreateStack_10_12.dir/build: T2_CreateStack_10_12.exe
.PHONY : CMakeFiles/T2_CreateStack_10_12.dir/build

CMakeFiles/T2_CreateStack_10_12.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\T2_CreateStack_10_12.dir\cmake_clean.cmake
.PHONY : CMakeFiles/T2_CreateStack_10_12.dir/clean

CMakeFiles/T2_CreateStack_10_12.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" E:\Project_Lib\DataStructure\T2_CreateStack_10.12 E:\Project_Lib\DataStructure\T2_CreateStack_10.12 E:\Project_Lib\DataStructure\T2_CreateStack_10.12\cmake-build-debug-mingw E:\Project_Lib\DataStructure\T2_CreateStack_10.12\cmake-build-debug-mingw E:\Project_Lib\DataStructure\T2_CreateStack_10.12\cmake-build-debug-mingw\CMakeFiles\T2_CreateStack_10_12.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/T2_CreateStack_10_12.dir/depend

