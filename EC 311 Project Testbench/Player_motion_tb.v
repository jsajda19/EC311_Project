`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2023 02:42:02 PM
// Design Name: 
// Module Name: Player_motion_tb
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


module Player_motion_tb(

    );
    
    reg [7:0] keycode;
    reg clk;
    reg [5:0] paddlewidth;
    reg [8:0] maxy;
    reg [9:0] maxx;
    reg ID;
    reg space;
    wire [9:0] x_pos;
    wire [8:0] y_pos;
    
    
    Player_motion pm(.keycode(keycode), .clk(clk), .paddlewidth(paddlewidth), .maxy(maxy), .maxx(maxx), .ID(ID), .space(space), .x_pos(x_pos), .y_pos(y_pos));
    
    always #1 clk = ~clk;
    
    initial begin
    clk = 0;
    maxx = 640;
    maxy = 480;
    paddlewidth = 26;
    ID = 0;
    space = 0;
    keycode = 8'h1D;
    #50
    space = 1;
    #50
    keycode = 8'h1B;
    #50
    keycode = 8'h23;
    #50
    keycode = 8'h1C;
    
    end
    
    
endmodule
