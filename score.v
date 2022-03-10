`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2021 02:39:44 PM
// Design Name: 
// Module Name: score
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


module score(
input MHz100_clk_i,
    input Hz_clk_i,
    input reset_i,
    input  [4:0] LED_i,
    input  [4:0] whack_i,
    output reg [4:0] score_o //max 30
    );
    
    reg pressed = 0;
    
    always@(posedge Hz_clk_i)begin
        pressed <= 0;
    end
    
    always@(posedge MHz100_clk_i)begin
        if (reset_i == 1)begin
            score_o <= 0;
        end else begin
            if (pressed == 0)begin
                if ((whack_i[0] == 1 && LED_i[0] == 1) ||//if correct button press
                    (whack_i[1] == 1 && LED_i[1] == 1) ||
                    (whack_i[2] == 1 && LED_i[2] == 1) ||
                    (whack_i[3] == 1 && LED_i[3] == 1) ||
                    (whack_i[4] == 1 && LED_i[4] == 1))begin
                    score_o <= score_o + 1;
                    pressed <= 1;
                end else begin
                if ((whack_i[0] == 1 && LED_i[0] != 1) ||//if incorrect button press
                    (whack_i[1] == 1 && LED_i[1] != 1) ||
                    (whack_i[2] == 1 && LED_i[2] != 1) ||
                    (whack_i[3] == 1 && LED_i[3] != 1) ||
                    (whack_i[4] == 1 && LED_i[4] != 1))begin
                    pressed <= 1;
                    end
                end
            end
        end
    end //always
    
endmodule
