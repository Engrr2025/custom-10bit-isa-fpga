`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 07:40:33 PM
// Design Name: 
// Module Name: mux8x1
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


module mux8x1(
    input [9:0] reg0,
    input [9:0] reg1,
    input [9:0] reg2,
    input [9:0] reg3,
    input [9:0] reg4,
    input [9:0] reg5,
    input [9:0] reg6,
    input [9:0] reg7,
    input [2:0] sel,           // 3-bit select signal
    output reg [9:0] out       // 10-bit output
);
    always @(*) begin
        case (sel)
            3'b000: out = reg0;
            3'b001: out = reg1;
            3'b010: out = reg2;
            3'b011: out = reg3;
            3'b100: out = reg4;
            3'b101: out = reg5;
            3'b110: out = reg6;
            3'b111: out = reg7;
            default: out = 10'b0; // Default to zero
        endcase
    end
endmodule
