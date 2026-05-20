`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.03.2026 18:56:39
// Design Name: 
// Module Name: Design _of_Voting_Machine
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

/*
Here we starts with the button control module. Here i create a counter 32 bit to increment 
continously for period of time if the button if press for certain amount of time then and then 
only the vote is logged. For time measurement we use counter here. Button remains pressed until
the counter bemoes (10)2 in that case only the valid vote will be counter. Otherwise not

*/

module button_control(   
input clk,  // Input clk
input reset,    // Input reset
input button,   // Input button
output reg valid_vote   // Valid vote reg type variable to store the count of votes.
    );
 
 reg [3:0] counter; // Use 32 bit counter for countering purpose 
 
 
  always @(posedge clk)
 begin
    if(reset)
        counter <= 4'd0;  // Reset the machine
    else
        if(button)
            begin
                if(counter<4'd3)
                    counter <= counter +1;
                 else 
                    counter <= 4'd0;
            end
        else
            counter <= 4'd0;
 end
    
 
 always @(posedge clk)
 begin
    if(reset)
        valid_vote<=1'b0;           // Reset the machine
    else
        if(counter==4'd2)          // Valid vote will be counted if the counter reached to (10)2
            valid_vote<=1'b1;
        else
            valid_vote<=1'b0;           // Otherwise the valid vote will be 0.
 end
    
endmodule


module vote_logged(
input candt1_valid_vote,        // Candidate-1 Vote input
input candt2_valid_vote,        // Candidate-2 Vote input
input candt3_valid_vote,        // Candidate-3 Vote input
input candt4_valid_vote,        // Candidate-4 Vote input
input candt5_valid_vote,        // Candidate-5 Vote input
input clk,                      // Input clock
input reset,                     // Input Reset
input mode,                              // Input for mode selection Mode=0 Logged vote and Mode=1 Display the vote
output reg [7:0] candt1_recvd_vote,         // Candidate-1 Vote Received Storage element
output reg [7:0] candt2_recvd_vote,         // Candidate-2 Vote Received Storage element
output reg [7:0] candt3_recvd_vote,         // Candidate-3 Vote Received Storage element
output reg [7:0] candt4_recvd_vote,         // Candidate-4 Vote Received Storage element
output reg [7:0] candt5_recvd_vote          // Candidate-5 Vote Received Storage element
);

always @(posedge clk)
begin
    if(reset)                                   // Reset the Machine
        begin
        candt1_recvd_vote<=8'd0;
        candt2_recvd_vote<=8'd0;
        candt3_recvd_vote<=8'd0;
        candt4_recvd_vote<=8'd0;
        candt5_recvd_vote<=8'd0;
        end
     else
        begin
        if(candt1_valid_vote && mode==1'b0)             // Increment candidate 1 vote if mode=0 is selected and vote is pressed.
        candt1_recvd_vote <= candt1_recvd_vote + 1;
        
        else if(candt2_valid_vote && mode==1'b0)        // Increment candidate 2 vote if mode=0 is selected and vote is pressed.
        candt2_recvd_vote <= candt2_recvd_vote + 1;
        
        else if(candt3_valid_vote && mode==1'b0)
        candt3_recvd_vote <= candt3_recvd_vote + 1;     // Increment candidate 3 vote if mode=0 is selected and vote is pressed.
        
        else if(candt4_valid_vote && mode==1'b0)
        candt4_recvd_vote <= candt4_recvd_vote + 1;     // Increment candidate 4 vote if mode=0 is selected and vote is pressed.
        
        else if(candt5_valid_vote && mode==1'b0)
        candt5_recvd_vote <= candt5_recvd_vote + 1;         // Increment candidate 5 vote if mode=0 is selected and vote is pressed.
        end
end


endmodule



module mode_control(
input  clk,
input reset,
input mode,
input [7:0] candt1_vote,
input [7:0] candt2_vote,
input [7:0] candt3_vote,
input [7:0] candt4_vote,
input [7:0] candt5_vote,
input candidate1_button_pressed,
input candidate2_button_pressed,
input candidate3_button_pressed,
input candidate4_button_pressed,
input candidate5_button_pressed,
output reg [7:0] total_voted = 8'd0
);

always @(posedge clk)
begin
    if(reset)
        total_voted <= 8'd0;
    else if(mode==1'b1)
        begin
            if(candidate1_button_pressed)
                total_voted <= candt1_vote;
            else if(candidate2_button_pressed)  
                total_voted <= candt2_vote;
            else if(candidate3_button_pressed)  
                total_voted <= candt3_vote; 
            else if(candidate4_button_pressed)  
                total_voted <= candt4_vote;
            else if(candidate5_button_pressed)             
                total_voted <= candt5_vote;
           end
    end

endmodule


module voting_machine(
input clk,
input reset,
input mode,
input button1,
input button2,
input button3,
input button4,
input button5,
output [7:0] display
);

wire valid_vote1;
wire valid_vote2;
wire valid_vote3;
wire valid_vote4;
wire valid_vote5;
wire [7:0] cand1_vote_recvd;
wire [7:0] cand2_vote_recvd;
wire [7:0] cand3_vote_recvd;
wire [7:0] cand4_vote_recvd;
wire [7:0] cand5_vote_recvd;


button_control bc1(
.clk(clk),
.reset(reset),
.button(button1),
.valid_vote(valid_vote1)
);

button_control bc2(
.clk(clk),
.reset(reset),
.button(button2),
.valid_vote(valid_vote2)
);

button_control bc3(
.clk(clk),
.reset(reset),
.button(button3),
.valid_vote(valid_vote3)
);

button_control bc4(
.clk(clk),
.reset(reset),
.button(button4),
.valid_vote(valid_vote4)
);

button_control bc5(
.clk(clk),
.reset(reset),
.button(button5),
.valid_vote(valid_vote5)
);

vote_logged VL(
.clk(clk),
.reset(reset),
.mode(mode),
.candt1_valid_vote(valid_vote1),
.candt2_valid_vote(valid_vote2),
.candt3_valid_vote(valid_vote3),
.candt4_valid_vote(valid_vote4),
.candt5_valid_vote(valid_vote5),
.candt1_recvd_vote(cand1_vote_recvd),
.candt2_recvd_vote(cand2_vote_recvd),
.candt3_recvd_vote(cand3_vote_recvd),
.candt4_recvd_vote(cand4_vote_recvd),
.candt5_recvd_vote(cand5_vote_recvd)
);

mode_control MC(
.clk(clk),
.reset(reset),
.mode(mode),
.candt1_vote(cand1_vote_recvd),
.candt2_vote(cand2_vote_recvd),
.candt3_vote(cand3_vote_recvd),
.candt4_vote(cand4_vote_recvd),
.candt5_vote(cand5_vote_recvd),
.candidate1_button_pressed(button1),
.candidate2_button_pressed(button2),
.candidate3_button_pressed(button3),
.candidate4_button_pressed(button4),
.candidate5_button_pressed(button5),
.total_voted(display)
);


endmodule










