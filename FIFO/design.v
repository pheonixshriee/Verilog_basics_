`timescale 1ns / 1ps


module snychronous_fifo(   //   Here we use width of 8 and depth of 8.
    input clk,
    input reset,
    input rd_enb,
    input wr_enb,
    input [7:0] data_in,
    output reg [7:0] data_out,
    output full,
    output empty
);

reg [7:0] mem [7:0];
reg [2:0] wr_ptr=3'b000;
reg [2:0] rd_ptr=3'b000;


integer i;
always@(posedge clk)
    if(reset)
    begin
        wr_ptr<=0;
        for(i=0;i<8;i=i+1)      // Reset the memory
        begin
        mem[i]<=0;
        end
    end
    else if(wr_enb && !full )     //Write operation
        begin
        mem[wr_ptr]<=data_in;
        wr_ptr<=wr_ptr+1;
        end
        
always@(posedge clk)
    if(reset)
    begin
        rd_ptr<=0;
        data_out<=0;            // Reset the output data
    end
    else if(rd_enb && !empty)             // Read Operation
    begin
        data_out<=mem[rd_ptr];
        rd_ptr<=rd_ptr+1;
    end
    
 assign full = ((wr_ptr + 1) == rd_ptr)? 1'b1:1'b0;
 assign empty = (wr_ptr == rd_ptr)? 1'b1:1'b0;
 
endmodule