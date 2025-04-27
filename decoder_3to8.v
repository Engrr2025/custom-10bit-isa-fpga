`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 07:30:55 PM
// Design Name: 
// Module Name: decoder_3to8
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


module decoder_3to8(
    input [2:0] addr,       // 3-bit address
    input enable,           // Enable signal
    output reg [7:0] out    // 8-bit one-hot output
);
    always @(*) begin
        out = 8'b0;         // Default all outputs to 0
        if (enable)
            out = 8'b1 << addr; // Generate one-hot output based on address
    end
endmodule
