module bcd_adder(A,B,Out);
input [3:0] A;
input [3:0] B;
output [4:0] Out;

wire correct_flag;
wire [4:0] temp;

// For addition

assign temp = (A + B);

// Check wheather the output is greater than 9 or not.

assign correct_flag = (temp > 9);

// If correct_flag is set then add 6 else not.

assign Out = correct_flag ? (temp+5'b00110) : temp;

endmodule
