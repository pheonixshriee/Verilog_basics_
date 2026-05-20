`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2026 17:10:07
// Design Name: 
// Module Name: vending_machine
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


module vending_machine(
clk,
reset,
in,
out,
change
);

input clk,reset;
input [1:0] in;  // 0rs=2'b00 , 5rs=2'b01 , 10rs=2'b10
output reg out;
output reg [1:0] change;  // 0rs=2'b00 , 5rs=2'b01 , 10rs=2'b10

parameter s0=2'b00;        // State 0
parameter s1=2'b01;        // State 1
parameter s2=2'b10;        // State 2

reg [1:0] nxt_s,pst_s;

always @(posedge clk)
    begin
        if(reset)
           begin
            nxt_s<=s0;
            pst_s<=s0;
            change<=2'b00;
           end
         else
           begin
           pst_s<=nxt_s;
           out=1'b0;
           change=2'b00;
           case(pst_s)
            s0 :    // state 0 : 0rs
               if(in==2'b00)
                begin
                nxt_s<=s0;
                out<=0;
                change<=2'b00;
                end
               else if(in==2'b01) 
                 begin
                 nxt_s<=s1;
                 out<=0;
                 change<=2'b00;
                 end
               else if(in==2'b10)
                 begin
                 nxt_s<=s2;
                 out<=2'b00;
                 change<=2'b00;
                 end
                 
             s1 :    // state 1 : 5rs
               if(in==2'b00)
                begin
                nxt_s<=s0;
                out<=0;
                change<=2'b01;
                end
               else if(in==2'b01) 
                 begin
                 nxt_s<=s2;
                 out<=0;
                 change<=2'b00;
                 end
               else if(in==2'b10)
                 begin
                 nxt_s<=s0;
                 out<=1;
                 change<=2'b00;
                 end
                 
              s2 :    // state 2 : 10rs
               if(in==2'b00)
                begin
                nxt_s<=s0;
                out<=0;
                change<=2'b10;
                end
               else if(in==2'b01) 
                 begin
                 nxt_s<=s0;
                 out<=1;
                 change<=2'b00;
                 end
               else if(in==2'b10)
                 begin
                 nxt_s<=s0;
                 out<=1;
                 change<=2'b01;
                 end  
                 
              default : 
                 begin
                 nxt_s<=s0;
                 out<=0;
                 change<=2'b00;
                 end 
              
             endcase
         end
    end
        
    
    
endmodule
