# Custom 10-bit ISA Processor 🚀

An FPGA-implemented, RISC-V and MIPS-inspired 10-bit Instruction Set Architecture (ISA) processor.  
Designed and developed using Verilog HDL, simulated and synthesized with Xilinx Vivado, and deployed on the Nexys A7 FPGA.

---

## 📚 Project Overview

This project builds a simple yet powerful single-cycle processor that executes a small set of R-Type, I-Type, and J-Type instructions.  
It emphasizes clarity, modularity, and practical demonstration of computer architecture principles.

| Feature              | Details                     |
|:---------------------|:-----------------------------|
| Word Size             | 10-bit                      |
| Instruction Width     | 10-bit                      |
| Instruction Types     | R-Type, I-Type, J-Type       |
| FPGA Board            | Nexys A7 (Artix-7 XC7A100TCSG324-1) |
| Development Tools     | Verilog HDL, Xilinx Vivado   |

---

## 🛠 Core Components

- **ALU (Arithmetic Logic Unit):** Performs ADD, SUB, MUL, XOR, SPLIT, MOD2, PASS, and INCR operations.
- **Register File:** 8 registers, dual-read, single-write, each 10 bits wide.
- **Program Counter (PC):** Supports sequential execution, jumps, and branches.
- **Instruction Decoder:** Splits 10-bit instructions into control and data fields.
- **Control Unit:** Generates necessary control signals for all operations.
- **Instruction Memory:** 64 x 10-bit ROM for program storage.
- **Data Memory:** 256 x 10-bit RAM for runtime data.

---

## 📜 Instruction Set

| Opcode | Mnemonic | Operation                       |
|:------:|:---------|:---------------------------------|
| 0000   | HALT     | Stop execution                   |
| 0001   | ADD      | Add SRC1 and SRC2                 |
| 0010   | MUL      | Multiply SRC1 and SRC2            |
| 0011   | SUB      | Subtract SRC2 from SRC1           |
| 0100   | SET      | Load immediate into destination  |
| 0101   | SPLIT    | Extract upper/lower 5 bits        |
| 0110   | LOAD     | Load data from Data Memory        |
| 0111   | STORE    | Store data into Data Memory       |
| 1000   | BEQ      | Branch if equal to zero           |
| 1001   | JUMP     | Unconditional jump               |
| 1010   | MOD2     | Check if even (LSB check)         |
| 1011   | INCR     | Increment a register by 1         |
| 1100   | BNE      | Branch if not equal to zero       |

Detailed explanation is available in [docs/instruction_set_manual.md](./docs/instruction_set_manual.md).

---

## 🧩 Repository Structure

```
├── docs/
│   ├── architecture_overview.md
│   ├── instruction_set_manual.md
│   └── design_flow.md
├── src/
│     ├── alu.v
│     ├── control.v
│     ├── data_memory.v
│     ├── instruction_decoder.v
│     ├── instruction_memory.v
│     ├── mux8x1.v
│     ├── dff_10bit.v
│     ├── program_counter.v
│     ├── reg_file.v
│     └── processor.v
├── constraints/
│   └── Processor.xdc
├── simulation and Other/
│   └── (simulation outputs mainly )
├── README.md
└── LICENSE
```

---

## 🛠 How to Build and Deploy

### 1. Clone this Repository
```bash
git clone https://github.com/yourusername/custom-10bit-isa-fpga.git
cd custom-10bit-isa-fpga
```

### 2. Open in Vivado
- Create a new Vivado project.
- Add all Verilog (`src/rtl/`) files.
- Apply the `nexysA7.xdc` constraints file.
- Set `processor.v` as the top module.

### 3. Simulation (Optional)
- Create a testbench (or use provided ones).
- Verify functionality using Vivado Simulator.

### 4. Synthesis and Implementation
- Run Synthesis → Run Implementation → Generate Bitstream.

### 5. Upload Bitstream
- Connect Nexys A7 FPGA via USB.
- Program the FPGA via Vivado Hardware Manager.

---

## 📈 Simulation Highlights

- **Factorial of 5**: Correct loop execution and memory storage.
- **Square of 5**: Multiplication validated.
- **HALT Execution**: Proper program termination behavior.

More simulation details available in [docs/design_flow.md](./docs/design_flow.md).

---

## ⚙️ FPGA Resource Utilization

| Resource | Usage |
|:---------|:------|
| LUTs     | ~1%   |
| FFs      | ~1%   |
| DSPs     | ~1%   |
| IO Pins  | ~6%   |

---

## 📋 License

This project is licensed under the [MIT License](./LICENSE).

---

## ✨ Contributors (Group Memebers)

- **Junaid Khalid** — [GitHub Profile](https://github.com/Engrr2025)  
- **Abdul Rahman**  

Mentored by **Sir Ali Roman**, COMSATS University Islamabad – Wah Campus.

---

> Made with ❤️ for learning, hardware exploration, and FPGA fun!
