`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.01.2024 17:10:47
// Design Name: 
// Module Name: IF
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


module IF(
    input PCSrcE,
    input clk1,
    input clk2,
    input [31:0] PCTargetE,
    output reg[31:0] InstrnD,
    output reg[31:0] PCD,
    output reg[31:0] PCplus4D
    );
    reg [31:0] pcf1,pcf2,fb,RD,sfout;
    
    initial begin
    fb=PCplus4D;
    if(PCSrcE==1)
        pcf1=PCTargetE;
    else
        pcf1=fb;
    end
        
    always@(posedge clk1,pcf2,pcf1,RD)
    begin
    pcf2=pcf1;
    RD=pcf2;
    end
    
    always@(posedge clk2,InstrnD,PCD,PCplus4D)
    begin
    InstrnD<=RD;
    PCD<=pcf2;
    end
endmodule

//module DFF(
    //input clk,
    //input [31:0]in,
   // output reg [31:0]out
    //);
    //always@(posedge clk)
    //begin
   // out<=in;
   // end
//endmodule