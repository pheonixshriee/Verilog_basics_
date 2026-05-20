`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.05.2026 09:25:56
// Design Name: 
// Module Name: testbench
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


module testbench();
reg [3:0] A;
reg [3:0] B;
reg [3:0] opcode;
wire [3:0] Out;
wire Carry;

ALU_4bit UUT(.A(A),.B(B),.opcode(opcode),.Out(Out),.Carry(Carry));

initial
begin
A=4'b0111;
B=4'b0011;
opcode=3'b000;
#50;
opcode=3'b001;
#50;
opcode=3'b010;
#50;
opcode=3'b011;
#50;
opcode=3'b100;
#50;
opcode=3'b101;
#50;
opcode=3'b110;
#50;
opcode=3'b111;
#50;
end
endmodule
