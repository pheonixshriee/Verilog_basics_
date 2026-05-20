`timescale 1ns / 1ps

module carry_look_ahead_4bit (
    input  [3:0] A,
    input  [3:0] B,
    input        Cin,
    output [3:0] Sum,
    output       Cout
);

    wire [3:0] G;   // Generate
    wire [3:0] P;   // Propagate
    wire [4:0] C;   // Carry

    assign C[0] = Cin;

    // Generate and Propagate
    assign G = A & B;       // Carry generattor
    assign P = A ^ B;       // Carry propogator

    // Carry equations
    assign C[1] = G[0] | (P[0] & C[0]);

    assign C[2] = G[1] | (P[1] & G[0]) |        //  C[2] = G[1] | P[1]C[1] 
                  (P[1] & P[0] & C[0]);

    assign C[3] = G[2] | (P[2] & G[1]) |        // C[3] = G[2] | P[2]C[2]
                  (P[2] & P[1] & G[0]) |
                  (P[2] & P[1] & P[0] & C[0]);

    assign C[4] = G[3] | (P[3] & G[2]) |        //C[4] = G[3] | P[3]C[3]
                  (P[3] & P[2] & G[1]) |
                  (P[3] & P[2] & P[1] & G[0]) |
                  (P[3] & P[2] & P[1] & P[0] & C[0]);

    // Sum
    assign Sum = P ^ C[3:0];

    // Final Carry
    assign Cout = C[4];

endmodule