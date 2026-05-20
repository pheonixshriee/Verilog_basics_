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


module  decoder_3x8 (      // 3_to_8 decoder design. by using this logic we can simply design any kind of deocder.
in,out
);
  
input [2:0] in;
output reg [7:0] out;

always@(*)
begin
    case(in)
        3'b000 : begin out=8'd0; end
        3'b001 : begin out=8'd1; end
        3'b010 : begin out=8'd2; end
        3'b011 : begin out=8'd3; end
        3'b100 : begin out=8'd4; end
        3'b101 : begin out=8'd5; end
        3'b110 : begin out=8'd6; end
        3'b111 : begin out=8'd7; end
        default : begin out=8'dz; end       
    endcase
end


endmodule
