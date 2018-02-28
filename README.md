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
        * Debug gives linker errors - see below
    * `build64-debug\googletest-starter-project.sln`
        * Debug works
        * Release, MinSizeRel, RelWithDebInfo all give linker errors - see below

## Things to note

* This uses conan's [`cmake`](http://docs.conan.io/en/latest/reference/generators/cmake.html) generator, which can only generate a single configuration at a time
* Don't be tempted to use the [`visual_studio`](http://docs.conan.io/en/latest/reference/generators/visualstudio.html) generator - it is for the case where you are hand-maintaining the contents of your solution files and projects, and just want Conan to manage 3rd-party dependencies.
* When building inside Visual Studio, if you get any of the following errors, it means you are building a configuration that differs from the one the .sln file was set up for, that is, you have opened the debug .sln, and create a release build, or vice versa.

```
1>gtest.lib(gtest-all.obj) : error LNK2038: mismatch detected for '_ITERATOR_DEBUG_LEVEL': value '2' doesn't match value '0' in main.obj
1>gtest.lib(gtest-all.obj) : error LNK2038: mismatch detected for 'RuntimeLibrary': value 'MDd_DynamicDebug' doesn't match value 'MD_DynamicRelease' in main.obj
1>LINK : warning LNK4098: defaultlib 'MSVCRTD' conflicts with use of other libs; use /NODEFAULTLIB:library
1>gtest.lib(gtest-all.obj) : error LNK2019: unresolved external symbol __imp__invalid_parameter referenced in function "void * __cdecl std::_Allocate<struct std::_Default_allocate_traits<1> >(unsigned __int64,unsigned __int64,unsigned __int64)" (??$_Allocate@U?$_Default_allocate_traits@$00@std@@@std@@YAPEAX_K0_K@Z)
1>gtest.lib(gtest-all.obj) : error LNK2019: unresolved external symbol __imp__calloc_dbg referenced in function "char * __cdecl std::_Maklocstr<char>(char const *,char *,struct _Cvtvec const &)" (??$_Maklocstr@D@std@@YAPEADPEBDPEADAEBU_Cvtvec@@@Z)
1>gtest.lib(gtest-all.obj) : error LNK2019: unresolved external symbol __imp__CrtDbgReportW referenced in function "void * __cdecl std::_Allocate<struct std::_Default_allocate_traits<1> >(unsigned __int64,unsigned __int64,unsigned __int64)" (??$_Allocate@U?$_Default_allocate_traits@$00@std@@@std@@YAPEAX_K0_K@Z)
1>C:\Users\Clare\Documents\Programming\GitHub\googletest-starter-project-separate-folders\build64-debug\tests\Release\tests.exe : fatal error LNK1120: 3 unresolved externals
```

```
gtest.lib(gtest-all.obj) : error LNK2038: mismatch detected for '_ITERATOR_DEBUG_LEVEL': value '0' doesn't match value '2' in main.obj
gtest.lib(gtest-all.obj) : error LNK2038: mismatch detected for 'RuntimeLibrary': value 'MD_DynamicRelease' doesn't match value 'MDd_DynamicDebug' in main.obj
LINK : warning LNK4098: defaultlib 'MSVCRT' conflicts with use of other libs; use /NODEFAULTLIB:library
C:\Users\Clare\Documents\Programming\GitHub\googletest-starter-project-separate-folders\build64-release\tests\Debug\tests.exe : fatal error LNK1319: 2 mismatches detected
```

