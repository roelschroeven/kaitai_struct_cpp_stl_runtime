<#
.DESCRIPTION
Builds Kaitai Struct C++ runtime library and unit tests on Windows using Mingw

Requires:
- Mingw installed and available in the command prompt
- cmake/ctest available
- GTest installed, path passed in `-GTestPath`
#>

[CmdletBinding()]
param (
    [Parameter(Mandatory=$true)]
    [string] $GTestPath
)

# Standard boilerplate
Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"
$PSDefaultParameterValues['*:ErrorAction']='Stop'

# Go to repo root
$repoRoot = (Resolve-Path "$PSScriptRoot\..").Path
Push-Location $repoRoot

$null = New-Item build -ItemType Directory -Force
cd build

cmake -DCMAKE_PREFIX_PATH="$GTestPath" -DSTRING_ENCODING_TYPE=NONE -G "MinGW Makefiles" ..
cmake --build . --config Debug

Get-ChildItem -Recurse

Pop-Location
