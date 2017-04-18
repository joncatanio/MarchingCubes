Lab 3 - Installing prerequisite software
========================================

Lab machines
------------

The compiler and CMake should already be installed. Skip to "Install glm,
GLFW, and GLEW" below.


Ubuntu Linux
------------

You'll need the following if you don't have them already.

	> sudo apt-get update
	> sudo apt-get install g++
	> sudo apt-get install cmake
	> sudo apt-get install freeglut3-dev
	> sudo apt-get install libxrandr-dev
	> sudo apt-get install libxinerama-dev
	> sudo apt-get install libxcursor-dev

Although GLM, GLFW, and GLEW are also available as packages, we'll download
them separately. Feel free to get these packages, but we won't be using them
for building our labs and assignments.


Mac OS X
--------

You can use homebrew/macports or install these manually.

- Xcode developer tools. You'll need to log in with your Apple ID.
- CMake (<http://cmake.org/download/>)

Make sure the commands `g++` and `cmake` work from the command prompt.


Windows
-------

You'll need to download these manually.

- Visual Studio (Visual C++). Any version should work. I've tested Visual
  Studio 2015 (aka version 14) on Windows 8.
- CMake (<http://cmake.org/download/>). Make sure to add CMake to the system
  path when asked to do so.

Make sure the command `cmake` works from the command prompt.


Install GLM, GLFW, and GLEW
=============================


Lab machines
------------

For compatibility issues with the old version of g++ installed on the lab
machines, we will be using these files on my home directory. Download these
and extract them somewhere (e.g., `~/lib/`).

- GLM: <http://github.com/g-truc/glm> 
- GLFW: cp ~zwood/lib/glfw-3.1.2.zip lib/. 
- GLEW: <http://glew.sourceforge.net/> 
- Compile the source by typing `make`. (This could take a while.)


All platforms except lab machines
---------------------------------

For all other platforms, you can download the latest versions from the web.
For each of these libraries, download and extract them somewhere (e.g.,
`~/lib`).

- GLM: get the header from <http://github.com/g-truc/glm>.
- GLFW: get the source from <http://www.glfw.org/download.html>.
- GLEW
    - OSX & Linux
        - Get the source from <http://glew.sourceforge.net/>.
        - Compile the source by typing `make -j4`. (This could take a while.)
    - Windows
        - Get the Windows binaries from <http://glew.sourceforge.net/>.


Set the environment variables for GLM, GLFW, and GLEW
=======================================================


OSX & Linux
-----------

In `~/.bash_profile` (or `~/.bashrc` if `.bash_profile` doesn't exist), add the
following lines.

	export GLM_INCLUDE_DIR=ABS_PATH_TO_GLM
	export GLFW_DIR=ABS_PATH_TO_GLFW
	export GLEW_DIR=ABS_PATH_TO_GLEW

Set these variables to point to the directories that you extracted GLM,
GLFW, and GLEW to.


Windows
-------

Control Panel -> System -> Advanced -> Environment Variables -> User Variables

- Set `GLM_INCLUDE_DIR` to `/path/to/glm`
- Set `GLFW_DIR` to `/path/to/GLFW`
- Set `GLEW_DIR` to `/path/to/GLEW`

Each of the `/path/to/*` should point to the absolute path of the libraries
that you just installed.


Important Note on Including GLEW
------------------------------------------

- If you're having trouble linking with GLEW, make sure you `#define GLEW_STATIC` before you `#include <GL/glew.h>`.


Building and Running the Lab/Assignment
=======================================


All platforms
-------------

Download and extract the lab file:

We'll perform an "out-of- source" build, which means that the binary files
will not be in the same directory as the source files. In the folder that
contains CMakeLists.txt, run the following.

	> mkdir build
	> cd build

Then run one of the following *from the build folder*, depending on your
choice of platform and IDE.


OSX & Linux Makefile
--------------------

	> cmake ..

This will generate a Makefile that you can use to compile your code. To
compile the code, run the generated Makefile.

	> make -j4

The `-j` argument speeds up the compilation by multithreading the compiler.
This will generate an executable, which you can run by typing

	> ./Lab3 ../resources

To build in release mode, use `ccmake ..` and change `CMAKE_BUILD_TYPE` to
`Release`. Press 'c' to configure then 'g' to generate. Now `make -j4` will
build in release mode.

To change the compiler, read [this
page](http://cmake.org/Wiki/CMake_FAQ#How_do_I_use_a_different_compiler.3F).
The best way is to use environment variables before calling cmake. For
example, to use the Intel C++ compiler:

	> which icpc # copy the path
	> CXX=/path/to/icpc cmake ..


OSX Xcode
---------

	> cmake -G Xcode ..

This will generate `Lab3.xcodeproj` project that you can open with Xcode.

- To run, change the target to `Lab00` by going to Product -> Scheme -> Lab00.
  Then click on the play button or press Command+R to run the application.
- Edit the scheme to add command-line arguments (`../../resources`) or to run
  in release mode.


Windows Visual Studio 2015
--------------------------

	> cmake ..

By default on Windows, CMake will generate a Visual Studio solution file,
`Lab00.sln`, which you can open by double-clicking. If you get a version
mismatch, you may have to specify your visual studio version, for example:

	> cmake -G "Visual Studio 14 2015" ..

Other versions of Visual Studio are listed on the CMake page
(<http://cmake.org/cmake/help/latest/manual/cmake-generators.7.html>).

- To build and run the project, right-click on `Lab3` in the project explorer
  and then click on "Set as Startup Project." Then press F7 (Build Solution)
  and then F5 (Start Debugging).
- To add a commandline argument (`../resources`), right-click on `Lab3` in
  the project explorer and then click on "Properties" and then click on
  "Debugging."

