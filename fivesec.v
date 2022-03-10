`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2021 04:01:26 PM
// Design Name: 
// Module Name: fivesec
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


module fivesec(
    clk_i,
    reset_i, 
    count_o,
    timer_st
    );
    input clk_i, reset_i; 
    output reg [3:0] count_o;
    output reg timer_st;
    
    always@(posedge clk_i)begin
        if(reset_i == 0)begin
            count_o <= 5; 
            timer_st = 0;
        end
        
        if(reset_i == 1)begin 
            if (count_o == 0)begin 
                timer_st <= 1;
                count_o <= count_o;
            end else begin
                count_o <= count_o - 1;
                timer_st <= 0;
            end
        end     
    end        
endmodule
