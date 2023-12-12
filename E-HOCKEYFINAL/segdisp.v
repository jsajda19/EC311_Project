`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2023 11:51:38 AM
// Design Name: 
// Module Name: segdisp
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


module segdisp(
        input clock,
        input [2:0] score2,
        input [2:0] score1,
        output [6:0] cathode,
        output [7:0] anode
    );
    reg rst=1;
    reg [7:0] tanode; 
    reg [3:0] four_bit_number;

   
    reg [2:0] state=0; // initializes state
    wire [6:0] outseg;
    wire [6:0] outht;  
    
    always @(posedge clock)
	begin
	
	if(rst) begin
	state = 0;
	rst = 0;
	tanode = 8'b11111111;
	
	end
		
		
		if (state == 0) begin
		tanode = 8'b11111110;
		four_bit_number = score2;
		
		end
		else if (state == 1) begin
		tanode = 8'b11111111;
		end
		else if (state == 2) begin
		tanode = 8'b11111111;
		end
		else if (state == 3) begin
		tanode = 8'b11111111;
		end
		else if (state == 4) begin
		tanode = 8'b11111111;
		
		end
		else if (state == 5) begin
		tanode = 8'b11111111;
		end
		else if (state == 6) begin
		tanode = 8'b11111111;
		end
		else if (state == 7) begin
		tanode = 8'b01111111;
		four_bit_number = score1;
	
		end
	state = state + 1;
	if (state > 7) begin
		state = 0;
		end
	
	
	end
	
     segdecoder d1(.outin(four_bit_number), .state(state), .outh0(outseg));
     assign cathode = outseg;
     assign anode = tanode;
endmodule