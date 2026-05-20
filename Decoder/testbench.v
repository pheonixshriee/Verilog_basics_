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


module decoder_tb ();

reg [2:0] in;
wire [7:0] out;

decoder_3x8 DFT (
.in(in),
.out(out)
);

initial
begin
#10;
in=3'd0;
#10;
in=3'd1;
#10;
in=3'd2;
#10;
in=3'd3;
#10;
in=3'd4;
#10;
in=3'd5;
#10;
in=3'd6;
#10;
in=3'd7;
#10;
end

initial
begin
#100; $finish;
end

endmodule