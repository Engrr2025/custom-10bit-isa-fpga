`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/16/2024 09:04:45 AM
// Design Name: 
// Module Name: InstructionMemory
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


module InstructionMemory(
    input [9:0] ADDRESS,         // Address from Program Counter
    output [9:0] INSTRUCTION     // Output instruction
);

    reg [9:0] instr_mem [0:63];  // 64 memory locations, each 10 bits wide

    // Instruction Initialization
  initial begin
        instr_mem[0] = 10'b0100001101;   // SET 5 into reg1 (initialize loop counter)
        instr_mem[1] = 10'b0100010001;   // SET 1 into reg2 (initialize result to 1)
        instr_mem[2] = 10'b0010010001;   // MUL reg2 x reg1 -> result in reg5
        instr_mem[3] = 10'b0011001011;   // SUB reg1, reg1, reg2 (decrement reg1)
        instr_mem[4] = 10'b1000001110;   // BEQ reg1, 0 -> Jump to address 6 (end loop)
        instr_mem[5] = 10'b1001000010;   // JUMP to address 2 (repeat loop)
        instr_mem[6] = 10'b0111010111;   // STORE reg5 to memory (address 7)
        instr_mem[7] = 10'b0000000000;   // HALT instruction
    end


    


    // Output Instruction (asynchronous read)
    assign INSTRUCTION = instr_mem[ADDRESS];

endmodule