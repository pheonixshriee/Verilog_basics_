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


module mux_tb ();

reg [7:0] in;
reg [2:0] sel;
wire out;

mux_8x1 DFT (
.in(in),
.sel(sel),
.out(out)
);



initial
begin
#10;
in=8'b10101101;
sel=3'd0;
#10;
sel=3'd1;
#10;
sel=3'd2;
#10;
sel=3'd3;
#10;
sel=3'd4;
#10;
sel=3'd5;
#10;
sel=3'd6;
#10;
sel=3'd7;
#10;
end

initial
begin
#100; $finish;
end

endmodule