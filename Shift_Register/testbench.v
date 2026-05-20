`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.03.2026 13:50:03
// Design Name: 
// Module Name: FA_tb
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


`timescale 1ns / 1ps

module FA_tb();

parameter N=8;

reg clk,reset,serial_in;
reg [1:0] sel;
reg [N-1:0] parallel_in;
wire [N-1:0] Out;

universal_shift_register DFT(
.clk(clk),
.reset(reset),
.serial_in(serial_in),
.sel(sel),
.parallel_in(parallel_in),
.Out(Out)
);

initial
begin
clk=0;
forever #5 clk=~clk;
end

initial
begin
reset=0;
parallel_in=8'b10101100;
serial_in=1'b1;
sel=2'b01;
#500;
sel=2'b00;
#500;
serial_in=1'b0;
sel=2'b10;
#500;
sel=02'b11;
#500;
end
initial
begin
#5000; $finish;
end

endmodule
