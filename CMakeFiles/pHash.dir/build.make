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
include CMakeFiles/pHash.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/pHash.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/pHash.dir/flags.make

CMakeFiles/pHash.dir/src/pHash.cpp.o: CMakeFiles/pHash.dir/flags.make
CMakeFiles/pHash.dir/src/pHash.cpp.o: src/pHash.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/antoine/pHash/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/pHash.dir/src/pHash.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/pHash.dir/src/pHash.cpp.o -c /home/antoine/pHash/src/pHash.cpp

CMakeFiles/pHash.dir/src/pHash.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/pHash.dir/src/pHash.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/antoine/pHash/src/pHash.cpp > CMakeFiles/pHash.dir/src/pHash.cpp.i

CMakeFiles/pHash.dir/src/pHash.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/pHash.dir/src/pHash.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/antoine/pHash/src/pHash.cpp -o CMakeFiles/pHash.dir/src/pHash.cpp.s

CMakeFiles/pHash.dir/src/pHash.cpp.o.requires:

.PHONY : CMakeFiles/pHash.dir/src/pHash.cpp.o.requires

CMakeFiles/pHash.dir/src/pHash.cpp.o.provides: CMakeFiles/pHash.dir/src/pHash.cpp.o.requires
	$(MAKE) -f CMakeFiles/pHash.dir/build.make CMakeFiles/pHash.dir/src/pHash.cpp.o.provides.build
.PHONY : CMakeFiles/pHash.dir/src/pHash.cpp.o.provides

CMakeFiles/pHash.dir/src/pHash.cpp.o.provides.build: CMakeFiles/pHash.dir/src/pHash.cpp.o


CMakeFiles/pHash.dir/src/cimgffmpeg.cpp.o: CMakeFiles/pHash.dir/flags.make
CMakeFiles/pHash.dir/src/cimgffmpeg.cpp.o: src/cimgffmpeg.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/antoine/pHash/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/pHash.dir/src/cimgffmpeg.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/pHash.dir/src/cimgffmpeg.cpp.o -c /home/antoine/pHash/src/cimgffmpeg.cpp

CMakeFiles/pHash.dir/src/cimgffmpeg.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/pHash.dir/src/cimgffmpeg.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/antoine/pHash/src/cimgffmpeg.cpp > CMakeFiles/pHash.dir/src/cimgffmpeg.cpp.i

CMakeFiles/pHash.dir/src/cimgffmpeg.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/pHash.dir/src/cimgffmpeg.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/antoine/pHash/src/cimgffmpeg.cpp -o CMakeFiles/pHash.dir/src/cimgffmpeg.cpp.s

CMakeFiles/pHash.dir/src/cimgffmpeg.cpp.o.requires:

.PHONY : CMakeFiles/pHash.dir/src/cimgffmpeg.cpp.o.requires

CMakeFiles/pHash.dir/src/cimgffmpeg.cpp.o.provides: CMakeFiles/pHash.dir/src/cimgffmpeg.cpp.o.requires
	$(MAKE) -f CMakeFiles/pHash.dir/build.make CMakeFiles/pHash.dir/src/cimgffmpeg.cpp.o.provides.build
.PHONY : CMakeFiles/pHash.dir/src/cimgffmpeg.cpp.o.provides

CMakeFiles/pHash.dir/src/cimgffmpeg.cpp.o.provides.build: CMakeFiles/pHash.dir/src/cimgffmpeg.cpp.o


# Object files for target pHash
pHash_OBJECTS = \
"CMakeFiles/pHash.dir/src/pHash.cpp.o" \
"CMakeFiles/pHash.dir/src/cimgffmpeg.cpp.o"

# External object files for target pHash
pHash_EXTERNAL_OBJECTS =

Release/libpHash.so.1.0.0: CMakeFiles/pHash.dir/src/pHash.cpp.o
Release/libpHash.so.1.0.0: CMakeFiles/pHash.dir/src/cimgffmpeg.cpp.o
Release/libpHash.so.1.0.0: CMakeFiles/pHash.dir/build.make
Release/libpHash.so.1.0.0: /usr/lib/x86_64-linux-gnu/libmpg123.so
Release/libpHash.so.1.0.0: CMakeFiles/pHash.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/antoine/pHash/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX shared library Release/libpHash.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/pHash.dir/link.txt --verbose=$(VERBOSE)
	$(CMAKE_COMMAND) -E cmake_symlink_library Release/libpHash.so.1.0.0 Release/libpHash.so.1.0.0 Release/libpHash.so

Release/libpHash.so: Release/libpHash.so.1.0.0
	@$(CMAKE_COMMAND) -E touch_nocreate Release/libpHash.so

# Rule to build all files generated by this target.
CMakeFiles/pHash.dir/build: Release/libpHash.so

.PHONY : CMakeFiles/pHash.dir/build

CMakeFiles/pHash.dir/requires: CMakeFiles/pHash.dir/src/pHash.cpp.o.requires
CMakeFiles/pHash.dir/requires: CMakeFiles/pHash.dir/src/cimgffmpeg.cpp.o.requires

.PHONY : CMakeFiles/pHash.dir/requires

CMakeFiles/pHash.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/pHash.dir/cmake_clean.cmake
.PHONY : CMakeFiles/pHash.dir/clean

CMakeFiles/pHash.dir/depend:
	cd /home/antoine/pHash && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/antoine/pHash /home/antoine/pHash /home/antoine/pHash /home/antoine/pHash /home/antoine/pHash/CMakeFiles/pHash.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/pHash.dir/depend

