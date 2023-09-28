@echo off

set TARGET_DIR=C:\Libs\kaitai_struct_cpp_stl_runtime

mkdir %TARGET_DIR% 2> NUL
mkdir %TARGET_DIR%\include 2> NUL
mkdir %TARGET_DIR%\include\kaitai 2> NUL
copy ..\kaitai\kaitaistream.h %TARGET_DIR%\include\kaitai
copy ..\kaitai\kaitaistruct.h %TARGET_DIR%\include\kaitai
copy ..\kaitai\exceptions.h %TARGET_DIR%\include\kaitai

mkdir "%TARGET_DIR%\Lib_MSVC_32" 2> NUL
copy Lib\kaitai_struct_cpp_stl_runtime.lib "%TARGET_DIR%\Lib_MSVC_32"
