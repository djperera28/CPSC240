// Program Name: Vehicle Speed. Copyright (C) 2026 David Perera
//
// This program is free software: you can redistribute it and/or modify it under the
// terms of the GNU General Public License version 3 as published by the Free Software
// Foundation. This program is distributed in the hope that it will be useful, but
// WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
// FITNESS FOR A PARTICULAR PURPOSE. A copy of the GNU General Public License v3 is
// available at <https://www.gnu.org/licenses/>.
//
// Author Information:
// Name: David Perera
// CWID: 884532367
// Section: CPSC 240-7
// Email: djperera28@csu.fullerton.edu
//
// Program Information:
// Name: Vehicle Speed
// Languages: C++ and x86-64 assembly, with a Bash build script
// Start Date: 2026-09-02
// Completion Date: 2026-09-02
//
// Program's Purpose:
// Vehicle Speed obtains GPS measurements for a three-leg delivery route, computes the
// truck's total driving time and route-wide average speed, and returns that average to
// the C++ driver.
//
// This File:
// File: main.cpp
// Function: main
// Purpose: Welcome the user, call the expressdelivery assembly function, receive the
//          route's average speed, and terminate the application normally.
// Language: C++20
// Compiler: GNU g++
// Compile Command: g++ -c -Wall -m64 -no-pie -o main.o main.cpp -std=c++2a
//
// Development Information:
// Platform: Linux x86-64
// Process: Edit, assemble, compile, link, execute, and verify sample results
// Files: main.cpp, delivery.asm, macro.inc, r.sh
// Status: Completed and tested
// Execution: ./go.out

#include <stdio.h>
#include <iostream>

extern "C" double expressdelivery();

int main(int argc, char* argv[]) {

    printf("\nWelcome to American Express Delivery Service\n");
    printf("This software is maintained by David Perera.\n");

    double route_average_speed = expressdelivery();

    printf("\nThe driver received this number %1.2lf and will keep it for future use.\n",
           route_average_speed);

    printf("\nThank you for using our software. Have a nice day.\n");
    printf("An integer zero will be returned to the operating system.\n");

    return 0;
}
