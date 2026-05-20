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


module  demux_1x8 (      // 1_to_8 demux design. by using this logic we can simply design any kind of demux.
in,sel,out
);
  
input in;
input [2:0] sel;
output reg [7:0] out;

always@(*)
begin
    case(sel)
        3'b000 : begin out={7'b0000000,in}; end
        3'b001 : begin out={6'b000000,in,1'b0}; end
        3'b010 : begin out={5'b00000,in,2'b00}; end
        3'b011 : begin out={4'b0000,in,3'b000}; end
        3'b100 : begin out={3'b000,in,4'b0000}; end
        3'b101 : begin out={2'b00,in,5'b00000}; end
        3'b110 : begin out={1'b0,in,6'b000000}; end
        3'b111 : begin out={in,7'b0000000}; end
        default : begin out=8'dx; end       
    endcase
end


endmodule
