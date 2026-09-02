; Program Name: Vehicle Speed. Copyright (C) 2026 David Perera
;
; This program is free software: you can redistribute it and/or modify it under the
; terms of the GNU General Public License version 3 as published by the Free Software
; Foundation. This program is distributed in the hope that it will be useful, but
; WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
; FITNESS FOR A PARTICULAR PURPOSE. A copy of the GNU General Public License v3 is
; available at <https://www.gnu.org/licenses/>.
;
; Author Information:
; Name: David Perera
; CWID: 884532367
; Section: CPSC 240-7
; Email: djperera28@csu.fullerton.edu
;
; Program Information:
; Name: Vehicle Speed
; Languages: C++ and x86-64 assembly, with a Bash build script
; Start Date: 2026-08-27
; Completion Date: 2026-09-
;
; Program's Purpose:
; Vehicle Speed obtains GPS measurements for the delivery route from Fullerton to
; Mission Viejo to Long Beach and back to Fullerton. It computes total driving time
; and average road speed for the complete route.
;
; This File:
; File: delivery.asm
; Function: expressdelivery
; Purpose: Collect six GPS values, calculate route totals, display the results, and
;          return the route's average speed to the C++ driver.
; Language: x86-64 assembly
; Syntax: Intel
; Assembler: NASM
; Assemble Command: nasm -f elf64 -l delivery.lis -o delivery.o delivery.asm
;
; Development Information:
; Platform: Linux x86-64
; Process: Edit, assemble, compile, link, execute, and verify sample results
; Tools: NASM assembler, GNU g++ compiler/linker, and a text editor
; Files: main.cpp, delivery.asm, macro.inc, r.sh
; Status: Completed and tested


; Declaration Section

extern printf
extern fgets
extern stdin
extern atof

global expressdelivery

maximum_number_of_characters_for_input equ 512

%include "macro.inc"


; segment .data is where initialized data is declared
segment .data

align 16

output_software_maintenance db "For assistance contact the developer at djperera28@csu.fullerton.edu.", 10, 0

prompt_fullerton_to_mission_viejo_distance db 10, "Enter the miles driven from Fullerton to Mission Viejo: ", 0
prompt_fullerton_to_mission_viejo_speed db "Enter the average speed (miles per hour) of that leg of the trip: ", 0

prompt_mission_viejo_to_long_beach_distance db 10, "Enter the miles driven from Mission Viejo to Long Beach: ", 0
prompt_mission_viejo_to_long_beach_speed db "Enter the average speed (miles per hour) of that leg of the trip: ", 0

prompt_long_beach_to_fullerton_distance db 10, "Enter the miles driven from Long Beach to Fullerton: ", 0
prompt_long_beach_to_fullerton_speed db "Enter the average speed (miles per hour) of that leg of the trip: ", 0

output_total_driving_time db 10, "The total driving time was %1.2lf hours.", 10, 0
output_average_speed db "The average speed was %1.2lf m/h", 10, 0

string_format db "%s", 0


; segment .bss is where uninitialized data is declared
segment .bss

fullerton_to_mission_viejo_distance_string resb maximum_number_of_characters_for_input
fullerton_to_mission_viejo_speed_string    resb maximum_number_of_characters_for_input
mission_viejo_to_long_beach_distance_string resb maximum_number_of_characters_for_input
mission_viejo_to_long_beach_speed_string    resb maximum_number_of_characters_for_input
long_beach_to_fullerton_distance_string resb maximum_number_of_characters_for_input
long_beach_to_fullerton_speed_string    resb maximum_number_of_characters_for_input

fullerton_to_mission_viejo_distance resq 1
fullerton_to_mission_viejo_speed    resq 1
mission_viejo_to_long_beach_distance resq 1
mission_viejo_to_long_beach_speed    resq 1
long_beach_to_fullerton_distance resq 1
long_beach_to_fullerton_speed    resq 1
total_driving_time resq 1
average_route_speed resq 1


; segment .text is where executable instructions are declared
segment .text

; The label expressdelivery defines the assembly function's entry point
expressdelivery:

; Preserve the calling program's general-purpose register environment
create_activation_record


; Introduce the developer responsible for the delivery calculator
mov rax, 0
mov rdi, string_format
mov rsi, output_software_maintenance
call printf


; Record the Fullerton-to-Mission-Viejo GPS measurements
mov rax, 0
mov rdi, string_format
mov rsi, prompt_fullerton_to_mission_viejo_distance
call printf

mov rax, 0
mov rdi, fullerton_to_mission_viejo_distance_string
mov rsi, maximum_number_of_characters_for_input
mov rdx, [stdin]
call fgets

mov rax, 0
mov rdi, fullerton_to_mission_viejo_distance_string
call atof
movsd qword [fullerton_to_mission_viejo_distance], xmm0

mov rax, 0
mov rdi, string_format
mov rsi, prompt_fullerton_to_mission_viejo_speed
call printf

mov rax, 0
mov rdi, fullerton_to_mission_viejo_speed_string
mov rsi, maximum_number_of_characters_for_input
mov rdx, [stdin]
call fgets

mov rax, 0
mov rdi, fullerton_to_mission_viejo_speed_string
call atof
movsd qword [fullerton_to_mission_viejo_speed], xmm0


; Record the Mission-Viejo-to-Long-Beach GPS measurements
mov rax, 0
mov rdi, string_format
mov rsi, prompt_mission_viejo_to_long_beach_distance
call printf

mov rax, 0
mov rdi, mission_viejo_to_long_beach_distance_string
mov rsi, maximum_number_of_characters_for_input
mov rdx, [stdin]
call fgets

mov rax, 0
mov rdi, mission_viejo_to_long_beach_distance_string
call atof
movsd qword [mission_viejo_to_long_beach_distance], xmm0

mov rax, 0
mov rdi, string_format
mov rsi, prompt_mission_viejo_to_long_beach_speed
call printf

mov rax, 0
mov rdi, mission_viejo_to_long_beach_speed_string
mov rsi, maximum_number_of_characters_for_input
mov rdx, [stdin]
call fgets

mov rax, 0
mov rdi, mission_viejo_to_long_beach_speed_string
call atof
movsd qword [mission_viejo_to_long_beach_speed], xmm0


; Record the Long-Beach-to-Fullerton GPS measurements
mov rax, 0
mov rdi, string_format
mov rsi, prompt_long_beach_to_fullerton_distance
call printf

mov rax, 0
mov rdi, long_beach_to_fullerton_distance_string
mov rsi, maximum_number_of_characters_for_input
mov rdx, [stdin]
call fgets

mov rax, 0
mov rdi, long_beach_to_fullerton_distance_string
call atof
movsd qword [long_beach_to_fullerton_distance], xmm0

mov rax, 0
mov rdi, string_format
mov rsi, prompt_long_beach_to_fullerton_speed
call printf

mov rax, 0
mov rdi, long_beach_to_fullerton_speed_string
mov rsi, maximum_number_of_characters_for_input
mov rdx, [stdin]
call fgets

mov rax, 0
mov rdi, long_beach_to_fullerton_speed_string
call atof
movsd qword [long_beach_to_fullerton_speed], xmm0


; Determine the truck's complete driving time over all three route legs
movsd xmm8, qword [fullerton_to_mission_viejo_distance]
divsd xmm8, qword [fullerton_to_mission_viejo_speed]

movsd xmm9, qword [mission_viejo_to_long_beach_distance]
divsd xmm9, qword [mission_viejo_to_long_beach_speed]
addsd xmm8, xmm9

movsd xmm10, qword [long_beach_to_fullerton_distance]
divsd xmm10, qword [long_beach_to_fullerton_speed]
addsd xmm8, xmm10

movsd qword [total_driving_time], xmm8


; Determine the truck's average road speed across the complete route
movsd xmm11, qword [fullerton_to_mission_viejo_distance]
addsd xmm11, qword [mission_viejo_to_long_beach_distance]
addsd xmm11, qword [long_beach_to_fullerton_distance]
divsd xmm11, qword [total_driving_time]

movsd qword [average_route_speed], xmm11


; Present the complete route's driving results to the delivery dispatcher
mov rax, 1
mov rdi, output_total_driving_time
movsd xmm0, qword [total_driving_time]
call printf

mov rax, 1
mov rdi, output_average_speed
movsd xmm0, qword [average_route_speed]
call printf


; Prepare the route's average speed for the C++ driver
movsd xmm0, qword [average_route_speed]


; Restore the calling program's general-purpose register environment
delete_activation_record

ret
