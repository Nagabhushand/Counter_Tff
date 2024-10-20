`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.10.2024 17:28:42
// Design Name: 
// Module Name: counter3bit
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



module T_flipflop ( input clk, input reset,
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

module counter3bit( input clk, input reset,
    input T0, output Q0, output Q1, 
    output Q2, output [2:0]Y
    );

wire Q0_internal;
wire Q1_internal;

T_flipflop TFF0 ( .clk(clk), .reset(reset), .T(T0), .Q(Q0_internal) );

T_flipflop TFF1 ( .clk(clk), .reset(reset), .T(Q0_internal), .Q(Q1_internal) );

T_flipflop TFF2 ( .clk(clk), .reset(reset), .T(Q0_internal && Q1_internal), .Q(Q2) );

assign Q0 = Q0_internal;
assign Q1 = Q1_internal;
assign Y = {Q2,Q1,Q0};

endmodule

