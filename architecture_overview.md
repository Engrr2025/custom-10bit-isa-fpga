# Architecture Overview

## Processor Overview

This project implements a **custom 10-bit ISA processor**. The design is inspired by **RISC-V** and **MIPS** architectures but tailored for simplicity, educational exploration, and efficient FPGA implementation.

**Key Features:**
- **Word Size:** 10-bit wide instructions, registers, data, and ALU operations.
- **Instruction Types:** Supports **R-Type**, **I-Type**, and **J-Type** instructions.
- **Clocked Synchronous Design:** Every operation is triggered on the positive clock edge.
- **FPGA Platform:** Implemented on **Xilinx Nexys A7 FPGA** using **Artix-7 (XC7A100TCSG324-1)**.
- **Design Language:** Verilog HDL.

---

## Core Processor Components

### 1. ALU (Arithmetic Logic Unit)
- **Operations Supported:**
  - **ADD**: Addition of two registers.
  - **SUB**: Subtraction between two registers.
  - **MUL**: Multiplication resulting in a 20-bit product (split into OUT_LO and OUT_HI).
  - **XOR**: Bitwise exclusive-OR.
  - **SPLIT**: Extract upper or lower 5 bits.
  - **MOD2**: Check even/odd (based on LSB).
  - **PASS**: Pass input directly to output.
  - **INCR**: Increment input value by 1.
- **Special Notes:**
  - For multiplication (MUL), the result is 20 bits and divided into low and high parts.

### 2. Register File
- **8 General Purpose Registers** (`reg0` to `reg7`).
- **Each register:** 10 bits wide.
- **Features:**
  - Dual-read capability (two simultaneous reads).
  - Single-write capability (one write per clock cycle).
  - Uses a **3-to-8 decoder** and **10-bit D flip-flops** for implementation.

### 3. Program Counter (PC)
- 10-bit register that holds the address of the current instruction.
- Incremented automatically or updated for branching and jumping operations.

### 4. Instruction Decoder
- Parses the incoming 10-bit instruction into:
  - 4-bit **Opcode**
  - 3-bit **Source 1 (SRC1)**
  - 3-bit **Source 2 (SRC2)**
  - 6-bit **Immediate Value** or **Address** (for I-Type and J-Type)

### 5. Control Unit
- Generates control signals based on the 4-bit Opcode.
- Handles:
  - ALU operation selection.
  - Memory read/write enable signals.
  - Jump and branch control.
  - Register write control.

### 6. Instruction Memory
- ROM-based memory.
- Stores up to **64 instructions**.
- Asynchronous read access based on the Program Counter.

### 7. Data Memory
- RAM-based memory.
- **256 entries** of **10-bit** width.
- Supports read and write operations based on control signals.

---

## Data Path and Control Path Overview

- **Data Path:** Includes PC, Instruction Memory, ALU, Register File, and Data Memory.
- **Control Path:** Includes Instruction Decoder and Control Unit that orchestrate the operation of the data path.

---

# Conclusion

This architecture showcases a compact, functional processor designed to cover essential computational features while keeping hardware minimal.  
Perfect for learning **processor design**, **Verilog**, **FPGA programming**, and **custom ISA development**.
