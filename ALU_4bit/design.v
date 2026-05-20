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


module ALU_4bit (A,B,opcode,Out,Carry);
input [3:0] A;
input [3:0] B;
input [2:0] opcode;
output reg [3:0] Out;
output reg Carry;

always@(*) begin

case(opcode)

    3'b000 : {Carry,Out} = A+B;     // Addition
    3'b001 : {Carry,Out} = A-B;     // Substraction
    3'b010 : begin Carry=0;Out= A&B;  end       // Bit wise AND
    3'b011 : begin Carry=0;Out=A|B;   end       // Bit wise OR
    3'b100 : begin Carry=0;Out=A^B;   end       // Bit wise XOR
    3'b101 : begin Carry=0;Out=~(A^B);   end       // Bit wise XNOR
    3'b110 : begin Carry=0;Out=~(A&B);   end       // Bit wise XNOR
    3'b111 : begin Carry=0;Out=~(A|B);   end       // Bit wise XNOR
    
    // We can add other operations also by simply adding the opcode bits.
    
    default : begin Out=0; Carry=0; end
endcase

end




endmodule
