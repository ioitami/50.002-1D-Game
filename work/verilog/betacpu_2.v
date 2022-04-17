/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module betacpu_2 (
    input clk,
    input rst,
    input [0:0] left,
    input [0:0] right,
    output reg [7:0] player_x,
    output reg [6:0] player_scorelow,
    output reg [6:0] player_scorehigh,
    output reg [6:0] player_highscorelow,
    output reg [6:0] player_highscorehigh,
    output reg [3:0] y_loc,
    output reg [7:0] x_display,
    output reg [7:0] y_view
  );
  
  
  
  wire [16-1:0] M_bitalu_out;
  wire [3-1:0] M_bitalu_zvn;
  reg [16-1:0] M_bitalu_a;
  reg [16-1:0] M_bitalu_b;
  reg [6-1:0] M_bitalu_alufn_signal;
  alu_3 bitalu (
    .a(M_bitalu_a),
    .b(M_bitalu_b),
    .alufn_signal(M_bitalu_alufn_signal),
    .out(M_bitalu_out),
    .zvn(M_bitalu_zvn)
  );
  
  wire [1-1:0] M_clock_detector_out;
  reg [1-1:0] M_clock_detector_in;
  edge_detector_4 clock_detector (
    .clk(clk),
    .in(M_clock_detector_in),
    .out(M_clock_detector_out)
  );
  wire [8-1:0] M_display_display;
  wire [12-1:0] M_display_dataBOut;
  wire [8-1:0] M_display_y_out;
  wire [8-1:0] M_display_x_out;
  wire [7-1:0] M_display_segscorelow;
  wire [7-1:0] M_display_segscorehigh;
  wire [7-1:0] M_display_seghighscorelow;
  wire [7-1:0] M_display_seghighscorehigh;
  reg [1-1:0] M_display_sclock;
  reg [3-1:0] M_display_ran_num;
  reg [4-1:0] M_display_ox3;
  reg [4-1:0] M_display_ox4;
  reg [3-1:0] M_display_ox1;
  reg [7-1:0] M_display_ox0;
  reg [7-1:0] M_display_ox8;
  display_unit_5 display (
    .clk(clk),
    .rst(rst),
    .sclock(M_display_sclock),
    .ran_num(M_display_ran_num),
    .ox3(M_display_ox3),
    .ox4(M_display_ox4),
    .ox1(M_display_ox1),
    .ox0(M_display_ox0),
    .ox8(M_display_ox8),
    .display(M_display_display),
    .dataBOut(M_display_dataBOut),
    .y_out(M_display_y_out),
    .x_out(M_display_x_out),
    .segscorelow(M_display_segscorelow),
    .segscorehigh(M_display_segscorehigh),
    .seghighscorelow(M_display_seghighscorelow),
    .seghighscorehigh(M_display_seghighscorehigh)
  );
  wire [1-1:0] M_slowtimer_slow_value;
  counter_6 slowtimer_slow (
    .clk(clk),
    .rst(rst),
    .value(M_slowtimer_slow_value)
  );
  wire [1-1:0] M_slowtimer_medium_value;
  counter_7 slowtimer_medium (
    .clk(clk),
    .rst(rst),
    .value(M_slowtimer_medium_value)
  );
  wire [1-1:0] M_slowtimer_fast_value;
  counter_8 slowtimer_fast (
    .clk(clk),
    .rst(rst),
    .value(M_slowtimer_fast_value)
  );
  wire [16-1:0] M_reg_raOut;
  wire [16-1:0] M_reg_rbOut;
  wire [7-1:0] M_reg_ox0;
  wire [4-1:0] M_reg_ox1;
  wire [4-1:0] M_reg_ox3;
  wire [4-1:0] M_reg_ox4;
  wire [7-1:0] M_reg_ox8;
  reg [4-1:0] M_reg_regID;
  reg [16-1:0] M_reg_dataIn;
  reg [1-1:0] M_reg_write_enable;
  reg [4-1:0] M_reg_ra;
  reg [4-1:0] M_reg_rb;
  regfile_9 L_reg (
    .clk(clk),
    .rst(rst),
    .regID(M_reg_regID),
    .dataIn(M_reg_dataIn),
    .write_enable(M_reg_write_enable),
    .ra(M_reg_ra),
    .rb(M_reg_rb),
    .raOut(M_reg_raOut),
    .rbOut(M_reg_rbOut),
    .ox0(M_reg_ox0),
    .ox1(M_reg_ox1),
    .ox3(M_reg_ox3),
    .ox4(M_reg_ox4),
    .ox8(M_reg_ox8)
  );
  wire [1-1:0] M_gamefsm_write_enable;
  wire [4-1:0] M_gamefsm_ra;
  wire [4-1:0] M_gamefsm_rb;
  wire [2-1:0] M_gamefsm_asel;
  wire [2-1:0] M_gamefsm_bsel;
  wire [2-1:0] M_gamefsm_wdsel;
  wire [6-1:0] M_gamefsm_alufn;
  wire [4-1:0] M_gamefsm_regID;
  reg [1-1:0] M_gamefsm_sclock;
  reg [1-1:0] M_gamefsm_left;
  reg [1-1:0] M_gamefsm_right;
  reg [16-1:0] M_gamefsm_raout;
  reg [16-1:0] M_gamefsm_rbout;
  fsm_game_10 gamefsm (
    .clk(clk),
    .rst(rst),
    .sclock(M_gamefsm_sclock),
    .left(M_gamefsm_left),
    .right(M_gamefsm_right),
    .raout(M_gamefsm_raout),
    .rbout(M_gamefsm_rbout),
    .write_enable(M_gamefsm_write_enable),
    .ra(M_gamefsm_ra),
    .rb(M_gamefsm_rb),
    .asel(M_gamefsm_asel),
    .bsel(M_gamefsm_bsel),
    .wdsel(M_gamefsm_wdsel),
    .alufn(M_gamefsm_alufn),
    .regID(M_gamefsm_regID)
  );
  wire [4-1:0] M_rantest_out;
  randomgen_11 rantest (
    .clk(clk),
    .rst(rst),
    .out(M_rantest_out)
  );
  
  always @* begin
    M_clock_detector_in = 1'h0;
    M_gamefsm_sclock = 1'h0;
    M_display_sclock = 1'h0;
    if (M_reg_ox0 < 2'h3) begin
      M_clock_detector_in = M_slowtimer_slow_value;
      M_gamefsm_sclock = M_clock_detector_out;
      M_display_sclock = M_clock_detector_out;
    end else begin
      if (M_reg_ox0 >= 2'h3 && M_reg_ox0 < 4'ha) begin
        M_clock_detector_in = M_slowtimer_medium_value;
        M_gamefsm_sclock = M_clock_detector_out;
        M_display_sclock = M_clock_detector_out;
      end else begin
        if (M_reg_ox0 >= 4'ha) begin
          M_clock_detector_in = M_slowtimer_fast_value;
          M_gamefsm_sclock = M_clock_detector_out;
          M_display_sclock = M_clock_detector_out;
        end
      end
    end
    M_gamefsm_left = left;
    M_gamefsm_right = right;
    M_gamefsm_raout = M_reg_raOut;
    M_gamefsm_rbout = M_reg_rbOut;
    M_display_ox0 = M_reg_ox0;
    M_display_ox1 = M_reg_ox1;
    M_display_ox3 = M_reg_ox3;
    M_display_ox4 = M_reg_ox4;
    M_display_ox8 = M_reg_ox8;
    M_display_ran_num = M_rantest_out;
    
    case (M_gamefsm_asel)
      2'h0: begin
        M_bitalu_a = M_reg_raOut;
      end
      2'h1: begin
        M_bitalu_a = 1'h0;
      end
      2'h2: begin
        M_bitalu_a = 2'h3;
      end
      default: begin
        M_bitalu_a = 1'h0;
      end
    endcase
    
    case (M_gamefsm_bsel)
      2'h0: begin
        M_bitalu_b = M_reg_rbOut;
      end
      2'h1: begin
        M_bitalu_b = 1'h0;
      end
      2'h2: begin
        M_bitalu_b = 1'h1;
      end
      2'h3: begin
        M_bitalu_b = 3'h7;
      end
      default: begin
        M_bitalu_b = 1'h0;
      end
    endcase
    M_bitalu_alufn_signal = M_gamefsm_alufn;
    
    case (M_gamefsm_wdsel)
      2'h0: begin
        M_reg_dataIn = M_bitalu_out;
      end
      2'h1: begin
        M_reg_dataIn = M_display_dataBOut;
      end
      default: begin
        M_reg_dataIn = 1'h0;
      end
    endcase
    M_reg_write_enable = M_gamefsm_write_enable;
    M_reg_regID = M_gamefsm_regID;
    M_reg_ra = M_gamefsm_ra;
    M_reg_rb = M_gamefsm_rb;
    player_scorelow = M_display_segscorelow;
    player_scorehigh = M_display_segscorehigh;
    player_highscorelow = M_display_seghighscorelow;
    player_highscorehigh = M_display_seghighscorehigh;
    player_x = M_display_x_out;
    y_loc = M_reg_ox4;
    x_display = M_display_display;
    y_view = M_display_y_out;
  end
endmodule
