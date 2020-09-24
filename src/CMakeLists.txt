cmake_minimum_required(VERSION 3.13...3.18 FATAL_ERROR)

project(test
  VERSION 0.1.0
  LANGUAGES C CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_CXX_EXTENSIONS OFF)

find_package(Java COMPONENTS Development REQUIRED)
find_package(JNI REQUIRED)
find_package(SWIG 3.0 REQUIRED COMPONENTS java)
include(UseSWIG)

set_property(SOURCE A.i PROPERTY CPLUSPLUS ON)

swig_add_library(test_swig TYPE OBJECT
  LANGUAGE    java
  OUTPUT_DIR  ${PROJECT_BINARY_DIR}/src_managed/main/java
  OUTFILE_DIR .
  SOURCES     A.i
)

set_target_properties(test_swig PROPERTIES
  SWIG_USE_TARGET_INCLUDE_DIRECTORIES ON
  POSITION_INDEPENDENT_CODE ON
)

target_include_directories(test_swig PRIVATE
  ${JNI_INCLUDE_DIRS}
  .
)

add_library(test SHARED
  $<TARGET_OBJECTS:test_swig>
)
