`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2026 21:45:13
// Design Name: 
// Module Name: multiplier_design
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


module multiplier_design(
a_in,b_in,reset,clk,start,out,finish,bcd
);

parameter N=8; 

input [N-1:0] a_in;     // Multiplicant
input [N-1:0] b_in;     // Multiplier
input reset;            // Reset button
input clk;              // Clock
input start;               // Start 
output [(2*N)-1:0] out;     // Final Output 
output finish;                 // Finish flag
output [((((2*N)/3)+1)*4)-1:0] bcd;  // Bits required to store the bcd value.

 /* Here we required ((2*N)/3)+1 digits to store it as digits and 
 We know each digit required 4 bits. So, we multiply it by 4 to get that much bits 
 Lastly we use -1 which is the proper verilog syntax to initialize bits. Becoz we start 
 the LSB from 0. Details explanation is given in the PDF.
  */
  
reg [N-1:0] a_in_reg=0;
reg [N-1:0] b_in_reg=0;                
reg [(2*N)-1:0] out_reg=0;     
reg finish_reg=0;                 
reg [((((2*N)/3)+1)*4)-1:0] bcd_reg=0;
reg [7:0] bits;

assign bcd=bcd_reg;
assign out=out_reg;
assign finish=finish_reg;

integer i;
integer j;

always @(posedge clk)
    if(reset)
        begin
        a_in_reg<=0;
        b_in_reg<=0;
        out_reg<=0;
        bcd_reg<=0;
        bits<=0;
        finish_reg<=0;
        end


always @(posedge clk)
    begin
        if(~reset)
            begin
                case(start) 
                    1'b0 : begin
                           a_in_reg <= a_in;
                           b_in_reg <= b_in; 
                           out_reg <= 0;
                           bcd_reg <= 0;
                           bits <= N;
                           finish_reg <= 0; 
                           $display("Values loaded into the input register!");
                           end
            
                    1'b1 : begin
                           if(bits>0)
                           begin
                           if(b_in_reg[0]==1)
                           begin
                                out_reg = out_reg + a_in_reg;
                           end 
                           bits = bits - 1;
                           a_in_reg <= a_in_reg << 1;
                           b_in_reg <= b_in_reg >> 1;
                           end
                           end
                   endcase
                   
             if(bits==0 && finish_reg==0)
                begin
                $display("Multiplication  Complete ");
                finish_reg=1'b1;
                
                // Now conversion of binary to BCD.
                 // Step 1: Add-3 correction
                for(i=0;i<(N*2);i=i+1)          // Loop for all possible iterations i.e.. toal number of bits.
                begin
                for(j=0;j<(((2*N)/3)+1);j=j+1)
                begin
                if (bcd_reg[j*4+:4]>=5)                       //  [start_index + width - 1 : start_index] 	// i.e.. [j*4+3 : j*4]
                bcd_reg[j*4+:4]=bcd_reg[j*4+:4]+3; 
                end
                /*
                here  start = j*4, width = 4
                [start + width - 1 : start]
                bcd_reg[j*4 + 4 -1 : j*4]
                when j=0 -> bcd_reg[3:0]
                when j=1 -> bcd_reg[7:4]
                when j=0 -> bcd_reg[11:8] . . . like wise
                */
                
                // Step 2: SHIFT LEFT + INSERT BIT
                bcd_reg = {bcd_reg[((((2*N)/3)+1)*4)-2:0], out_reg[(2*N)-1-i]};         // { } this is use to concatenate 
                end
                /*
                [((((2*N)/3)+1)*4)-2:0]  -> This part will select all bits except MSB.
                out_reg[(2*N)-1-i]      ->  This part will select one bit from multiplication result.
                Together concatenating them make bcd_reg.
                */
                
                $display("Conversion of binary to BCD completed!");
                end   
        
      end
  end 
    
endmodule
