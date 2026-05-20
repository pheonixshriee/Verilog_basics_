`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2026 17:42:46
// Design Name: 
// Module Name: testbench_check
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


module testbench_check();
reg clk;
reg reset;
reg [1:0] in;
wire out;
wire change;

vending_machine UUT(
.clk(clk),
.reset(reset),
.in(in),
.out(out),
.change(change)
);

initial
begin
clk=0;
forever #10 clk=~clk;
end

initial
begin
reset=1;
#30;
reset=0;
in=2'b01;
#30;
in=2'b01;
#30;
in=2'b10;

end
initial
begin
#150;
$finish;
end
endmodule
