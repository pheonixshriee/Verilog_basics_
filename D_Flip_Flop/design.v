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


module D_FF(
input d,
input clk,
input reset,
output reg q
);
 
always@(posedge clk)
begin
    if(reset)
    begin
    q<=1'b0;
    end
    
    else
    begin
    q<=d;
    end
end
 
endmodule
