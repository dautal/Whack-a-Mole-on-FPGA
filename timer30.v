`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2021 04:12:51 PM
// Design Name: 
// Module Name: timer30
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


module timer30(
    clk_i,
    reset_i,
    timer_in, 
    count_o,
    start_stop
    );
    input clk_i, reset_i, timer_in;
    output reg [6:0] count_o;
    output reg start_stop;
    
    always@(posedge clk_i)begin 
        if(reset_i == 0)begin
            count_o <= 31; 
            start_stop <= 0;
        end
        if(timer_in == 1)begin 
            if(count_o == 0)begin
                count_o <= count_o;
                start_stop <= 0; 
            end else begin
                count_o <= count_o - 1;
                start_stop <= 1;     
            end    
        end
    end
    
    
    
endmodule
