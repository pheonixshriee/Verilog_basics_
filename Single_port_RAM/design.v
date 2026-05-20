`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.03.2026 14:40:24
// Design Name: 
// Module Name: single_port_RAM
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

// Single port RAM 64K X 8 bits.
module single_port_RAM(
input [7:0] data_in, // Data (Input)
input [15:0] data_addr, // Address lines (input)
input clk, // Input clock
input cs, // chip select
input we, //    Write enable  i.e.. Write data when this pin is high.
output [7:0] data_out
);

reg [7:0] ram_mem [65535:0]; // Ram with 64k x 8 (64k locations with each 8 bit data)
reg [15:0] addr_reg; // Adress Register 

always @ (posedge clk)
begin 
    if(cs)
    begin
        if(we)
        ram_mem[data_addr] <= data_in;
        else
        addr_reg <= data_addr;
    end
end

 // Assign statement in always block is illegal.
     assign data_out = (cs && !we) ? ram_mem[addr_reg] : 8'bz; 
    /* Conditional operator is there and it will check the condition if it is true then and only 
      it will retrun data from the RAM memory. Otherwise it will show high impedance state.*/         
endmodule
