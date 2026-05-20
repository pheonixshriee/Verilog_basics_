	module testbench();
reg [3:0] A;
reg [3:0] B;
wire [4:0] Out;

bcd_adder UUT(.A(A),.B(B),.Out(Out));

initial
begin
A=4'd0;B=4'd5;
#50;
A=4'd5;B=4'd5;
#50;
A=4'd11;B=4'd8;
#50;
A=4'd3;B=4'd13;
#50;
A=4'd10;B=4'd5;
#50;

#100;
end
endmodule