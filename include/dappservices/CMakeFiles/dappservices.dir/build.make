# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.13

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
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /workspace/zeus-ide/dapp/contracts/eos/dappservices

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /workspace/zeus-ide/dapp/contracts/eos/dappservices

# Include any dependencies generated for this target.
include CMakeFiles/dappservices.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/dappservices.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/dappservices.dir/flags.make

CMakeFiles/dappservices.dir/dappservices.cpp.obj: CMakeFiles/dappservices.dir/flags.make
CMakeFiles/dappservices.dir/dappservices.cpp.obj: dappservices.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/workspace/zeus-ide/dapp/contracts/eos/dappservices/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/dappservices.dir/dappservices.cpp.obj"
	/usr/bin/eosio-cpp  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/dappservices.dir/dappservices.cpp.obj -c /workspace/zeus-ide/dapp/contracts/eos/dappservices/dappservices.cpp

CMakeFiles/dappservices.dir/dappservices.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dappservices.dir/dappservices.cpp.i"
	/usr/bin/eosio-cpp $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspace/zeus-ide/dapp/contracts/eos/dappservices/dappservices.cpp > CMakeFiles/dappservices.dir/dappservices.cpp.i

CMakeFiles/dappservices.dir/dappservices.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dappservices.dir/dappservices.cpp.s"
	/usr/bin/eosio-cpp $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspace/zeus-ide/dapp/contracts/eos/dappservices/dappservices.cpp -o CMakeFiles/dappservices.dir/dappservices.cpp.s

# Object files for target dappservices
dappservices_OBJECTS = \
"CMakeFiles/dappservices.dir/dappservices.cpp.obj"

# External object files for target dappservices
dappservices_EXTERNAL_OBJECTS =

dappservices.wasm: CMakeFiles/dappservices.dir/dappservices.cpp.obj
dappservices.wasm: CMakeFiles/dappservices.dir/build.make
dappservices.wasm: CMakeFiles/dappservices.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/workspace/zeus-ide/dapp/contracts/eos/dappservices/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable dappservices.wasm"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/dappservices.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/dappservices.dir/build: dappservices.wasm

.PHONY : CMakeFiles/dappservices.dir/build

CMakeFiles/dappservices.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/dappservices.dir/cmake_clean.cmake
.PHONY : CMakeFiles/dappservices.dir/clean

CMakeFiles/dappservices.dir/depend:
	cd /workspace/zeus-ide/dapp/contracts/eos/dappservices && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /workspace/zeus-ide/dapp/contracts/eos/dappservices /workspace/zeus-ide/dapp/contracts/eos/dappservices /workspace/zeus-ide/dapp/contracts/eos/dappservices /workspace/zeus-ide/dapp/contracts/eos/dappservices /workspace/zeus-ide/dapp/contracts/eos/dappservices/CMakeFiles/dappservices.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/dappservices.dir/depend

