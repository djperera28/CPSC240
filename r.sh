#!/bin/bash

# Program Name: Vehicle Speed. Copyright (C) 2026 David Perera
#
# This program is free software: you can redistribute it and/or modify it under the
# terms of the GNU General Public License version 3 as published by the Free Software
# Foundation. This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE. A copy of the GNU General Public License v3 is
# available at <https://www.gnu.org/licenses/>.
#
# Author Information:
# Name: David Perera
# CWID: 884532367
# Section: CPSC 240-7
# Email: djperera28@csu.fullerton.edu
#
# Program Information:
# Name: Vehicle Speed
# Languages: Bash, C++20, and x86-64 assembly using Intel syntax
# Files: main.cpp, delivery.asm, macro.inc, r.sh
#
# This File:
# File: r.sh
# Purpose: Remove earlier build products, assemble delivery.asm, compile main.cpp,
#          link both object files, execute Vehicle Speed, and terminate normally.
# Platform: Linux x86-64
# Tools: NASM assembler, GNU g++ compiler/linker, and vs code
# Execution: chmod u+x r.sh && ./r.sh

set -e

echo "Remove old executable files if there are any"
rm -f ./*.out ./*.o ./*.lis

echo "Assemble the X86 file delivery.asm"
nasm -f elf64 -l delivery.lis -o delivery.o delivery.asm

echo "Compile the C++ file main.cpp"
g++ -c -Wall -m64 -no-pie -o main.o main.cpp -std=c++2a

echo "Link the two object files main.o and delivery.o"
g++ -m64 -no-pie -o go.out delivery.o main.o -std=c++2a -Wall -z noexecstack

echo "Next Vehicle Speed will run"
./go.out

echo "This bash file will now terminate."
