mkdir build64-release
cd    build64-release
conan install .. -s arch=x86_64 -s build_type=Release
cmake ..  -G "Visual Studio 15 2017 Win64"
cmake --build . --config release
ctest --build-config     release
cd ..

mkdir build64-debug
cd    build64-debug
conan install .. -s arch=x86_64 -s build_type=Debug
cmake ..  -G "Visual Studio 15 2017 Win64"
cmake --build . --config debug
ctest --build-config     debug
cd ..
