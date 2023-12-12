`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2023 12:39:22 PM
// Design Name: 
// Module Name: Player_motion
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


module Player_motion(
    input [31:0] keycode,
    input clk,
    input [5:0] paddlewidth,
    input [8:0] maxy,
    input [9:0] maxx,
    input ID,
    input space,
    input [1:0]mode,
    
    output reg [9:0] x_pos,
    output reg [8:0] y_pos 
    );
    
    reg [5:0] plspeedx; 
    reg [5:0] plspeedy;
    wire [9:0] halfx = maxx / 2;
    reg w,a,s,d,up,down,left,right;
    
    //player speed from mode
    always @ (space) begin
    if (mode == 0 | mode == 1 | mode == 4 | mode == 5) begin
		plspeedx = 1;
		plspeedy = 1;
		end
		else if (mode == 2 | mode == 3 | mode == 6 | mode == 7) begin
		plspeedx = 5;
		plspeedy = 5;
		end
    end
    
    always @ (posedge clk) begin
        //player control based on ID
        case (ID)
        0: begin if(space == 0) begin
            x_pos = 160;
            y_pos = 240;
            w <= 0;
            s <= 0;
            a <= 0;
            d <= 0;
            end
            else if (space == 1) begin  
                if (keycode[7:0] == 8'h1D) begin
                w <= 1;
                a <= 0;
                s <= 0;
                d <= 0;
                    end
                
                else if (keycode[7:0] == 8'h1B) begin
                w <= 0;
                a <= 0;
                s <= 1;
                d <= 0;
                   end
                else if (keycode[7:0] == 8'h23) begin
                w <= 0;
                a <= 0;
                s <= 0;
                d <= 1;
                   end
                
                else if (keycode[7:0] == 8'h1C) begin
                w <= 0;
                a <= 1;
                s <= 0;
                d <= 0;
                    end
                end
                
                 if (w) begin
                    if (y_pos >= paddlewidth) begin
                        y_pos = y_pos - plspeedy;
                    end
                    else
                        y_pos = paddlewidth;
                    end
                
                else if (s) begin
                    if (y_pos <= maxy - paddlewidth) begin
                        y_pos = y_pos + plspeedy;
                    end
                    else 
                        y_pos = maxy - paddlewidth;
                    end
                else if (d) begin
                    if (x_pos <= halfx-paddlewidth) begin
                        x_pos = x_pos + plspeedx;
                    end
                    else
                        x_pos = halfx - paddlewidth;
                    end
                
                else if (a) begin
                    if (x_pos >= paddlewidth) begin
                        x_pos = x_pos - plspeedx;
                    end
                    else
                        x_pos = paddlewidth;
                    end
                end
                
                
                
                
        1: begin if (space == 0) begin
                    x_pos = 480;
                    y_pos = 240;
                    up <= 0;
                    down <= 0;
                    left <= 0;
                    right <= 0;
                 end
                 else if(space == 1) begin
                    if (keycode == 8'h75) begin
                      
                up <= 1;
                down <= 0;
                left <= 0;
                right <= 0;
                        end
                    
                    else if (keycode[7:0] == 8'h72) begin
                up <= 0;
                down <= 1;
                left <= 0;
                right <= 0;        
                        end
                    else if (keycode[7:0] == 8'h74) begin
                up <= 0;
                down <= 0;
                left <= 0;
                right <= 1;       
                        end
                    
                    else if (keycode[7:0] == 8'h6B) begin
               up <= 0;
                down <= 0;
                left <= 1;
                right <= 0;       
                        end
                        
                          if (up) begin
                        if (y_pos >= paddlewidth) begin
                            y_pos = y_pos - plspeedy;
                        end
                        else
                            y_pos = paddlewidth;
                        end
                    
                    else if (down) begin
                        if (y_pos <= maxy - paddlewidth) begin
                            y_pos = y_pos + plspeedy;
                        end
                        else
                            y_pos = maxy - paddlewidth;
                        end
                    else if (right) begin
                        if (x_pos <= maxx-paddlewidth) begin
                            x_pos = x_pos + plspeedx;
                        end
                        else
                            x_pos = maxx - paddlewidth;
                        end
                    
                    else if (left) begin
                        if (x_pos >= halfx + paddlewidth) begin
                            x_pos = x_pos - plspeedx;
                        end
                        else
                            x_pos = halfx + paddlewidth;
                        end
                        
                        
                        
                    end 
                    
                end 
          
        endcase
    end
    
endmodule
