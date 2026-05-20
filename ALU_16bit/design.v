`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.05.2026 09:14:53
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


module ALU_4bit (A,B,opcode,Out,mulout,Carry);
input [15:0] A;
input [15:0] B;
input [3:0] opcode;
output reg [15:0] Out;
output reg [32:0] mulout=0;
output reg Carry;

always@(*) begin

case(opcode)

    4'b0000 : {Carry,Out} = A+B;     // Addition
    4'b0001 : {Carry,Out} = A-B;     // Substraction
    4'b0010 : begin Carry=0;Out= A&B;  end       // Bit wise AND
    4'b0011 : begin Carry=0;Out=A|B;   end       // Bit wise OR
    4'b0100 : begin Carry=0;Out=A^B;   end       // Bit wise XOR
    4'b0101 : begin Carry=0;Out=~(A^B);   end       // Bit wise XNOR
    4'b0110 : begin Carry=0;Out=~(A&B);   end       // Bit wise XNOR
    4'b0111 : begin Carry=0;Out=~(A|B);   end       // Bit wise XNOR
    4'b1000 : begin Carry=0;Out=~(A);   end       // Inverted A
    4'b1001 : begin Carry=0;Out=~(B);   end       // Inverted B
    4'b1011 : begin Carry=0;mulout=(A*B);Out=0;   end       // multiplication
    
    // We can add other operations also by simply adding the opcode bits.
    
    default : begin Out=0; Carry=0; end
endcase

end




endmodule
