`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.02.2024 22:48:25
// Design Name: 
// Module Name: executecycle
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


module executecycle(
    input clk,rst,
    input RegWriteE,
    input ResultSrcE,
    input MemWriteE,
    input JumpE,
    input BranchE,
    input ALUControlE,
    input ALUScrcE,
    input [31:0]RD1E,
    input [31:0]RD2E,
    input[31:0]PCE,
    input [31:0]RdE,
    input [31:0]ImmEx1E,
    input [31:0]PCPlus4E,
    output PCSrcE,
    output RegWriteM,
    output ResultSrcM,
    output MemWriteM,
    output [31:0]ALUResultM,
    output [31:0]WriteDataM,
    output [31:0]RdM,
    output [31:0]PCPlus4M,
    output [31:0]PCTargetE
    );
    wire [31:0] SrcAE,SrcBR,WriteDataE,ZeroE,flag;
    reg [31:0] ALUResultM_r,WriteDataM_r,RdM_r,PCPlus4M_r;
    reg RegWriteM_r,ResultSrcM_r,MemWriteM_r;
    mux ex(.a(Rd2E),.b(ImmEx1E),.s(ALUScrcE),.out(SrcBE));
    assign SrcAE=RD1E;
    assign WriteDataE=RD2E;
    PC_Module_counter exe(.a(PCE),.b(ImmEx1E),.out(PCTargetE));
    ALU exec(.a(SrcAE),.b(SrcBE),.control(ALUControlE),.out1(ZeroE),.out2(ALUResultM_r));
    assign flag=(ZeroE & BranchE);
    assign PCSrcE=(JumpE | flag);
    always@(posedge clk or negedge rst)
    begin
        if(rst==1'b0)
            begin
                RegWriteM_r<=1'b0;
                ResultSrcM_r<=1'b0;
                MemWriteM_r<=1'b0;
                ALUResultM_r<=32'h00000000;
                WriteDataM_r<=32'h00000000;
                RdM_r<=32'h00000000;
                PCPlus4M_r<=32'h00000000;
            end
        else
            begin
                RegWriteM_r<=RegWriteE;
                ResultSrcM_r<=ResultSrcE;
                MemWriteM_r<=MemWriteE;
                WriteDataM_r<=WriteDataE;
                RdM_r<=RdE;
                PCPlus4M_r<=PCPlus4E;
            end
    end
    assign RegWriteM=RegWriteM;
    assign ResultSrcM=ResultSrcM_r;
    assign MemWriteM=MemWriteM_r;
    assign ALUResultM=ALUResultM_r;
    assign WriteDataM=WriteDataM_r;
    assign RdM=RdM_r;
    assign PCPlus4M=PCPlus4M_r;
endmodule
module mux(
    input[31:0]a,
    input [31:0]b,
    input c,
    output [31:0]out
);
    assign out=(~c)?a:b; 
endmodule
module PC_Module_counter(
    input[31:0]a,
    input [31:0]b,
    output [31:0]out
);
    assign out=a+b;
endmodule
