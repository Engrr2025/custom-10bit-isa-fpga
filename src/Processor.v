`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 05:50:55 PM
// Design Name: 
// Module Name: Processor
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Processor(
    input CLK,
    input RESET,               // Reset signal
    output [9:0] PC_OUT,       // Program Counter output
    output HALT                // HALT signal
);

    // Internal Wires
    wire [9:0] INSTRUCTION;        // Instruction from memory
    wire [3:0] OPCODE;             // Opcode
    wire [2:0] SRC1, SRC2, DEST;   // R-Type registers and destination register
    wire [5:0] IMMEDIATE, ADDRESS; // Immediate and J-Type address
    wire [9:0] ALU_OUT_LO, ALU_OUT_HI, WB_DATA, MemData, ReadA, ReadB;
    wire ZERO, REG_WRITE, MEM_WRITE, MEM_OR_ALU, INCR_OP, JUMP, BEQ, BNE;
    wire [2:0] ALU_OP;
    wire PC_WRITE;

    // Program Counter Control Logic
    wire [9:0] PC_NEXT, PC_CURRENT;
    assign PC_WRITE = JUMP | (BEQ & ZERO) | (BNE & ~ZERO);

    assign PC_NEXT = (JUMP) ? {4'b0000, ADDRESS} :   // Jump to Address for J-Type
                     (BEQ & ZERO) ? ReadB :          // BEQ Condition (Branch Target)
                     (BNE & ~ZERO) ? ReadB :         // BNE Condition
                     PC_CURRENT + 10'd1;             // Default Increment

    // Program Counter
    ProgramCounter pcUnit(
        .CLK(CLK),
        .RESET(RESET),
        .NEW_PC(PC_NEXT),
        .PC_WRITE(PC_WRITE),
        .PC(PC_CURRENT)
    );

    assign PC_OUT = PC_CURRENT;

    // Instruction Memory
    InstructionMemory instrMem(
        .ADDRESS(PC_CURRENT),
        .INSTRUCTION(INSTRUCTION)
    );

    // Instruction Decoder
    InstructionDecoder decoder(
        .INSTRUCTION(INSTRUCTION),
        .OPCODE(OPCODE),
        .SRC1(SRC1),
        .SRC2(SRC2),
        .DEST(DEST),          // Added DEST port for R-Type
        .IMMEDIATE(IMMEDIATE),
        .ADDRESS(ADDRESS)
    );

    // Control Unit
    Control controlUnit(
        .OPCODE(OPCODE),
        .ALU_OP(ALU_OP),
        .REG_WRITE(REG_WRITE),
        .MEM_WRITE(MEM_WRITE),
        .MEM_OR_ALU(MEM_OR_ALU),
        .INCR_OP(INCR_OP),
        .JUMP(JUMP),
        .BEQ(BEQ),
        .BNE(BNE),
        .HALT(HALT)
    );

    // Register File
    reg_file regFile(
        .CLK(CLK),
        .RegWrite1(REG_WRITE),
        .RegWrite2(1'b0),
        .srcA(SRC1),
        .srcB(SRC2),
        .writeReg1(DEST),          // Write back to DEST register
        .writeValue1(WB_DATA),
        .ReadA(ReadA),
        .ReadB(ReadB)
    );

    // ALU: Handles R-Type and I-Type Operations
    ALU aluUnit(
        .CLK(CLK),
        .OP(ALU_OP),
        .INPUTA(ReadA),
        .INPUTB((OPCODE == 4'b0100) ? {4'b0000, IMMEDIATE} : ReadB), // Immediate for I-Type
        .INCR_OP(INCR_OP),
        .OUT_LO(ALU_OUT_LO),
        .OUT_HI(ALU_OUT_HI),
        .ZERO(ZERO)
    );

    // Data Memory: Handles LOAD and STORE operations
    DataMemory dataMem(
        .CLK(CLK),
        .MEM_WRITE(MEM_WRITE),
        .ADDRESS(ALU_OUT_LO),
        .WRITE_DATA(ReadB),
        .READ_DATA(MemData)
    );

    // Write-Back Logic
    assign WB_DATA = MEM_OR_ALU ? MemData : ALU_OUT_LO; // Data from Memory or ALU Result

endmodule

