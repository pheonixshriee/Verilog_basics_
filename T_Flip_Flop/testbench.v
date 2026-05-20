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


module tb_T_FF();
reg t;
reg clk;
reg reset;
wire q;
wire q_bar;

T_FF DFT(
.t(t),
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
t=0;
#20;
t=1;
#20;
t=0;
#20;
t=1;
end

initial
begin
#100; $finish;
end
endmodule
