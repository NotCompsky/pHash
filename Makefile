# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Default target executed when no arguments are given to make.
default_target: all

.PHONY : default_target

# Allow only one "make -f Makefile2" at a time, but pass parallelism.
.NOTPARALLEL:


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

#=============================================================================
# Targets provided globally by CMake.

# Special rule for the target install/local
install/local: preinstall
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Installing only the local directory..."
	/usr/bin/cmake -DCMAKE_INSTALL_LOCAL_ONLY=1 -P cmake_install.cmake
.PHONY : install/local

# Special rule for the target install/local
install/local/fast: preinstall/fast
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Installing only the local directory..."
	/usr/bin/cmake -DCMAKE_INSTALL_LOCAL_ONLY=1 -P cmake_install.cmake
.PHONY : install/local/fast

# Special rule for the target install
install: preinstall
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Install the project..."
	/usr/bin/cmake -P cmake_install.cmake
.PHONY : install

# Special rule for the target install
install/fast: preinstall/fast
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Install the project..."
	/usr/bin/cmake -P cmake_install.cmake
.PHONY : install/fast

# Special rule for the target rebuild_cache
rebuild_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake to regenerate build system..."
	/usr/bin/cmake -H$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : rebuild_cache

# Special rule for the target rebuild_cache
rebuild_cache/fast: rebuild_cache

.PHONY : rebuild_cache/fast

# Special rule for the target edit_cache
edit_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "No interactive CMake dialog available..."
	/usr/bin/cmake -E echo No\ interactive\ CMake\ dialog\ available.
.PHONY : edit_cache

# Special rule for the target edit_cache
edit_cache/fast: edit_cache

.PHONY : edit_cache/fast

# Special rule for the target package
package: preinstall
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Run CPack packaging tool..."
	/usr/bin/cpack --config ./CPackConfig.cmake
.PHONY : package

# Special rule for the target package
package/fast: package

.PHONY : package/fast

# Special rule for the target list_install_components
list_install_components:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Available install components are: \"Unspecified\""
.PHONY : list_install_components

# Special rule for the target list_install_components
list_install_components/fast: list_install_components

.PHONY : list_install_components/fast

# Special rule for the target package_source
package_source:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Run CPack packaging tool for source..."
	/usr/bin/cpack --config ./CPackSourceConfig.cmake /home/antoine/pHash/CPackSourceConfig.cmake
.PHONY : package_source

# Special rule for the target package_source
package_source/fast: package_source

.PHONY : package_source/fast

# Special rule for the target install/strip
install/strip: preinstall
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Installing the project stripped..."
	/usr/bin/cmake -DCMAKE_INSTALL_DO_STRIP=1 -P cmake_install.cmake
.PHONY : install/strip

# Special rule for the target install/strip
install/strip/fast: preinstall/fast
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Installing the project stripped..."
	/usr/bin/cmake -DCMAKE_INSTALL_DO_STRIP=1 -P cmake_install.cmake
.PHONY : install/strip/fast

# The main all target
all: cmake_check_build_system
	$(CMAKE_COMMAND) -E cmake_progress_start /home/antoine/pHash/CMakeFiles /home/antoine/pHash/CMakeFiles/progress.marks
	$(MAKE) -f CMakeFiles/Makefile2 all
	$(CMAKE_COMMAND) -E cmake_progress_start /home/antoine/pHash/CMakeFiles 0
.PHONY : all

# The main clean target
clean:
	$(MAKE) -f CMakeFiles/Makefile2 clean
.PHONY : clean

# The main clean target
clean/fast: clean

.PHONY : clean/fast

# Prepare targets for installation.
preinstall: all
	$(MAKE) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall

# Prepare targets for installation.
preinstall/fast:
	$(MAKE) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall/fast

# clear depends
depend:
	$(CMAKE_COMMAND) -H$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 1
.PHONY : depend

#=============================================================================
# Target rules for targets named dev_images_compare

# Build rule for target.
dev_images_compare: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 dev_images_compare
.PHONY : dev_images_compare

# fast build rule for target.
dev_images_compare/fast:
	$(MAKE) -f CMakeFiles/dev_images_compare.dir/build.make CMakeFiles/dev_images_compare.dir/build
.PHONY : dev_images_compare/fast

#=============================================================================
# Target rules for targets named TestDCT

# Build rule for target.
TestDCT: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 TestDCT
.PHONY : TestDCT

# fast build rule for target.
TestDCT/fast:
	$(MAKE) -f CMakeFiles/TestDCT.dir/build.make CMakeFiles/TestDCT.dir/build
.PHONY : TestDCT/fast

#=============================================================================
# Target rules for targets named dev_video_compare

# Build rule for target.
dev_video_compare: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 dev_video_compare
.PHONY : dev_video_compare

# fast build rule for target.
dev_video_compare/fast:
	$(MAKE) -f CMakeFiles/dev_video_compare.dir/build.make CMakeFiles/dev_video_compare.dir/build
.PHONY : dev_video_compare/fast

#=============================================================================
# Target rules for targets named pHash

# Build rule for target.
pHash: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 pHash
.PHONY : pHash

# fast build rule for target.
pHash/fast:
	$(MAKE) -f CMakeFiles/pHash.dir/build.make CMakeFiles/pHash.dir/build
.PHONY : pHash/fast

#=============================================================================
# Target rules for targets named TestRadish

# Build rule for target.
TestRadish: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 TestRadish
.PHONY : TestRadish

# fast build rule for target.
TestRadish/fast:
	$(MAKE) -f CMakeFiles/TestRadish.dir/build.make CMakeFiles/TestRadish.dir/build
.PHONY : TestRadish/fast

#=============================================================================
# Target rules for targets named TestMH

# Build rule for target.
TestMH: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 TestMH
.PHONY : TestMH

# fast build rule for target.
TestMH/fast:
	$(MAKE) -f CMakeFiles/TestMH.dir/build.make CMakeFiles/TestMH.dir/build
.PHONY : TestMH/fast

#=============================================================================
# Target rules for targets named TestVideoHash

# Build rule for target.
TestVideoHash: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 TestVideoHash
.PHONY : TestVideoHash

# fast build rule for target.
TestVideoHash/fast:
	$(MAKE) -f CMakeFiles/TestVideoHash.dir/build.make CMakeFiles/TestVideoHash.dir/build
.PHONY : TestVideoHash/fast

#=============================================================================
# Target rules for targets named pHash-jni

# Build rule for target.
pHash-jni: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 pHash-jni
.PHONY : pHash-jni

# fast build rule for target.
pHash-jni/fast:
	$(MAKE) -f bindings/java/CMakeFiles/pHash-jni.dir/build.make bindings/java/CMakeFiles/pHash-jni.dir/build
.PHONY : pHash-jni/fast

examples/dev_images_compare.o: examples/dev_images_compare.cpp.o

.PHONY : examples/dev_images_compare.o

# target to build an object file
examples/dev_images_compare.cpp.o:
	$(MAKE) -f CMakeFiles/dev_images_compare.dir/build.make CMakeFiles/dev_images_compare.dir/examples/dev_images_compare.cpp.o
.PHONY : examples/dev_images_compare.cpp.o

examples/dev_images_compare.i: examples/dev_images_compare.cpp.i

.PHONY : examples/dev_images_compare.i

# target to preprocess a source file
examples/dev_images_compare.cpp.i:
	$(MAKE) -f CMakeFiles/dev_images_compare.dir/build.make CMakeFiles/dev_images_compare.dir/examples/dev_images_compare.cpp.i
.PHONY : examples/dev_images_compare.cpp.i

examples/dev_images_compare.s: examples/dev_images_compare.cpp.s

.PHONY : examples/dev_images_compare.s

# target to generate assembly for a file
examples/dev_images_compare.cpp.s:
	$(MAKE) -f CMakeFiles/dev_images_compare.dir/build.make CMakeFiles/dev_images_compare.dir/examples/dev_images_compare.cpp.s
.PHONY : examples/dev_images_compare.cpp.s

examples/dev_video_compare.o: examples/dev_video_compare.cpp.o

.PHONY : examples/dev_video_compare.o

# target to build an object file
examples/dev_video_compare.cpp.o:
	$(MAKE) -f CMakeFiles/dev_video_compare.dir/build.make CMakeFiles/dev_video_compare.dir/examples/dev_video_compare.cpp.o
.PHONY : examples/dev_video_compare.cpp.o

examples/dev_video_compare.i: examples/dev_video_compare.cpp.i

.PHONY : examples/dev_video_compare.i

# target to preprocess a source file
examples/dev_video_compare.cpp.i:
	$(MAKE) -f CMakeFiles/dev_video_compare.dir/build.make CMakeFiles/dev_video_compare.dir/examples/dev_video_compare.cpp.i
.PHONY : examples/dev_video_compare.cpp.i

examples/dev_video_compare.s: examples/dev_video_compare.cpp.s

.PHONY : examples/dev_video_compare.s

# target to generate assembly for a file
examples/dev_video_compare.cpp.s:
	$(MAKE) -f CMakeFiles/dev_video_compare.dir/build.make CMakeFiles/dev_video_compare.dir/examples/dev_video_compare.cpp.s
.PHONY : examples/dev_video_compare.cpp.s

examples/test_dctvideohash.o: examples/test_dctvideohash.cpp.o

.PHONY : examples/test_dctvideohash.o

# target to build an object file
examples/test_dctvideohash.cpp.o:
	$(MAKE) -f CMakeFiles/TestVideoHash.dir/build.make CMakeFiles/TestVideoHash.dir/examples/test_dctvideohash.cpp.o
.PHONY : examples/test_dctvideohash.cpp.o

examples/test_dctvideohash.i: examples/test_dctvideohash.cpp.i

.PHONY : examples/test_dctvideohash.i

# target to preprocess a source file
examples/test_dctvideohash.cpp.i:
	$(MAKE) -f CMakeFiles/TestVideoHash.dir/build.make CMakeFiles/TestVideoHash.dir/examples/test_dctvideohash.cpp.i
.PHONY : examples/test_dctvideohash.cpp.i

examples/test_dctvideohash.s: examples/test_dctvideohash.cpp.s

.PHONY : examples/test_dctvideohash.s

# target to generate assembly for a file
examples/test_dctvideohash.cpp.s:
	$(MAKE) -f CMakeFiles/TestVideoHash.dir/build.make CMakeFiles/TestVideoHash.dir/examples/test_dctvideohash.cpp.s
.PHONY : examples/test_dctvideohash.cpp.s

examples/test_imagephash.o: examples/test_imagephash.cpp.o

.PHONY : examples/test_imagephash.o

# target to build an object file
examples/test_imagephash.cpp.o:
	$(MAKE) -f CMakeFiles/TestDCT.dir/build.make CMakeFiles/TestDCT.dir/examples/test_imagephash.cpp.o
.PHONY : examples/test_imagephash.cpp.o

examples/test_imagephash.i: examples/test_imagephash.cpp.i

.PHONY : examples/test_imagephash.i

# target to preprocess a source file
examples/test_imagephash.cpp.i:
	$(MAKE) -f CMakeFiles/TestDCT.dir/build.make CMakeFiles/TestDCT.dir/examples/test_imagephash.cpp.i
.PHONY : examples/test_imagephash.cpp.i

examples/test_imagephash.s: examples/test_imagephash.cpp.s

.PHONY : examples/test_imagephash.s

# target to generate assembly for a file
examples/test_imagephash.cpp.s:
	$(MAKE) -f CMakeFiles/TestDCT.dir/build.make CMakeFiles/TestDCT.dir/examples/test_imagephash.cpp.s
.PHONY : examples/test_imagephash.cpp.s

examples/test_mhimagehash.o: examples/test_mhimagehash.cpp.o

.PHONY : examples/test_mhimagehash.o

# target to build an object file
examples/test_mhimagehash.cpp.o:
	$(MAKE) -f CMakeFiles/TestMH.dir/build.make CMakeFiles/TestMH.dir/examples/test_mhimagehash.cpp.o
.PHONY : examples/test_mhimagehash.cpp.o

examples/test_mhimagehash.i: examples/test_mhimagehash.cpp.i

.PHONY : examples/test_mhimagehash.i

# target to preprocess a source file
examples/test_mhimagehash.cpp.i:
	$(MAKE) -f CMakeFiles/TestMH.dir/build.make CMakeFiles/TestMH.dir/examples/test_mhimagehash.cpp.i
.PHONY : examples/test_mhimagehash.cpp.i

examples/test_mhimagehash.s: examples/test_mhimagehash.cpp.s

.PHONY : examples/test_mhimagehash.s

# target to generate assembly for a file
examples/test_mhimagehash.cpp.s:
	$(MAKE) -f CMakeFiles/TestMH.dir/build.make CMakeFiles/TestMH.dir/examples/test_mhimagehash.cpp.s
.PHONY : examples/test_mhimagehash.cpp.s

examples/test_radish.o: examples/test_radish.cpp.o

.PHONY : examples/test_radish.o

# target to build an object file
examples/test_radish.cpp.o:
	$(MAKE) -f CMakeFiles/TestRadish.dir/build.make CMakeFiles/TestRadish.dir/examples/test_radish.cpp.o
.PHONY : examples/test_radish.cpp.o

examples/test_radish.i: examples/test_radish.cpp.i

.PHONY : examples/test_radish.i

# target to preprocess a source file
examples/test_radish.cpp.i:
	$(MAKE) -f CMakeFiles/TestRadish.dir/build.make CMakeFiles/TestRadish.dir/examples/test_radish.cpp.i
.PHONY : examples/test_radish.cpp.i

examples/test_radish.s: examples/test_radish.cpp.s

.PHONY : examples/test_radish.s

# target to generate assembly for a file
examples/test_radish.cpp.s:
	$(MAKE) -f CMakeFiles/TestRadish.dir/build.make CMakeFiles/TestRadish.dir/examples/test_radish.cpp.s
.PHONY : examples/test_radish.cpp.s

src/cimgffmpeg.o: src/cimgffmpeg.cpp.o

.PHONY : src/cimgffmpeg.o

# target to build an object file
src/cimgffmpeg.cpp.o:
	$(MAKE) -f CMakeFiles/pHash.dir/build.make CMakeFiles/pHash.dir/src/cimgffmpeg.cpp.o
.PHONY : src/cimgffmpeg.cpp.o

src/cimgffmpeg.i: src/cimgffmpeg.cpp.i

.PHONY : src/cimgffmpeg.i

# target to preprocess a source file
src/cimgffmpeg.cpp.i:
	$(MAKE) -f CMakeFiles/pHash.dir/build.make CMakeFiles/pHash.dir/src/cimgffmpeg.cpp.i
.PHONY : src/cimgffmpeg.cpp.i

src/cimgffmpeg.s: src/cimgffmpeg.cpp.s

.PHONY : src/cimgffmpeg.s

# target to generate assembly for a file
src/cimgffmpeg.cpp.s:
	$(MAKE) -f CMakeFiles/pHash.dir/build.make CMakeFiles/pHash.dir/src/cimgffmpeg.cpp.s
.PHONY : src/cimgffmpeg.cpp.s

src/pHash.o: src/pHash.cpp.o

.PHONY : src/pHash.o

# target to build an object file
src/pHash.cpp.o:
	$(MAKE) -f CMakeFiles/pHash.dir/build.make CMakeFiles/pHash.dir/src/pHash.cpp.o
.PHONY : src/pHash.cpp.o

src/pHash.i: src/pHash.cpp.i

.PHONY : src/pHash.i

# target to preprocess a source file
src/pHash.cpp.i:
	$(MAKE) -f CMakeFiles/pHash.dir/build.make CMakeFiles/pHash.dir/src/pHash.cpp.i
.PHONY : src/pHash.cpp.i

src/pHash.s: src/pHash.cpp.s

.PHONY : src/pHash.s

# target to generate assembly for a file
src/pHash.cpp.s:
	$(MAKE) -f CMakeFiles/pHash.dir/build.make CMakeFiles/pHash.dir/src/pHash.cpp.s
.PHONY : src/pHash.cpp.s

# Help Target
help:
	@echo "The following are some of the valid targets for this Makefile:"
	@echo "... all (the default if no target is provided)"
	@echo "... clean"
	@echo "... depend"
	@echo "... install/local"
	@echo "... install"
	@echo "... rebuild_cache"
	@echo "... edit_cache"
	@echo "... package"
	@echo "... list_install_components"
	@echo "... dev_images_compare"
	@echo "... TestDCT"
	@echo "... package_source"
	@echo "... dev_video_compare"
	@echo "... pHash"
	@echo "... TestRadish"
	@echo "... TestMH"
	@echo "... install/strip"
	@echo "... TestVideoHash"
	@echo "... pHash-jni"
	@echo "... examples/dev_images_compare.o"
	@echo "... examples/dev_images_compare.i"
	@echo "... examples/dev_images_compare.s"
	@echo "... examples/dev_video_compare.o"
	@echo "... examples/dev_video_compare.i"
	@echo "... examples/dev_video_compare.s"
	@echo "... examples/test_dctvideohash.o"
	@echo "... examples/test_dctvideohash.i"
	@echo "... examples/test_dctvideohash.s"
	@echo "... examples/test_imagephash.o"
	@echo "... examples/test_imagephash.i"
	@echo "... examples/test_imagephash.s"
	@echo "... examples/test_mhimagehash.o"
	@echo "... examples/test_mhimagehash.i"
	@echo "... examples/test_mhimagehash.s"
	@echo "... examples/test_radish.o"
	@echo "... examples/test_radish.i"
	@echo "... examples/test_radish.s"
	@echo "... src/cimgffmpeg.o"
	@echo "... src/cimgffmpeg.i"
	@echo "... src/cimgffmpeg.s"
	@echo "... src/pHash.o"
	@echo "... src/pHash.i"
	@echo "... src/pHash.s"
.PHONY : help



#=============================================================================
# Special targets to cleanup operation of make.

# Special rule to run CMake to check the build system integrity.
# No rule that depends on this can have commands that come from listfiles
# because they might be regenerated.
cmake_check_build_system:
	$(CMAKE_COMMAND) -H$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 0
.PHONY : cmake_check_build_system

