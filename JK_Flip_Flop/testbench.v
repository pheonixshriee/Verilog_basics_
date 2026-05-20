`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.05.2026 10:08:05
// Design Name: 
// Module Name: tb_D_FF
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


module tb_JK_FF();
reg j;
reg k;
reg clk;
reg reset;
wire q;
wire q_bar;

JK_FF DFT(
.j(j),
.k(k),
.clk(clk),
.reset(reset),
.q(q),
.q_bar(q_bar)
);

initial
begin
 clk=0;
forever #10 
clk=~clk;
end


initial
begin
reset=1;
#20;
reset=0;
j=1'b0;k=1'b0;
#20;
j=1'b0;k=1'b1;
#20;
j=1'b1;k=1'b0;
#20;
j=1'b1;k=1'b1;
end

initial
begin
#150; $finish;
end
endmodule
