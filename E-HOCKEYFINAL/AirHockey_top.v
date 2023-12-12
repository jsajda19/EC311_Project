`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2023 06:50:32 PM
// Design Name: 
// Module Name: AirHockey_top
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


module AirHockey_top(
    
    input clk,
    input reset,
    
    
    //Keyboard Inputs
    input PS2_CLK,
    input PS2_DATA,
	
	
    //VGA Outputs
    output wire VGA_HS_O,       
    output wire VGA_VS_O,
    output reg [3:0] VGA_R,    
    output reg [3:0] VGA_G,    
    output reg [3:0] VGA_B,
    
    //seven segment display outputs
    output [6:0] cathode,
    output [7:0] anode
    );
    
    wire [31:0] keycodeout;
    reg [5:0] paddlewidth = 26;
    
    reg [7:0] keycode;
    reg [9:0] maxx = 640; //screen x and y limits
    reg [8:0] maxy = 480;
    
    wire [9:0] Lx; //player L/R x and y positions
	wire [8:0] Ly;
	wire [9:0] Rx;
	wire [8:0] Ry;
	
	reg [9:0] currLx;
	reg [8:0] currLy;
	reg [9:0] currRx;
	reg [8:0] currRy;
	
	wire [9:0] puckX; // puck positions
	wire [8:0] puckY;
	wire puckstate;
	
	wire [2:0] GL; //goal counters
	wire [2:0] GR;
	
	reg [10:0] Pradius = 5; //puck radius
	reg [10:0] Rradius = 13; //player radius
	
	wire [9:0] x; //x and y position of vga scan
	wire [8:0] y;
	
	wire gameoutGO, gameoutMenu; //visual outputs
	wire GoalL, GoalR;
	wire GoallineL,GoallineR, Centerline, background;
    wire Player1,Player2,Puck,wbox1,wbox2,BUB,BUU;
	
	reg Lup; //shoot direction buttons
	reg Lmid;
	reg Ldown;
	reg Rup;
	reg Rmid;
	reg Rdown;
	
	reg space = 0;
	
	reg swl = 0; //switch puck position relative to player holding it
	reg swr = 0;
	
	reg [2:0] mode = 0;
	reg [10:0] lgoalyhigh = 0; //highest point of goal line
	reg [10:0] rgoalyhigh = 0;
	
	wire fasterclk;
	
     
     //VGA Inputs
     reg [15:0] cnt;
    reg pix_stb;
    wire oclk;
    
    
    clock_divider(.in_clk(clk),.out_clk(oclk)); //reduced clock speed
    
    always @(posedge oclk) begin
    if (mode == 0 | mode == 1 | mode == 2 | mode == 3) begin //sets goal line
	lgoalyhigh = 160;
	rgoalyhigh = 160;
	end
	else if (mode == 4 | mode == 5) begin
	lgoalyhigh <= lgoalyhigh - 2;
	rgoalyhigh <= rgoalyhigh - 2;
	end
	else if (mode == 6 | mode == 7) begin
	lgoalyhigh <= lgoalyhigh - 5;
	rgoalyhigh <= rgoalyhigh - 5;
	end
	end
    
    
    always @(posedge clk)
        {pix_stb, cnt} <= cnt + 16'h4000;  
        
        
    
    always @(posedge clk) begin
    
    
    	   if(keycodeout[7:0] == 8'h29 || keycodeout[7:0] == 8'h5A) //decides game state by space value
	       space = 1;
	   
	   else if(keycodeout[7:0] == 8'h66)
	       space = 0;
    
	
	if (keycodeout[7:0] == 8'h16 & space == 0)begin //sets game mode
	mode <= 0;
	end
	else if (keycodeout[7:0] == 8'h1E & space == 0)begin
	mode <= 1;
	end
	else if (keycodeout[7:0] == 8'h26 & space == 0)begin
	mode <= 2;
	end
	else if (keycodeout[7:0] == 8'h25 & space == 0)begin
	mode <= 3;
	end
	else if (keycodeout[7:0] == 8'h2E & space == 0)begin
	mode <= 4;
	end
	else if (keycodeout[7:0] == 8'h36 & space == 0)begin
	mode <= 5;
	end
	else if (keycodeout[7:0] == 8'h3D & space == 0)begin
	mode <= 6;
	end
	else if (keycodeout[7:0] == 8'h3E & space == 0)begin
	mode <= 7;
	end
	
	
	
	end
	
	always @ (keycodeout) begin //binds keyboard inputs
	
	  keycode = keycodeout[7:0];
	   
	   	
        if (keycode == 8'h32) begin
           Lup = 1;
        end
        else if (keycode == 8'h31) begin
           Lmid = 1;
        end
        else if (keycode == 8'h3A) begin
            Ldown = 1;
        end
        else if (keycode ==8'h69) begin
            Rup = 1;
        end
        else if (keycode == 8'h73) begin
            Rmid = 1;
        end
        else if (keycode == 8'h7A) begin
            Rdown = 1;
        end
        else if (keycode == 8'h41) begin
            swl = 1;
        
        end
        else if (keycode == 8'h49) begin
            swl = 0;
        end
        else if (keycode == 8'h70 ) begin
            swr = 1;
        end
        else if (keycode == 8'h71 ) begin
            swr = 0;
        end

        
        else begin
            Rup = 0;
            Rmid = 0;
            Rdown = 0;
            Lup = 0;
            Lmid = 0;
            Ldown = 0;

        end

    end
    
    //vga output value assignments
    assign Player1 = ((y > Ly - Rradius) & (y < Ly + Rradius) & (x > Lx - Rradius) & (x < Lx + Rradius)) ? 1 : 0;
    assign Player2 = ((y > Ry - Rradius) & (y < Ry + Rradius) & (x > Rx - Rradius) & (x < Rx + Rradius)) ? 1 : 0;


    assign Puck = ((y > puckY - Pradius) & (y < puckY + Pradius) & (x > puckX - Pradius) & (x < puckX + Pradius)) ? 1 : 0;
    
    assign GoalL = ((y > lgoalyhigh) & (y < lgoalyhigh+160) & (x > 10) & (x < 15)) ? 1 : 0;
    assign GoalR = ((y > rgoalyhigh) & (y < rgoalyhigh+160) & (x > 625) & (x < 630)) ? 1 : 0;
    
    assign GoallineL = ((y > 0) & (y < 480) & (x > 0) & (x < 10)) ? 1 : 0;
    assign GoallineR = ((y > 0) & (y < 480) & (x > 630) & (x < 640)) ? 1 : 0;
    assign Centerline = ((y > 0) & (y < 480) & (x > 310) & (x < 330)) ? 1 : 0;

    assign wbox1 = ((y > 0) & (y < 480) & (x > 10) & (x < 310)) ? 1 : 0;
    assign wbox2 = ((y > 0) & (y < 480) & (x > 330) & (x < 630)) ? 1 : 0;
    
     lettermap BUB1(.x(x),.y(y),.xstart(275),.ystart(215),.ID(2),.value(BUB),.wwidth(50),.wheight(50));
     lettermap BUU1(.x(x),.y(y),.xstart(335),.ystart(215),.ID(21),.value(BUU),.wwidth(50),.wheight(50));


    Player_motion P1(.keycode(keycode), .clk(oclk), .paddlewidth(2*Rradius), .maxy(maxy), .maxx(maxx), .x_pos(Lx), .y_pos(Ly), .ID(0), .space(space), .mode(mode));
    Player_motion P2(.keycode(keycode), .clk(oclk), .paddlewidth(2*Rradius), .maxy(maxy), .maxx(maxx), .x_pos(Rx), .y_pos(Ry), .ID(1), .space(space), .mode(mode));
    
    puckstates_FSM ps(.clk(oclk), .reset(reset), .Lx(Lx), .Ly(Ly), .Rx(Rx), .Ry(Ry), .Lup(Lup), .Lmid(Lmid), .Ldown(Ldown), .Rup(Rup), .Rmid(Rmid), .Rdown(Rdown), .puckstate(puckstate), .puckX(puckX), .puckY(puckY), .GL(GL), .GR(GR), .Pradius(Pradius), .Rradius(Rradius),.space(space),.swr(swr),.swl(swl), .mode(mode),.lgoalyhigh(lgoalyhigh),.rgoalyhigh(rgoalyhigh));
   
   //vga operation
    vga640x480 display ( 
        .i_clk(clk),
        .i_pix_stb(pix_stb),
        .i_rst(reset),
        .o_hs(VGA_HS_O), 
        .o_vs(VGA_VS_O), 
        .o_x(x), 
        .o_y(y)
    );
    
    
    PS2Receiver ps2(.clk(clk), .kclk(PS2_CLK), .kdata(PS2_DATA), .keycodeout(keycodeout)); //keyboard input receiver

    
    fasterclock fc(.in_clk(clk), .out_clk(fasterclk));
    
    segdisp s7(.clock(fasterclk), .score2(GR), .score1(GL), .anode(anode), .cathode(cathode));
    
    GOScreen go(.x(x), .y(y), .gameout(gameoutGO));
    menu m(.x(x), .y(y),.mode(mode), .gameout(gameoutMenu));
    
    //screen control
    always@(posedge clk) begin
    if (space == 0)begin
        VGA_B[3] = gameoutMenu;
        VGA_R[3] = gameoutMenu;
        VGA_G[3] = gameoutMenu;
        end
    else if (GR == 7 || GL == 7 || keycode == 8'h76) begin
        VGA_R[3] = gameoutGO;     
    end
    
    else begin
        VGA_G[3] =  Puck + Player2 + wbox1+ wbox2 + GoalL+ GoalR + Player2 + Player1 + BUB + BUU;
        VGA_R[3] =  Puck    + Centerline+ wbox1+ wbox2+ GoalL + GoalR + Player2 + Player1+ GoalL + GoalR ;
        VGA_B[3] = Player1 + Puck  + GoalL + GoalR + GoallineL + GoallineR + wbox1+ wbox2  + Player2 + Player1 + GoalL + GoalR + BUB + BUU;
        VGA_G[2] = wbox1+ wbox2;
        VGA_G[1] = wbox1+ wbox2;
        VGA_R[2] = wbox1+ wbox2 ;
        VGA_R[1] = wbox1+ wbox2 ;
        VGA_B[2] = wbox1+ wbox2 ;
        VGA_B[1] = wbox1+ wbox2 ;
    end
    end
    
    
endmodule