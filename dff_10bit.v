`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 07:34:48 PM
// Design Name: 
// Module Name: dff_10bit
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


module dff_10bit(
    input CLK,
    input [9:0] D,             // 10-bit data input
    input enable,              // Write enable signal
    output reg [9:0] Q = 10'b0 // Initialize Q to zero
);
    always @(posedge CLK) begin
        if (enable)
            Q <= D;           // Write data to Q on positive clock edge
    end
endmodule


