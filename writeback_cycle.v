`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.02.2024 11:04:46
// Design Name: 
// Module Name: writeback_cycle
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


module writeback_cycle(
    input clk,
    input rst,
    input ResultSrcW,
    input [31:0]ALUOutW,
    input [31:0]ReadDataW,
    input [31:0]PCPlus4W,
    output [31:0]ResultW
);

    MUX Writeback(.a(ALUOutW),.b(ReadDataW),.s(ResultSrcW),.out(ResultW));
endmodule
    module MUX(
    input [31:0]a,
    input [31:0]b,
    input s,
    output [31:0]out
    );
    assign out=(~s)?a:b;
    endmodule
