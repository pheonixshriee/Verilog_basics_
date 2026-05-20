`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.05.2026 09:37:47
// Design Name: 
// Module Name: design
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


module  encoder_8x3 (      // 8_to_3 Encoder design by using this logic we can simply design any kind of encoder.
in,out
);
  
input [7:0] in;
output reg [2:0] out;

always@(*)
begin
    case(in) 
    8'b00000001 : begin out=3'b000; end         //in[0]
    8'b00000010 : begin out=3'b001; end         //in[1]
    8'b00000100 : begin out=3'b010; end         //in[2]
    8'b00001000 : begin out=3'b011; end         //in[3]
    8'b00010000 : begin out=3'b100; end         //in[4]
    8'b00100000 : begin out=3'b101; end         //in[5]
    8'b01000000 : begin out=3'b110; end         //in[6]
    8'b10000000 : begin out=3'b111; end         //in[7]
    default : begin out=3'bxxx; end
    endcase
end


endmodule
