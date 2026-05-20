`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.03.2026 10:34:09
// Design Name: 
// Module Name: testbench
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


 module testbench();
reg clk;
reg rst;
reg start;
reg signed [3:0] M;
reg signed [3:0] Q_in;

wire signed [7:0] result;
wire done;

multiplier_design UUT1(
.clk(clk),
.rst(rst),
.start(start),
.M(M),
.Q_in(Q_in),
.result(result),
.done(done)
);

initial
begin
clk=0;
forever #10 clk=~clk;
end

initial
begin
rst=1'b1;
#20;

rst=1'b0;M=4'b0;Q_in=4'b0;
#20;

start=1'b1;Q_in=4'sd2;M=4'sd5;
#50;
start=1'b0;

end

endmodule
