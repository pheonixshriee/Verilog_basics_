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

module HA_tb();

reg a,b;		// Input always reg type to hold the value 
wire sum,cout;		// Output wire type to flow the input upto output side.

HA UUT(a,b,sum,cout);

initial
begin
#10 a=0; b=0; 
#10 a=0; b=1; 
#10 a=1; b=0; 
#10 a=1; b=1; 

#10;
$finish;
end
endmodule
