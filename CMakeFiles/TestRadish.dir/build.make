# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/antoine/pHash

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/antoine/pHash

# Include any dependencies generated for this target.
include CMakeFiles/TestRadish.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/TestRadish.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/TestRadish.dir/flags.make

CMakeFiles/TestRadish.dir/examples/test_radish.cpp.o: CMakeFiles/TestRadish.dir/flags.make
CMakeFiles/TestRadish.dir/examples/test_radish.cpp.o: examples/test_radish.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/antoine/pHash/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/TestRadish.dir/examples/test_radish.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/TestRadish.dir/examples/test_radish.cpp.o -c /home/antoine/pHash/examples/test_radish.cpp

CMakeFiles/TestRadish.dir/examples/test_radish.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TestRadish.dir/examples/test_radish.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/antoine/pHash/examples/test_radish.cpp > CMakeFiles/TestRadish.dir/examples/test_radish.cpp.i

CMakeFiles/TestRadish.dir/examples/test_radish.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TestRadish.dir/examples/test_radish.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/antoine/pHash/examples/test_radish.cpp -o CMakeFiles/TestRadish.dir/examples/test_radish.cpp.s

CMakeFiles/TestRadish.dir/examples/test_radish.cpp.o.requires:

.PHONY : CMakeFiles/TestRadish.dir/examples/test_radish.cpp.o.requires

CMakeFiles/TestRadish.dir/examples/test_radish.cpp.o.provides: CMakeFiles/TestRadish.dir/examples/test_radish.cpp.o.requires
	$(MAKE) -f CMakeFiles/TestRadish.dir/build.make CMakeFiles/TestRadish.dir/examples/test_radish.cpp.o.provides.build
.PHONY : CMakeFiles/TestRadish.dir/examples/test_radish.cpp.o.provides

CMakeFiles/TestRadish.dir/examples/test_radish.cpp.o.provides.build: CMakeFiles/TestRadish.dir/examples/test_radish.cpp.o


# Object files for target TestRadish
TestRadish_OBJECTS = \
"CMakeFiles/TestRadish.dir/examples/test_radish.cpp.o"

# External object files for target TestRadish
TestRadish_EXTERNAL_OBJECTS =

TestRadish: CMakeFiles/TestRadish.dir/examples/test_radish.cpp.o
TestRadish: CMakeFiles/TestRadish.dir/build.make
TestRadish: Release/libpHash.so.1.0.0
TestRadish: /usr/lib/x86_64-linux-gnu/libmpg123.so
TestRadish: CMakeFiles/TestRadish.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/antoine/pHash/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable TestRadish"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/TestRadish.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/TestRadish.dir/build: TestRadish

.PHONY : CMakeFiles/TestRadish.dir/build

CMakeFiles/TestRadish.dir/requires: CMakeFiles/TestRadish.dir/examples/test_radish.cpp.o.requires

.PHONY : CMakeFiles/TestRadish.dir/requires

CMakeFiles/TestRadish.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/TestRadish.dir/cmake_clean.cmake
.PHONY : CMakeFiles/TestRadish.dir/clean

CMakeFiles/TestRadish.dir/depend:
	cd /home/antoine/pHash && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/antoine/pHash /home/antoine/pHash /home/antoine/pHash /home/antoine/pHash /home/antoine/pHash/CMakeFiles/TestRadish.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/TestRadish.dir/depend

