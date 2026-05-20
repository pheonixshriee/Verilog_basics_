`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.03.2026 16:34:11
// Design Name: 
// Module Name: Dual_port_RAM
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


module Dual_port_RAM(
input [7:0] data_in_a,
input [7:0] data_in_b,
input clk,
input cs,
input we_a,
input we_b,
input [15:0] data_addr_a,
input [15:0] data_addr_b,
output [7:0] data_out_a,
output [7:0] data_out_b
);
reg [7:0] ram_mem [65535:0];
reg [15:0] addr_reg_a; 
reg [15:0] addr_reg_b;

always @(posedge clk)
begin
    if(cs)
    begin
    if(we_a)
    ram_mem[data_addr_a] <= data_in_a;
    else 
    addr_reg_a <= data_addr_a;
    end
 end
 assign data_out_a = (cs && !we_a)? ram_mem[addr_reg_a] : 8'bz;

always @(posedge clk)
begin
    if(cs)
    begin
    if(we_b && (data_addr_a != data_addr_b))
    ram_mem[data_addr_b] <= data_in_b;
    else 
    addr_reg_b <= data_addr_b;
    end
 end
 assign data_out_b = (cs && !we_b)? ram_mem[addr_reg_b] : 8'bz;
 
 
endmodule
