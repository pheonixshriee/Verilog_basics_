`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.03.2026 21:36:55
// Design Name: 
// Module Name: ROM_16X4
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


module ROM_design(
input clk,
input en,
input [3:0] addr,
output reg [7:0] data 
);

reg [7:0] ROM [15:0];
always @(posedge clk)
    begin
        if(en)
             data <= ROM[addr];
         else
             data <= 8'bxxxxxxxx;
    end
    initial
    begin
    ROM[0] = 8'd15;
    ROM[1] = 8'd22;
    ROM[2] = 8'd11;
    ROM[3] = 8'd10;
    ROM[4] = 8'd33;
    ROM[5] = 8'd4;
    ROM[6] = 8'd11;
    ROM[7] = 8'd32;
    ROM[8] = 8'b10101010;
    ROM[9] = 8'b1111111;
    ROM[10] = 8'b11110000;
    ROM[11] = 8'b00001111;
    ROM[12] = 8'd15;
    ROM[13] = 8'd36;
    ROM[14] = 8'b11111100;
    ROM[15] = 8'd19;
  end
endmodule
