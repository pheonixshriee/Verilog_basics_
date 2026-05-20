
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.03.2026 15:19:12
// Design Name: 
// Module Name: single_port_ram_tb
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
module single_port_ram_tb();
reg [7:0] DATA_IN;
reg [15:0] DATA_ADDR;
reg CLK;
reg CS;
reg WE;
wire [7:0] DATA_OUT;

single_port_RAM DUT(
.data_in(DATA_IN),
.data_addr(DATA_ADDR),
.clk(CLK),
.we(WE),
.data_out(DATA_OUT),
.cs(CS)
);

initial
begin
CLK=0;
forever #5
CLK = ~CLK;
end

initial
begin
      DATA_IN = 8'h01;
      DATA_ADDR= 16'd0;
      WE = 1'b1;
      CS = 1'b1;
      #10
      
      DATA_IN = 8'h02;
      DATA_ADDR = 16'd1;
      WE = 1'b1;
      CS = 1'b1;
      #10
      
      DATA_IN = 8'h04;
      DATA_ADDR = 16'd2;
      WE = 1'b1;
      CS = 1'b1;
      #10
      
      DATA_IN = 8'h05;
      DATA_ADDR = 16'd3;
      WE = 1'b1;
      #10
      
      DATA_IN = 8'h06;
      DATA_ADDR = 16'd4;
      WE = 1'b1;
      #10
      
      DATA_IN = 8'h07;
      DATA_ADDR = 16'd5;
      WE = 1'b1;
      #10
      
      DATA_IN = 8'h08;
      DATA_ADDR = 16'd6;
      WE = 1'b1;
      #10
      DATA_IN = 8'h00;
      
      DATA_ADDR = 16'd0;
      WE = 1'b0;
      CS = 1'b1;
      #10;
      
      DATA_ADDR = 16'd1;
      WE = 1'b0;
      CS = 1'b1;
      #10;
      
      DATA_ADDR = 16'd2;
      WE = 1'b0;
      CS = 1'b1;
      #10;
      
      DATA_ADDR = 16'd3;
      WE = 1'b0;
      CS = 1'b1;
      #10;
      
      DATA_ADDR = 16'd4;
      WE = 1'b0;
      CS = 1'b1;
      #10;
      
      DATA_ADDR = 16'd5;
      WE = 1'b0;
      CS = 1'b1;
      #10;
      
      DATA_ADDR = 16'd5;
      WE = 1'b0;
      CS = 1'b0;
      #10
      
      DATA_ADDR = 16'd6;
      WE = 1'b0;
      CS = 1'b1;
      #10;
      
      DATA_ADDR = 16'd7;
      WE = 1'b0;
      CS = 1'b1;
      #10;
end   

initial
begin
#150
$finish;
end
endmodule
 
      
      
      