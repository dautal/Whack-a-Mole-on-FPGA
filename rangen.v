`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2021 05:25:42 PM
// Design Name: 
// Module Name: rangen
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


module rangen(
    clk_i,
    reset_i, 
    start_stop, 
    led, 
    num
    );
    input clk_i, reset_i, start_stop; 
    output reg [4:0]led;
    output reg[7:0] num = 255; 
    wire feedback = num[7]; 
    
    always@(posedge clk_i)begin 
        num[0] <= feedback; 
        num[1] <= num[0];
        num[2] <= num[1] ^ feedback;
        num[3] <= num[2] ^ feedback; 
        num[4] <= num[3] ^ feedback;
        num[5] <= num[4];
        num[6] <= num[5] ^ feedback;
        num[7] <= num[6];
    end 
    
    
    
    always@(posedge clk_i)begin 
        if(start_stop == 1)begin
            case(num%5)
                0: begin 
                    led[0] <= 1; led[1] <= 0; led[2] <= 0; led[3] <= 0; led [4] <= 0;
                end
                1: begin 
                    led[0] <= 0; led[1] <= 1; led[2] <= 0; led[3] <= 0; led [4] <= 0;    
                end
                2: begin 
                    led[0] <= 0; led[1] <= 0; led[2] <= 1; led[3] <= 0; led [4] <= 0;
                end
                3: begin 
                    led[0] <= 0; led[1] <= 0; led[2] <= 0; led[3] <= 1; led [4] <= 0;
                end
                4: begin 
                    led[0] <= 0; led[1] <= 0; led[2] <= 0; led[3] <= 0; led [4] <= 1;
                end
            endcase
        end else begin 
            led <= 0; 
        end
    end //always      
endmodule
