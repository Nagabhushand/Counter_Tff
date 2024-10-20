`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.10.2024 16:37:16
// Design Name: 
// Module Name: counter2bit
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

module counter2bit( input clk, input reset,
    input T0, output Q0, output Q1, output [1:0]Y
    );

wire Q0_internal;

T_flipflop TFF0 ( .clk(clk), .reset(reset), .T(T0), .Q(Q0_internal) );

T_flipflop TFF1 ( .clk(clk), .reset(reset), .T(Q0_internal), .Q(Q1) );

assign Q0 = Q0_internal;
assign Y = {Q1,Q0};

endmodule
