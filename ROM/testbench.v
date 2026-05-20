`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.03.2026 21:51:34
// Design Name: 
// Module Name: ROM_tb
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


module ROM_tb();
reg CLK;
reg EN;
reg [3:0] ADDR;
wire [7:0] DATA;

ROM_design DUT(
.clk(CLK),
.en(EN),
.addr(ADDR),
.data(DATA)
);

initial
begin 
CLK=0;
forever #5 CLK=~CLK;
end

initial
    begin
    EN=1'b0;
    ADDR = 4'b0000;
    #10;
    
    
    EN=1'b1;
    ADDR=4'b0001;
    #10;
    
    EN=1'b1;
    ADDR=4'b0010;
    #10;
    
    EN=1'b1;
    ADDR=4'b0011;
    #10;
    
    EN=1'b1;
    ADDR=4'b0100;
    #10;
    
    EN=1'b1;
    ADDR=4'd5;
    #10;
    
    EN=1'b1;
    ADDR=4'd6;
    #10;
    
    EN=1'b1;
    ADDR=4'd7;
    #10;
    
    EN=1'b1;
    ADDR=4'd8;
    #10;
    
    EN=1'b1;
    ADDR=4'd9;
    #10;
    
    EN=1'b1;
    ADDR=4'd10;
    #10;
    
    EN=1'b1;
    ADDR=4'd11;
    #10;
    
    EN=1'b1;
    ADDR=4'd12;
    #10;
    
    EN=1'b1;
    ADDR=4'd13;
    #10;
    
    EN=1'b1;
    ADDR=4'd14;
    #10;
    
    EN=1'b0;
    #10;
    
    EN=1'b1;
    ADDR=4'd15;
    #10;
end

initial
begin
#150 $finish;
end
endmodule
