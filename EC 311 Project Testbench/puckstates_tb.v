`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2023 02:42:02 PM
// Design Name: 
// Module Name: puckstates_tb
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


module puckstates_tb(

    );
    
    reg clk;
	reg reset;
	
	reg [10:0] Lx;
	reg [10:0] Ly;
	reg [10:0] Rx;
	reg [10:0] Ry;
	
	reg Lup;
	reg Lmid;
	reg Ldown;
	reg Rup;
	reg Rmid;
	reg Rdown;
	reg [10:0] Pradius;
	reg [10:0] Rradius;
	
	
	wire [9:0] puckX;
	wire [8:0] puckY;
	wire [4:0] puckstate;
	
	
	wire [2:0] GL;
	wire [2:0] GR;
	
	puckstates_FSM psfsm(.clk(clk), .reset(reset), .Lx(Lx), .Ly(Ly), .Rx(Rx), .Ry(Ry), .Lup(Lup), .Ldown(Ldown), .Lmid(Lmid), .Rup(Rup), .Rdown(Rdown), .Rmid(Rmid),
	.Pradius(Pradius), .Rradius(Rradius), .puckX(puckX), .puckY(puckY), .puckstate(puckstate), .GL(GL), .GR(GR));
	
	always #1 clk = ~clk;
	always #2 Lx = Lx + 1;
	always #3 Lx = Lx - 1;
	always #2 Rx = Rx + 1;
	always #3 Rx = Rx - 1;
	always #2 Rup = ~Rup;
	always #3 Rdown = ~Rdown;
	always #5 Rmid = ~Rmid;
	always #2 Lup = ~Lup;
	always #3 Ldown = ~Ldown;
	always #5 Lmid = ~Lmid;
	
	initial begin
	clk = 0;
	
	Lx = 160;
	Ly = 240;
	Rx = 320;
	Ry = 240;
	Lup = 0;
	Ldown = 0;
	Lmid = 0;
	Rup = 0;
	Rdown = 0;
	Rmid = 0;
	Pradius = 5;
	Rradius = 13;
	
	
	end
    
endmodule
