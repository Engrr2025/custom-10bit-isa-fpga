`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/16/2024 06:13:46 AM
// Design Name: 
// Module Name: DataMemory
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


module DataMemory (
    input CLK,                 // Clock signal
    input RESET,               // Reset signal to initialize memory
    input MEM_WRITE,           // Write enable signal
    input [9:0] ADDRESS,       // 10-bit memory address
    input [9:0] WRITE_DATA,    // Data to write into memory
    output reg [9:0] READ_DATA // Data read from memory
);

    reg [9:0] memory [0:255];  // 256 x 10-bit memory locations

    integer i;

    // Memory Initialization on RESET
    always @(posedge RESET) begin
        for (i = 0; i < 256; i = i + 1) begin
            memory[i] <= 10'b0; // Initialize all memory locations to 0
        end
    end

    // Memory Write Operation
    always @(posedge CLK) begin
        if (MEM_WRITE) begin
            memory[ADDRESS] <= WRITE_DATA; // Write data to memory at ADDRESS
        end
    end

    // Memory Read Operation
    always @(posedge CLK) begin
        if (!MEM_WRITE) begin
            READ_DATA <= memory[ADDRESS]; // Read data from memory at ADDRESS
        end
    end

endmodule






