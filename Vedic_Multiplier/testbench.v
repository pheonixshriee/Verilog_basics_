`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2026 17:39:33
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
reg [7:0] a;
reg [7:0] b;
wire [15:0] out;

design_8x8 DFT(.a(a),
.b(b),
.out(out));


initial
begin
a=0;b=0;
#50;
a=8'd34;b=8'd23;
#200;
a=8'd41;b=8'd97;
#200;
a=0;b=0;

$finish;

end

endmodule

