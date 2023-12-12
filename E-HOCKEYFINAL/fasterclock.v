`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2023 06:39:57 PM
// Design Name: 
// Module Name: fasterclock
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


module fasterclock(
input in_clk,      // 100 MHz clock period of 10 ns
    output out_clk 
);
	
	reg[32:0] count=0;
reg tempclk=0;

	
	always @(negedge in_clk)
	begin
	
		if (count == 49999) begin
		 count <= 0;
		 tempclk <= ~tempclk;
		end
		else begin
		  count <= count + 1;
		end
	end


    assign out_clk = tempclk;

endmodule