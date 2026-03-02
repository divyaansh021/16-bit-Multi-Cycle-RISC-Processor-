# 16-bit Multi-Cycle RISC Processor 

## 📖 Overview

This project implements a **16-bit multi-cycle RISC-style processor**
using Verilog HDL.\
The processor follows a **load-store architecture** and executes
instructions across multiple clock cycles using an FSM-based control
unit.

The design demonstrates core concepts of **computer architecture, RTL
design, and processor microarchitecture**, and was verified using Xilinx
Vivado simulation.

------------------------------------------------------------------------

## 🏗 Architecture

The processor consists of the following components:

-   Program Counter (PC)
-   Instruction Memory
-   Instruction Register (IR)
-   FSM-based Control Unit
-   Register File (4 × 16-bit registers)
-   Arithmetic Logic Unit (ALU)
-   Data Memory
-   Writeback Multiplexer

### Multi-Cycle Execution Stages

1.  Fetch\
2.  Decode\
3.  Execute\
4.  Memory\
5.  Writeback

------------------------------------------------------------------------

## 🧮 Supported Instructions

  Opcode   Instruction   Operation
  -------- ------------- ---------------------
  0000     ADD           Rd ← Rd + Rs
  0001     SUB           Rd ← Rd - Rs
  0010     AND           Rd ← Rd & Rs
  0011     OR            Rd ← Rd \| Rs
  0100     XOR           Rd ← Rd \^ Rs
  0101     NOT           Rd ← \~Rd
  0110     LOAD          Rd ← MEM\[address\]
  0111     STORE         MEM\[address\] ← Rd
  1000     MOV           Rd ← Rs

------------------------------------------------------------------------

## 📐 Datapath Design Features

-   Dual-read, single-write register file
-   16-bit ALU supporting arithmetic and logic operations
-   Separate instruction and data memory
-   Instruction Register (IR) for stable multi-cycle execution
-   Memory-to-register writeback multiplexer
-   Synchronous FSM control unit

------------------------------------------------------------------------

## 🧪 Verification

The processor was verified using a comprehensive Verilog testbench that
validates:

-   Arithmetic operations (ADD, SUB)
-   Logical operations (AND, OR, XOR, NOT)
-   Load and Store memory operations
-   Move instruction
-   Two's complement subtraction
-   Multi-cycle control sequencing

### Example Simulation Result

    R0 = 0000
    R1 = FFFB
    R2 = 000E
    R3 = 000A
    MEM[20] = 000E

------------------------------------------------------------------------

## 🛠 Tools Used

-   Verilog HDL\
-   Xilinx Vivado 2025.2\
-   XSim Simulator

------------------------------------------------------------------------

## 🎯 Key Concepts Demonstrated

-   Multi-cycle processor architecture
-   FSM-based control unit design
-   Datapath and control separation
-   Load-store RISC architecture
-   RTL hardware design methodology
-   Functional simulation and verification

------------------------------------------------------------------------

## 🚀 Possible Enhancements

-   Branch instructions (BEQ)
-   Immediate arithmetic (ADDI)
-   Status flags (Zero / Negative)
-   Pipeline implementation
-   Expanded register file

------------------------------------------------------------------------

## 👨‍💻 Author

Divyaansh Dhingra\
Electrical Engineering
