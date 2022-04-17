/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module au_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input usb_rx,
    output reg usb_tx,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip,
    input [1:0] button_lr,
    output reg [6:0] playerscore_low,
    output reg [6:0] playerscore_high,
    output reg [6:0] playerhighscore_low,
    output reg [6:0] playerhighscore_high
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [8-1:0] M_beta_player_x;
  wire [7-1:0] M_beta_player_scorelow;
  wire [7-1:0] M_beta_player_scorehigh;
  wire [7-1:0] M_beta_player_highscorelow;
  wire [7-1:0] M_beta_player_highscorehigh;
  wire [4-1:0] M_beta_y_loc;
  wire [8-1:0] M_beta_x_display;
  wire [8-1:0] M_beta_y_view;
  reg [1-1:0] M_beta_left;
  reg [1-1:0] M_beta_right;
  betacpu_2 beta (
    .clk(clk),
    .rst(rst),
    .left(M_beta_left),
    .right(M_beta_right),
    .player_x(M_beta_player_x),
    .player_scorelow(M_beta_player_scorelow),
    .player_scorehigh(M_beta_player_scorehigh),
    .player_highscorelow(M_beta_player_highscorelow),
    .player_highscorehigh(M_beta_player_highscorehigh),
    .y_loc(M_beta_y_loc),
    .x_display(M_beta_x_display),
    .y_view(M_beta_y_view)
  );
  
  always @* begin
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    usb_tx = usb_rx;
    led = 8'h00;
    io_led = 24'h000000;
    io_seg = 8'hff;
    io_sel = 4'he;
    M_beta_right = button_lr[0+0-:1];
    M_beta_left = button_lr[1+0-:1];
    io_led[0+0+7-:8] = M_beta_player_x;
    io_led[8+0+7-:8] = M_beta_y_view;
    io_led[16+0+7-:8] = M_beta_x_display;
    io_seg = M_beta_player_scorelow;
    playerscore_low = M_beta_player_scorelow;
    playerscore_high = M_beta_player_scorehigh;
    playerhighscore_low = M_beta_player_highscorelow;
    playerhighscore_high = M_beta_player_highscorehigh;
  end
endmodule
