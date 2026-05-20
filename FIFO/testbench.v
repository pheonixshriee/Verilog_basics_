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

module fifo_tb();
 
reg clk;
reg reset;
reg rd_enb;
reg wr_enb;
reg [7:0] data_in;
wire [7:0]  data_out;
wire full;
wire empty;

snychronous_fifo DFT(   
    .clk(clk),
    .reset(reset),
    .rd_enb(rd_enb),
    .wr_enb(wr_enb),
    .data_in(data_in),
    .data_out(data_out),
    .full(full),
    .empty(empty)
);

initial
begin
clk=0;
forever #10 clk=~clk;
end

initial
begin
reset=1;
rd_enb=0;
wr_enb=0;
data_in=0;

#10;
reset=0;

// Write 4 values
repeat(4) begin     // This will repeat the blcok of code for n times
@(posedge clk);         // At posegde of Clock
wr_enb=1;
data_in=$random;
end

@(posedge clk);
wr_enb=0;
#10;

// Read 4 values 
repeat(4) begin
@(posedge clk)
rd_enb=1;
end

@(posedge clk);
rd_enb=0;

end

initial
begin
#200; $finish;
end

endmodule
