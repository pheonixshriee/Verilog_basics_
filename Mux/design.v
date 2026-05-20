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


module  mux_8x1 (      // 8_to_1 mux design. by using this logic we can simply design any kind of deocder.
in,sel,out
);
  
input [7:0] in;
input [2:0] sel;
output reg out;

always@(*)
begin
    case(sel)
        3'b000 : begin out=in[0]; end
        3'b001 : begin out=in[1]; end
        3'b010 : begin out=in[2]; end
        3'b011 : begin out=in[3]; end
        3'b100 : begin out=in[4]; end
        3'b101 : begin out=in[5]; end
        3'b110 : begin out=in[6]; end
        3'b111 : begin out=in[7]; end
        default : begin out=1'dz; end       
    endcase
end


endmodule
