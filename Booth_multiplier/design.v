`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.03.2026 09:31:09
// Design Name: 
// Module Name: multiplier_design
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

module multiplier_design(
input clk,rst,start,
input signed [3:0] M,
input signed [3:0] Q_in,
output reg signed [7:0] result,
output reg done
);

reg signed [3:0] A,Q;
reg signed [3:0] A_temp;
reg signed [8:0] temp;
reg Q_1;
reg [2:0] count;

always @(posedge clk)
begin 
    if(rst)
        begin
        A<=0;
        Q<=0;
        result<=0;
        Q_1<=0;
        count<=0;
        done<=0;
        end
    
    else if(start)
        begin
        A<=0;
        Q<=Q_in;
        Q_1<=0;
        count<=4;
        done<=0;
        end
        
     else if(count>0)
        begin
            // Booth Conditions
            case({Q[0],Q_1})
              2'b01: A_temp=A+M;   
              2'b10: A_temp=A-M;
              default : A_temp=A;
            endcase
            
            // Arithmetic right shift
           temp = {A_temp[3],A_temp[3:0],Q[3:0]};
           {A,Q,Q_1} <= temp;
           count<=count-1;
        end  
          
       else 
        begin
            if(~done)
                begin
                    result<=temp[8:1];
                    done<=1'b1;
                end
        end
end

endmodule