`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.03.2026 13:46:42
// Design Name: 
// Module Name: FA
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


module FA(
    input a,b,cin, // Three inputs 
    output y,cout		// 2 outputs 
    );
    
    assign y = (a^b^cin);		// Sum part
    assign cout = ((a&b)|(b&cin)|(a&cin));	// carry part
endmodule
