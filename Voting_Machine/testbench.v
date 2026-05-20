`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.03.2026 22:55:30
// Design Name: 
// Module Name: voting_machine_tb
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


module voting_machine_tb();

reg clk;
reg reset;
reg mode;
reg button1;
reg button2;
reg button3;
reg button4;
reg button5;

wire [7:0] display;

voting_machine DUT(
.clk(clk),
.reset(reset),
.mode(mode),
.button1(button1),
.button2(button2),
.button3(button3),
.button4(button4),
.button5(button5),
.display(display)
);

initial
begin
clk = 0;
forever #5 clk = ~clk;
end

initial
begin

// -------------------- RESET --------------------
reset = 1;
mode  = 0;
button1 = 0; button2 = 0; button3 = 0; button4 = 0; button5 = 0;
#100;

reset = 0;

// -------------------- CANDIDATE 1 VOTES --------------------
button1=1; button2=0; button3=0; button4=0; button5=0;
#50;
button1=0; button2=0; button3=0; button4=0; button5=0;
#200;

button1=1; button2=0; button3=0; button4=0; button5=0;
#50;
button1=0; button2=0; button3=0; button4=0; button5=0;
#200;

// -------------------- CANDIDATE 2 VOTE --------------------
button1=0; button2=1; button3=0; button4=0; button5=0;
#50;
button1=0; button2=0; button3=0; button4=0; button5=0;
#200;

// -------------------- CANDIDATE 3 VOTE --------------------
button1=0; button2=0; button3=1; button4=0; button5=0;
#50;
button1=0; button2=0; button3=0; button4=0; button5=0;
#200;

// -------------------- CANDIDATE 4 VOTES --------------------
button1=0; button2=0; button3=0; button4=1; button5=0;
#50;
button1=0; button2=0; button3=0; button4=0; button5=0;
#200;

button1=0; button2=0; button3=0; button4=1; button5=0;
#50;
button1=0; button2=0; button3=0; button4=0; button5=0;
#200;

// -------------------- CANDIDATE 5 VOTE --------------------
button1=0; button2=0; button3=0; button4=0; button5=1;
#50;
button1=0; button2=0; button3=0; button4=0; button5=0;
#200;

// -------------------- INVALID CASE (MULTIPLE BUTTONS) --------------------
button1=0; button2=1; button3=1; button4=0; button5=0;                  // Only button2 vote will be counted because we used else if ladder in vote_logged module.
#50;
button1=0; button2=0; button3=0; button4=0; button5=0;
#200;

// -------------------- BUTTON HOLD TEST --------------------
button1=1; button2=0; button3=0; button4=0; button5=0;
#100;                                                       // We are holding button here so multiple votes will be given.
button1=0; button2=0; button3=0; button4=0; button5=0;
#200;

// -------------------- SWITCH TO RESULT MODE --------------------
mode = 1;

// Display Candidate 1 Votes
button1=1; button2=0; button3=0; button4=0; button5=0;
#200;
button1=0;

// Display Candidate 2 Votes
button1=0; button2=1; button3=0; button4=0; button5=0;
#200;
button2=0;

// Display Candidate 3 Votes
button1=0; button2=0; button3=1; button4=0; button5=0;
#200;
button3=0;

// Display Candidate 4 Votes
button1=0; button2=0; button3=0; button4=1; button5=0;
#200;
button4=0;

// Display Candidate 5 Votes
button1=0; button2=0; button3=0; button4=0; button5=1;
#200;
button5=0;

// -------------------- TRY VOTING IN RESULT MODE --------------------
button1=1; button2=0; button3=0; button4=0; button5=0;
#200;
button1=0;
mode=0;
// -------------------- FINISH --------------------
#3000;
$finish;

end

endmodule

