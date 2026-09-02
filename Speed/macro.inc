; Author Information:
; Name: David Perera
; CWID: 884532367
; Section: CPSC 240-7
; Email: djperera28@csu.fullerton.edu
;
; Program Information:
; Name: Vehicle Speed
; Languages: C++ and x86-64 assembly, with a Bash build script
; Files: main.cpp, delivery.asm, macro.inc, r.sh
;
; This File:
; File: macro.inc
; Purpose: Provide the activation-record macros used to preserve and restore the
;          delivery function's general-purpose register environment.
; Language: x86-64 assembly
; Syntax: Intel
; Assembler: NASM

; Preserve the delivery driver's general-purpose register environment
%macro create_activation_record 0
    push rbp
    mov  rbp, rsp
    push rbx
    push rcx
    push rdx
    push rdi
    push rsi
    push r8
    push r9
    push r10
    push r11
    push r12
    push r13
    push r14
    push r15
    pushf
%endmacro

; Restore the delivery driver's general-purpose register environment
%macro delete_activation_record 0
    popf
    pop r15
    pop r14
    pop r13
    pop r12
    pop r11
    pop r10
    pop r9
    pop r8
    pop rsi
    pop rdi
    pop rdx
    pop rcx
    pop rbx
    pop rbp
%endmacro
