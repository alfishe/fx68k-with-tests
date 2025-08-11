#!/bin/bash
# Build script for ModelSim
set -e
cd sim/modelsim
vsim -c -do compile.do
