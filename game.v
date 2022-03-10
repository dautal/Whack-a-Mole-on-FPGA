`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2021 02:29:51 PM
// Design Name: 
// Module Name: game
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


module game(
    input clk_i,
    input reset_i,
    input [4:0]whack_i,
    output [4:0]led,
    output [6:0] disp,
    output [7:0] code
    );
    
    wire [4:0]whack_o;
    wire [15:0]count_o;
    wire [15:0]fivesec_count_o;
    wire [15:0]timer30_count_o;
    
    wire khz_clock;
    wire hz_clock; 
    
    wire [7:0] num;
    wire start_stop;
    wire [15:0] score;

    wire [3:0]selected_count;
    
    // just a clock divider
    clock_divider clock_div(clk_i, hz_clock, khz_clock);
    
    // timers
    fivesec five(hz_clock, reset_i, fivesec_count_o, timer30_st); 
    timer30 timer(hz_clock, reset_i, timer30_st, timer30_count_o, start_stop);
    
    assign count_o = (start_stop) ? timer30_count_o : fivesec_count_o;
    
    // during-game activity   
    rangen(hz_clock, khz_clock, reset_i, start_stop, led, num);
    
    debouncer deb0(clk_i, reset_i, whack_i[0], whack_o[0]);
    debouncer deb1(clk_i, reset_i, whack_i[1], whack_o[1]);
    debouncer deb2(clk_i, reset_i, whack_i[2], whack_o[2]);
    debouncer deb3(clk_i, reset_i, whack_i[3], whack_o[3]);
    debouncer deb4(clk_i, reset_i, whack_i[4], whack_o[4]);
    
    score game_score(clk_i, hz_clock, reset_i, led, whack_o, score);
    
    // display timers & score 
    display_control disp_ctrl(clk_i, khz_clock, count_o, score, code, selected_count);
    seven_segment_decoder sev_seg_dec(selected_count, disp);
    


endmodule
