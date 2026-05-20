`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.03.2026 16:56:04
// Design Name: 
// Module Name: dual_port_tb
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


module dual_port_tb();
reg [7:0] DATA_IN_A;
reg [7:0] DATA_IN_B;
reg CLK;
reg CS;
reg WE_A;
reg WE_B;
reg [15:0] DATA_ADDR_A;
reg [15:0] DATA_ADDR_B;
wire [7:0] DATA_OUT_A;
wire [7:0] DATA_OUT_B;

Dual_port_RAM DUT(
.data_in_a(DATA_IN_A),
.data_in_b(DATA_IN_B),
.clk(CLK),
.cs(CS),
.we_a(WE_A),
.we_b(WE_B),
.data_addr_a(DATA_ADDR_A),
.data_addr_b(DATA_ADDR_B),
.data_out_a(DATA_OUT_A),
.data_out_b(DATA_OUT_B)
);
initial
begin
CLK=0;
forever #5
CLK=~CLK;
end
initial
begin
      DATA_IN_A = 8'h01;
      DATA_IN_B = 8'h01;
      DATA_ADDR_A= 16'd0;
      DATA_ADDR_B= 16'd1;
      WE_A = 1'b1;
      WE_B = 1'b1;
      CS = 1'b1;
      #10
      
      DATA_IN_B = 8'h02;
      DATA_ADDR_B= 16'd2;
      WE_A = 1'b1;
      WE_B = 1'b1;
      CS = 1'b1;
      #10
      
      DATA_IN_B = 8'h03;
      DATA_ADDR_B= 16'd3;
      WE_A = 1'b1;
      WE_B = 1'b1;
      CS = 1'b1;
      #10
      
      
      DATA_IN_B = 8'h04;
      DATA_ADDR_B= 16'd4;
      WE_A = 1'b1;
      WE_B = 1'b1;
      CS = 1'b1;
      #10
      
      DATA_IN_A = 8'h02;
      DATA_IN_B = 8'h01;
      DATA_ADDR_A= 16'd5;
      DATA_ADDR_B= 16'd6;
      WE_A = 1'b1;
      WE_B = 1'b1;
      CS = 1'b1;
      #10
      
      DATA_IN_B = 8'h02;
      DATA_ADDR_B= 16'd7;
      WE_A = 1'b1;
      WE_B = 1'b1;
      CS = 1'b1;
      #10
      
      DATA_IN_A = 8'h03;
      DATA_IN_B = 8'h04;
      DATA_ADDR_A= 16'd8;
      DATA_ADDR_B= 16'd9;
      WE_A = 1'b1;
      WE_B = 1'b1;
      CS = 1'b1;
      #10
     
      DATA_ADDR_A= 16'd0;
      DATA_ADDR_B= 16'd1;
      WE_A = 1'b0;
      WE_B = 1'b0;
      CS = 1'b1;
      #10
      
      DATA_ADDR_B= 16'd2;
      WE_B = 1'b0;
      CS = 1'b1;
      #10
      
      DATA_ADDR_B= 16'd3;
      WE_B = 1'b0;
      CS = 1'b1;
      #10
      
      DATA_ADDR_B= 16'd4;
      WE_B = 1'b0;
      CS = 1'b1;
      #10
      
      DATA_ADDR_A= 16'd5;
      DATA_ADDR_B= 16'd6;
      WE_A = 1'b0;
      WE_B = 1'b0;
      CS = 1'b1;
      #10
     
      CS = 1'b0;
      #20
      
      
      DATA_ADDR_B= 16'd7;
      WE_B = 1'b0;
      CS = 1'b1;
      #10
      
      DATA_ADDR_A= 16'd8;
      DATA_ADDR_B= 16'd9;
      WE_A = 1'b0;
      WE_B = 1'b0;
      CS = 1'b1;
     


end

initial
begin
#170
$finish;
end

endmodule






