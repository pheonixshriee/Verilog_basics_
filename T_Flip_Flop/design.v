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


module  T_FF(
input t,
input clk,
input reset,
output reg q,
output reg q_bar
);
 
always@ (posedge clk)
begin
    if(reset)
    begin
    q<=1'b0;
    end
    
    else 
    begin
    if(t == 1'b1)
        q<=~q;       // Hold the previos state
    else 
        q<=q;      // Toggle the state
    end
        
        
    q_bar<=~q;      // Inverted value of the q.
end


endmodule
