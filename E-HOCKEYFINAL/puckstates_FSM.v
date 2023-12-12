`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Eee-Eee
// Engineer: Yousif Alhajji
// 
// Create Date: 12/04/2023 06:44:15 PM
// Design Name: 
// Module Name: puckstates
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


//state definition
`define SETUP 0
`define	NE	1 
`define	E	2
`define	SE  3
`define	NW	4
`define	W	5
`define	SW	6 
`define	HR	7
`define	HL	8
`define	GoalbyL	9
`define	GoalbyR	10
`define	HR2	11
`define	HL2	12


module puckstates_FSM(

    input clk,
	
	input reset,
	input space,
	input [10:0] Lx,
	input [10:0] Ly,
	input [10:0] Rx,
	input [10:0] Ry,
	
	input Lup,
	input Lmid,
	input Ldown,
	input Rup,
	input Rmid,
	input Rdown,
	input swl,
	input swr,
	input [10:0] Pradius,
	input [10:0] Rradius,
	input [1:0] mode,
	input [10:0] rgoalyhigh ,
	input [10:0] lgoalyhigh ,
	

		
	
	output [9:0] puckX,
	output [8:0] puckY,
	output [4:0] puckstate,
	
	
	output reg [2:0] GL,
	output reg [2:0] GR
	
	);
	
	reg [4:0] state = 0;
	reg [9:0] puckXreg = 10'b0;
	reg [8:0] puckYreg = 9'b0;
	reg [10:0] ceiling = 10;
	reg [10:0] floor = 470;
	reg [10:0] lwall = 10;
	reg [10:0] rwall = 630;
	reg [10:0] lgoalylow;
	reg [10:0] lgoalx = 15;
	reg [10:0] rgoalylow;
	reg [10:0] rgoalx = 625;
	reg [10:0] cy = 240;
	reg [10:0] cx = 320;
	reg [10:0] Lradius;
	reg [5:0] speedx ;
	reg [5:0] speedy ;
	wire [3:0] Qout; //psuedo-random number
	
	
	ShiftReg r1 (Qout, clk);
	
	
	always @(posedge clk) begin
	lgoalylow = lgoalyhigh+160; //goal length
	rgoalylow = rgoalyhigh+160;
	
	
	
	
	if (space == 0) begin
	state = `SETUP;
	end
	else begin
	
	
	if (puckX - Pradius <= Rx + Rradius &&  puckX + Pradius >= Rx - Rradius && puckY + Pradius >= Ry - Rradius && puckY - Pradius <= Ry + Rradius) begin
        state <= `HR;
    end
    else if (puckX - Pradius <= Lx + Rradius &&  puckX + Pradius >= Lx - Rradius && puckY + Pradius >= Ly - Rradius && puckY - Pradius <= Ly + Rradius) begin
        state <= `HL;
    end
    if (speedx >= 8) begin
    speedx <= 7;
    end
    if (speedy >= 8) begin
    speedy <= 7;
    end




	case (state)
						`SETUP: begin 
							puckXreg <= cx; 
							puckYreg <= cy; 
								state = Qout; 
								speedy <= 1;
								speedx <= 1;
								GL = 0;
								GR = 0;
							end 
						`NW: begin
							puckXreg <= puckXreg - speedx;
							puckYreg <= puckYreg - speedy;
							if (puckY <= ceiling) begin
								if (mode == 0 | mode == 2 | mode == 4 | mode == 6) begin
								state = `SW;
								end
								else if (mode == 1 | mode == 3 | mode == 5 | mode == 7) begin
								puckYreg <= floor - 1;
								end
								speedx <= speedx + 1;
								speedy <= speedy + 1;
							end 
							else if (puckX <= lwall) begin
								if (mode == 0 | mode == 2 | mode == 4 | mode == 6) begin
								state = `NE;
								end
								else if (mode == 1 | mode == 3 | mode == 5 | mode == 7) begin
								puckXreg <= rwall - 1;
								end
								speedx <= speedx + 1;
								speedy <= speedy + 1;
							end 
							
							else if ((puckY <= lgoalylow)&&(puckY >= lgoalyhigh)&&(puckX <= lgoalx)) begin
							GR = GR+1;
							state = `GoalbyR;
							end
							
							else begin
								state = `NW;
							end							
						end
						`NE: begin
							puckXreg <= puckXreg + speedx;
							puckYreg <= puckYreg - speedy;
							state = `NE;
							if (puckY <= ceiling) begin
								if (mode == 0 | mode == 2 | mode == 4 | mode == 6) begin
								state = `SE;
								end
								else if (mode == 1 | mode == 3 | mode == 5 | mode == 7) begin
								puckYreg <= floor - 1;
								end
								speedx <= speedx + 1;
								speedy <= speedy + 1;
							end 
							else if (puckX >= rwall ) begin
								if (mode == 0 | mode == 2 | mode == 4 | mode == 6) begin
								state = `NW;
								end
								else if (mode == 1 | mode == 3 | mode == 5 | mode == 7) begin
								puckXreg <= lwall + 1;
								end
								speedx <= speedx + 1;
								speedy <= speedy + 1;
							end 
							
							else if ((puckY <= rgoalylow)&&(puckY >= rgoalyhigh)&&(puckX >= rgoalx)) begin
							GL = GL+1;
							state = `GoalbyL;
							
							end
							
							else begin
								state = `NE;
							end							
						end
						`SE: begin
							puckXreg <= puckXreg + speedx;
							puckYreg <= puckYreg + speedy;
							state = `SE;
							if (puckY >= floor) begin
								if (mode == 0 | mode == 2 | mode == 4 | mode == 6) begin
								state = `NE;
								end
								else if (mode == 1 | mode == 3 | mode == 5 | mode == 7) begin
								puckYreg <= ceiling + 1;
								end
								speedx <= speedx + 1;
								speedy <= speedy + 1;
							end 
							else if (puckX >= rwall) begin
								if (mode == 0 | mode == 2 | mode == 4 | mode == 6) begin
								state = `SW;
								end
								else if (mode == 1 | mode == 3 | mode == 5 | mode == 7) begin
								puckXreg <= lwall + 1;
								end
								speedx <= speedx + 1;
								speedy <= speedy + 1;
							end 
							
							else if ((puckY <= rgoalylow)&&(puckY >= rgoalyhigh)&&(puckX >= rgoalx)) begin
							GL = GL+1;
							state = `GoalbyL;
							
							end
							
							else begin
								state = `SE;
							end							
						end				
						`SW: begin
							puckXreg <= puckXreg - speedx;
							puckYreg <= puckYreg + speedy;
							state = `SW;
							if (puckY >= floor) begin
								if (mode == 0 | mode == 2 | mode == 4 | mode == 6) begin
								state = `NW;
								end
								else if (mode == 1 | mode == 3 | mode == 5 | mode == 7) begin
								puckYreg <= ceiling + 1;
								end
								speedx <= speedx + 1;
								speedy <= speedy + 1;
							end 
							else if (puckX <= lwall) begin
								if (mode == 0 | mode == 2 | mode == 4 | mode == 6) begin
								state = `SE;
								end
								else if (mode == 1 | mode == 3 | mode == 5 | mode == 7) begin
								puckXreg <= rwall - 1;
								end
								speedx <= speedx + 1;
								speedy <= speedy + 1;
							end 
							
							else if ((puckY <= lgoalylow)&&(puckY >= lgoalyhigh)&&(puckX <= lgoalx)) begin
							GR = GR+1;
							state = `GoalbyR;
							
							end
							
							else begin
								state = `SW;
							end							
						end	
						`E: begin
						
							puckXreg <= puckXreg + speedx;
							state = `E;
							 if (puckXreg >= rwall) begin
								if (mode == 0 | mode == 2 | mode == 4 | mode == 6) begin
								state = `W;
								end
								else if (mode == 1 | mode == 3 | mode == 5 | mode == 7) begin
								puckXreg <= lwall + 1;
								end
								speedx <= speedx + 1;
							end 
							
							else if ((puckY <= rgoalylow)&&(puckY >= rgoalyhigh)&&(puckX >= rgoalx)) begin
							GL = GL+1;
							state = `GoalbyL;
							
							end
							
							else begin
								state = `E;
							end					
						end	
						`W: begin					
	
				
							puckXreg <= puckXreg - speedx;
							state = `W;
							if (puckXreg <= lwall) begin
								if (mode == 0 | mode == 2 | mode == 4 | mode == 6) begin
								state = `E;
								end
								else if (mode == 1 | mode == 3 | mode == 5 | mode == 7) begin
								puckXreg <= rwall - 1;
								end
								speedx <= speedx + 1;
							end 
						
							else if ((puckY <= lgoalylow)&&(puckY >= lgoalyhigh)&&(puckX <= lgoalx)) begin
							GR = GR+1;
							state = `GoalbyR;
							
							end
							
							else begin
								state = `W;
							end					
						end
						`GoalbyR: begin
								state = `HL;
						end
						`GoalbyL: begin
								state = `HR;
						end
						`HR: begin
						puckYreg <= Ry + (Rradius-1);
						puckXreg <= Rx - (2*Rradius);
						speedy <= 2;
						speedx <= 2;
						
						
						if (Rmid) begin
						state = `W;
						end
						else if (Rup) begin
						state = `NW;
						end
						else if (Rdown) begin
						state = `SW;
						end
						else if (swr == 1) begin
						state = `HR2;
						end
						else begin
						state = `HR;
						end
			
						end
						
						`HR2: begin
						puckYreg <= Ry + 1 - (Rradius);
						puckXreg <= Rx - (2*Rradius);
						speedy <= 2;
						speedx <= 2;
						
						
						if (Rmid) begin
						state = `W;
						end
						else if (Rup) begin
						state = `NW;
						end
						else if (Rdown) begin
						state = `SW;
						end
						else if (swr == 0) begin
						state = `HR;
						end
						else begin
						state = `HR2;
						end
						end
						
						`HL: begin
						puckYreg <= Ly + 1 - (Rradius);
						puckXreg <= Lx + (2*Rradius);
						speedy <= 2;
						speedx <= 2;
						
						if (Lmid) begin
						state = `E;
						end
						else if (Lup) begin
						state = `NE;
						end
						else if (Ldown) begin
						state = `SE;
						end
						else if (swl == 1) begin
						state = `HL2;
						end
						else begin
						state = `HL;
						end
						end
						
						`HL2: begin
						puckYreg <= Ly + (Rradius-1);
						puckXreg <= Lx + (2*Rradius);
						speedy <= 2;
						speedx <= 2;

						
						if (Lmid) begin
						state = `E;
						end
						else if (Lup) begin
						state = `NE;
						end
						else if (Ldown) begin
						state = `SE;
						end
						else if (swl == 0) begin
						state = `HL;
						end
						else begin
						state = `HL2;
						end
						end
						
				endcase
				
				
				if(reset)
				state = `SETUP;
				
				
				end
				end
		
	assign puckX = puckXreg;
	assign puckY = puckYreg;
		assign puckstate = state;

	
	
endmodule