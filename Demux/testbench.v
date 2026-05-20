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


module demux_tb ();

reg in;
reg [2:0] sel;
wire [7:0] out;

demux_1x8 DFT (
.in(in),
.sel(sel),
.out(out)
);



initial
begin
#10;
in=1'b1;
sel=3'b000;
#10;
sel=3'b001;
#10;
sel=3'b010;
#10;
sel=3'b011;
#10;
sel=3'b100;
#10;
sel=3'b101;
#10;
sel=3'b110;
#10;
sel=3'b111;
#10;
end

initial
begin
#100; $finish;
end

endmodule