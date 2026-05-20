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
reg [15:0] A;
reg [15:0] B;
reg [3:0] opcode;
wire [15:0] Out;
wire [32:0] mulout;
wire Carry;

ALU_4bit UUT(.A(A),.B(B),.opcode(opcode),.Out(Out),.mulout(mulout),.Carry(Carry));

initial
begin
A=16'b1010110100111101;
B=16'b0011101011100110;
opcode=4'b0000;
#50;
opcode=4'b0001;
#50;
opcode=4'b0010;
#50;
opcode=4'b0011;
#50;
opcode=4'b0100;
#50;
opcode=4'b0101;
#50;
opcode=4'b0110;
#50;
opcode=4'b0111;
#50;
opcode=4'b1000;
#50;
opcode=4'b1001;
#50;
opcode=4'b1011;
#50;

end
endmodule
