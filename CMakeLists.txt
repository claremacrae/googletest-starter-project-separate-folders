cmake_minimum_required(VERSION 3.8)
project(googletest-starter-project)

set(CMAKE_CXX_STANDARD 17)

if(EXISTS ${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
    include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
    # See See https://github.com/conan-io/conan/issues/1448 for why I use NO_OUTPUT_DIRS
    conan_basic_setup(NO_OUTPUT_DIRS)
else()
    message(WARNING "The file conanbuildinfo.cmake doesn't exist, you have to run conan install first")
endif()

enable_testing()
add_subdirectory(tests)
