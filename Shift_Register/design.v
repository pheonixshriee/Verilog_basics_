`timescale 1ns / 1ps


module universal_shift_register 
#(
parameter N=8       //  Paramer declaration
)
(
    input clk,
    input reset,
    input serial_in,
    input [1:0] sel,
    input [N-1:0] parallel_in,
    output reg [N-1:0] Out
);

always@(posedge clk)
begin
    if(reset)
    Out<=0;
    
    else
    begin
    case(sel)
        2'b00: // Hold
            begin Out<=Out;       end
        2'b01: // Left shift
            begin Out<= {Out[N-2:0],serial_in};  end     
        2'b10: // Right shift
            begin Out<= {serial_in,Out[N-1:0]};  end    
        2'b11: // Parallel In data
            begin Out<= parallel_in;  end   
    endcase
    end
end

 
endmodule