# Instruction Set Manual

## Overview

The processor supports three instruction formats based on its 10-bit instruction width:

| Type    | Bit Division                               |
|:--------|:-------------------------------------------|
| R-Type  | [ OPCODE (4 bits) | SRC1/DEST (3 bits) | SRC2 (3 bits) ] |
| I-Type  | [ OPCODE (4 bits) | IMMEDIATE (6 bits) ]     |
| J-Type  | [ OPCODE (4 bits) | ADDRESS (6 bits) ]       |

Each instruction is decoded by the **InstructionDecoder module** and then directed by the **Control Unit** for execution.

---

## Detailed Instruction Set

| Opcode | Mnemonic | Description                               | Type  |
|:------:|:---------|:------------------------------------------|:-----:|
| 0000   | HALT     | Stop program execution                    | R-Type |
| 0001   | ADD      | Add two registers                         | R-Type |
| 0010   | MUL      | Multiply two registers                    | R-Type |
| 0011   | SUB      | Subtract SRC2 from SRC1                   | R-Type |
| 0100   | SET      | Load 6-bit immediate value into register  | I-Type |
| 0101   | SPLIT    | Extract upper/lower 5 bits from a register| R-Type |
| 0110   | LOAD     | Load data from Data Memory into register  | I-Type |
| 0111   | STORE    | Store register value into Data Memory     | I-Type |
| 1000   | BEQ      | Branch if register is zero (equal)         | J-Type |
| 1001   | JUMP     | Unconditional jump to address             | J-Type |
| 1010   | MOD2     | Extract LSB of register (even/odd check)  | R-Type |
| 1011   | INCR     | Increment register value by 1             | R-Type |
| 1100   | BNE      | Branch if register is non-zero (not equal)| J-Type |

---

## Instruction Encoding Example

### R-Type Example: ADD
```
Opcode: 0001
SRC1:  001 (reg1)
SRC2:  010 (reg2)
Binary: 0001 001 010
```
Meaning: Add the values of reg1 and reg2, store result back to destination register.

---

### I-Type Example: SET
```
Opcode: 0100
Immediate: 000110
Binary: 0100 000110
```
Meaning: Load the immediate value `6` into a specified register.

---

### J-Type Example: JUMP
```
Opcode: 1001
Address: 001010
Binary: 1001 001010
```
Meaning: Jump to instruction address `10`.

---

# Special Notes
- **MUL Result:** Splits into OUT_LO (low 10 bits) and OUT_HI (high 10 bits).
- **SPLIT Operation:** Controlled by SRC2 value to extract higher or lower nibble.
- **Branching (BEQ/BNE):** Based on ALU's ZERO flag output after a SUB operation.

---
