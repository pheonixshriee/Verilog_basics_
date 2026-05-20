`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2026 17:28:38
// Design Name: 
// Module Name: design
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

module HA(input a,b,output s,c);
xor G1(s,a,b);
and G2(c,a,b);
endmodule

module FA(input a,b,c,output s,cy);
wire [2:0] w;
and G1(w[0],a,b);
and G2(w[1],a,c);
and G3(w[2],b,c);
xor G4(s,a,b,c);
or G5(cy,w[0],w[1],w[2]);
endmodule

module design_2x2(a,b,out);
input [1:0] a;
input [1:0] b;
output [3:0] out;
wire [3:0] w;

assign out[0] = a[0]&&b[0];
assign w[0] = a[1]&&b[0];
assign w[1] = a[0]&&b[1];
assign w[2] = a[1]&&b[1];

HA DFT1(w[0],w[1],out[1],w[3]);
HA DFT2(w[3],w[2],out[2],out[3]);   

endmodule


module design_4x4(a,b,out);
input [3:0] a;
input [3:0] b;
output [7:0] out;

wire [3:0] w1;
wire [3:0] w2;
wire [3:0] w3;
wire [3:0] w4;
wire [3:0] s1,s2;
wire c1,c2;

design_2x2 UUT1(.a(a[1:0]),.b(b[1:0]),.out(w1[3:0]));

design_2x2 UUT2(.a(a[3:2]),.b(b[1:0]),.out(w2[3:0]));

design_2x2 UUT3(.a(a[1:0]),.b(b[3:2]),.out(w3[3:0]));

design_2x2 UUT4(.a(a[3:2]),.b(b[3:2]),.out(w4[3:0]));
 
assign {c1, s1} = w2[1:0] + w3[1:0] + w1[3:2];

assign {c2, s2} = w2[3:2] + w3[3:2] + w4[1:0] + c1;

assign out[1:0] = w1[1:0];

assign out[3:2] = s1[1:0];

assign out[5:4] = s2[1:0];

assign out[7:6] = w4[3:2] + c2;

endmodule


module design_8x8(a,b,out);
input [7:0] a;
input [7:0] b;
output [15:0] out;
wire [7:0] w1;
wire [7:0] w2;
wire [7:0] w3;
wire [7:0] w4;
wire [9:0] s1;
wire [11:0] s2;

design_4x4 UUT1(.a(a[3:0]),.b(b[3:0]),.out(w1[7:0]));

design_4x4 UUT2(.a(a[7:4]),.b(b[3:0]),.out(w2[7:0]));

design_4x4 UUT3(.a(a[3:0]),.b(b[7:4]),.out(w3[7:0]));

design_4x4 UUT4(.a(a[7:4]),.b(b[7:4]),.out(w4[7:0]));

assign s1 = w2 + w3 + {4'b0000, w1[7:4]};

// Final addition
assign s2 = s1 + {w4, 4'b0000};

// Output
assign out[3:0]  = w1[3:0];
assign out[15:4] = s2;

endmodule
