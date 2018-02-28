# googletest-starter-project-separate-folders

This demonstrates how to use [Conan.io](http://docs.conan.io/en/latest/introduction.html) with [cmake](https://cmake.org/documentation/) to create multiple single-configuration Visual Studio 2017 solution files.

## Usage

To use:

1. Clone or download this repo
2. Make sure you have CMake installed
3. Make sure you have Conan installed
4. Run `build_and_test.bat`
5. You can also either of the following solution files in Visual Studio, but you must be careful to only build the supported configurations:
    * `build64-release\googletest-starter-project.sln`
        * MinSizeRel, Release, RelWithDebInfo work
        * Debug gives

```
gtest.lib(gtest-all.obj) : error LNK2038: mismatch detected for '_ITERATOR_DEBUG_LEVEL': value '0' doesn't match value '2' in main.obj
gtest.lib(gtest-all.obj) : error LNK2038: mismatch detected for 'RuntimeLibrary': value 'MD_DynamicRelease' doesn't match value 'MDd_DynamicDebug' in main.obj
LINK : warning LNK4098: defaultlib 'MSVCRT' conflicts with use of other libs; use /NODEFAULTLIB:library
C:\Users\Clare\Documents\Programming\GitHub\googletest-starter-project-separate-folders\build64-release\tests\Debug\tests.exe : fatal error LNK1319: 2 mismatches detected
```
        
    * `build64-debug\googletest-starter-project.sln`
        * Debug works
        * Release, MinSizeRel, RelWithDebInfo all give LNK2038, LNK2019 link errors

## Things to note

* This uses conan's [`cmake`](http://docs.conan.io/en/latest/reference/generators/cmake.html) generator, which can only generate a single configuration at a time
* Don't be tempted to use [`visual_studio`](http://docs.conan.io/en/latest/reference/generators/visualstudio.html) - it is for the case where you are hand-maintaining the contents of your solution files and projects, and just want Conan to manage 3rd-party dependencies.