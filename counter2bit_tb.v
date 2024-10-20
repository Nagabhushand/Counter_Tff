`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.10.2024 16:38:01
// Design Name: 
// Module Name: counter2bit_tb
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


module counter2bit_tb;

reg clk;
reg reset;
reg T0;
wire Q0;
wire Q1;
wire [1:0]Y;

counter2bit uut ( .clk(clk), .reset(reset), .T0(T0), .Q0(Q0), .Q1(Q1), .Y(Y) );

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    reset = 1;
    T0 = 0;
    #10 reset = 0;
    #10 T0 = 1;
    #100 $finish;
end

endmodule


