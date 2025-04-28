# Design Flow

This section describes the design, development, and FPGA implementation flow for the 10-bit custom ISA processor.

---

## 1. RTL Design (Register-Transfer Level)

**Tools Used:**  
- **Language:** Verilog HDL
- **Tool:** Xilinx Vivado 2018.2+

**Activities:**
- Writing synthesizable Verilog modules:
  - ALU, Register File, Control Unit, Program Counter, Instruction Memory, Data Memory.
- Modular, testable design approach.
- Following synchronous digital design practices (positive edge-triggered).

---

## 2. RTL Analysis

**Activities:**
- Conducting syntax checks, elaboration, and RTL schematic generation in Vivado.
- Verifying the interconnection between modules via visual RTL netlists.
- Ensuring that:
  - Signal naming conventions are consistent.
  - Width matching between modules is proper.
  - No combinational loops exist.

---

## 3. Functional Simulation

**Activities:**
- Creating test programs (e.g., Factorial of 5, Square of 5) in assembly-like form.
- Writing testbenches to:
  - Monitor Program Counter (PC) behavior.
  - Check ALU operations.
  - Validate memory reads and writes.
  - Confirm HALT instruction operation.

**Results:**
- Correct PC sequencing.
- Correct computation and memory storage.
- Correct HALT assertion after completing execution.

---

## 4. Synthesis

**Activities:**
- Mapping RTL design into technology-specific logic primitives.
- Analyzing resource usage:
  - LUTs
  - Flip-Flops (FFs)
  - DSP blocks
  - IO pins
- Checking synthesis warnings/errors.

**Results Summary:**
- LUT usage: ~1%
- FF usage: ~1%
- DSP usage: ~1%
- IO usage: ~6%

---

## 5. Implementation

**Activities:**
- Placement and routing of synthesized logic on the target FPGA (Artix-7).
- Timing analysis:
  - Setup time checks.
  - Hold time checks.
- Design rule checks (DRC).
- Applying I/O constraints using the constraint file (`Processor.xdc`).

---

## 6. FPGA Programming

**Target Board:**  
- **Xilinx Nexys A7** (Artix-7 FPGA - XC7A100TCSG324-1)

**Activities:**
- Generating `.bit` file from Vivado.
- Loading the bitstream onto the FPGA using Vivado Hardware Manager.
- Verifying functional behavior on hardware by monitoring output pins.

---

## 7. Post-Implementation Validation

**Tests Conducted:**
- Verification of program execution (e.g., checking memory contents after factorial program).
- Monitoring clock, reset, HALT signal behavior using onboard LEDs/logic analyzers if needed.
- Power analysis (optional) to ensure low resource utilization.

---

# Tools Summary

| Stage | Tool           | Output                         |
|:------|:---------------|:-------------------------------|
| RTL Design | Verilog HDL  | Synthesizable source code |
| RTL Analysis | Vivado    | Netlist, RTL schematics |
| Simulation | Vivado Simulator | Waveforms, verification |
| Synthesis | Vivado | Netlist mapped to FPGA primitives |
| Implementation | Vivado | Routed design |
| FPGA Programming | Vivado Hardware Manager | Bitstream loaded |

---

# Conclusion

The structured flow from Verilog coding to FPGA implementation ensures a clean, error-free design process.  
Following this flow guarantees that the 10-bit custom ISA processor functions correctly both in simulation and on real hardware (FPGA).
