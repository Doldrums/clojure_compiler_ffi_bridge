# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

project(clojure_compiler_ffi_bridge_library VERSION 0.0.1 LANGUAGES C)

add_library(clojure_compiler_ffi_bridge SHARED
  "clojure_compiler_ffi_bridge.c"
)

set_target_properties(clojure_compiler_ffi_bridge PROPERTIES
  PUBLIC_HEADER clojure_compiler_ffi_bridge.h
  OUTPUT_NAME "clojure_compiler_ffi_bridge"
)

target_compile_definitions(clojure_compiler_ffi_bridge PUBLIC DART_SHARED_LIB)
