`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.10.2024 18:09:07
// Design Name: 
// Module Name: counter4bit
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



module T_flipflop ( 
    input clk, input reset,
    input T, output reg Q 
    );
    
always @(posedge clk or posedge reset) begin
    if (reset) begin
        Q <= 1'b0;
    end else if (T) begin
        Q <= ~Q;
    end
end
endmodule

module counter4bit( input clk, input reset,
    input T0, output Q0, output Q1,
    output Q2,output Q3, output [3:0]Y
    );

wire Q0_internal;
wire Q1_internal;
wire Q2_internal;

T_flipflop TFF0 ( .clk(clk), .reset(reset), .T(T0), .Q(Q0_internal) );

T_flipflop TFF1 ( .clk(clk), .reset(reset), .T(Q0_internal), .Q(Q1_internal) );

T_flipflop TFF2 ( .clk(clk), .reset(reset), .T(Q0_internal && Q1_internal), .Q(Q2_internal) );

T_flipflop TFF3 ( .clk(clk), .reset(reset), .T(Q0_internal && Q1_internal && Q2_internal), .Q(Q3) );

assign Q0 = Q0_internal;
assign Q1 = Q1_internal;
assign Q2 = Q2_internal;
assign Y = {Q3,Q2,Q1,Q0};

endmodule
