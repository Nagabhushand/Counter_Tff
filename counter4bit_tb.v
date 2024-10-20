`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.10.2024 18:08:40
// Design Name: 
// Module Name: counter4bit_tb
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



module counter4bit_tb;

reg clk;
reg reset;
reg T0;
wire Q0;
wire Q1;
wire Q2;
wire Q3;
wire [3:0]Y;

counter4bit uut ( .clk(clk), .reset(reset), .T0(T0), .Q0(Q0), .Q1(Q1), .Q2(Q2), .Q3(Q3), .Y(Y) );

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    reset = 1;
    T0 = 0;
    #10 reset = 0;
    #10 T0 = 1;
    #180 $finish;
end

endmodule
