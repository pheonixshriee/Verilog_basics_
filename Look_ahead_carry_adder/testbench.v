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

reg A,B,Cin;
wire SUM,OUT;

carry_look_ahead_4bit UUT(A,B,Cin,SUM,OUT);

initial
begin
#10 A=0; B=0; Cin=0;
#10 A=0; B=0; Cin=1;
#10 A=0; B=1; Cin=0;
#10 A=0; B=1; Cin=1;
#10 A=1; B=0; Cin=0;
#10 A=1; B=0; Cin=1;
#10 A=1; B=1; Cin=0;
#10 A=1; B=1; Cin=1;
#10;
$finish;
end
endmodule
