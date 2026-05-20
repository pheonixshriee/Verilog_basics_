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

reg [7:0] in;
wire [2:0] out;

encoder_8x3 DFT (
.in(in),
.out(out)
);



initial
begin
#10;
in=8'b00000001;
#10;
in=8'b00000010;
#10;
in=8'b00000100;
#10;
in=8'b00001000;
#10;
in=8'b00010000;
#10;
in=8'b00100000;
#10;
in=8'b01000000;
#10;
in=8'b10000000;
#10;
end

initial
begin
#100; $finish;
end

endmodule