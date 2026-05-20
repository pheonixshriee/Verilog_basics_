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


module  JK_FF(      // Jk  Flip flop  design
input j,
input k,
input clk,
input reset,
output reg q,
output q_bar
);
  


always@ (posedge clk)
begin
    if(reset)
    begin
    q<=1'b0;
    end
    
    else
    begin
        case({j,k})
           2'b00 : begin q<=q;   end        // Hold state
           2'b01 : begin q<=1'b0;   end         // Reset state
           2'b10 : begin q<=1'b1;   end             // Set state
           2'b11 : begin q<=~q;   end                 // Toggle previous state 
           default : begin  q<=1'b0;    end         
        endcase
    end
end

assign q_bar=~q;      // Inverted value of the q.

endmodule
