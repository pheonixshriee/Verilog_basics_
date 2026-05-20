`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.03.2026 16:20:31
// Design Name: 
// Module Name: multiplier_tb
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


module multiplier_tb();

parameter n_bit=5;

reg [n_bit-1:0] a_in;
reg [n_bit-1:0] b_in;
reg reset;
reg clk;
reg start;

wire [(2*n_bit-1):0] out;
wire finish;
wire [((((2*n_bit)/3)+1)*4)-1:0] bcd;

multiplier_design DFT(
.a_in(a_in),
.b_in(b_in),
.reset(reset),
.clk(clk),
.start(start),
.out(out),
.finish(finish),
.bcd(bcd)
);

initial
begin
clk=0;
forever #50
clk=~clk;
end

defparam DFT.N=n_bit;           // This is overwrite the parameter which is use in design module now paramater=n_bit.

initial
begin
reset=1;
clk=0;
#100;       // Wait to 100 nsec to reset all the registers in thea machine.

reset=0;
start=0;        // when start=0 in this case the values are assign to the a,b inputs.
a_in='d10;
b_in='d8;
#200;           // Wait 200 nsec to set the values in the reg

start=1;        // When start=1 then 
#(100*n_bit);        // Wait for the total multiplication. Each step required one clock then wait for completion.
start=0;

a_in='d11;
b_in='d9;
#200;
start=1;
#(100*n_bit);
start=0;
a_in='d0;
b_in='d0;
#200;

#2500;
$finish;
end


endmodule

