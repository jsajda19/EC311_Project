`timescale 1s / 1s
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:28:31 11/27/2017 
// Design Name: 
// Module Name:    Cloc_divider 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module clock_divider(
    input in_clk,      // 100 MHz clock period of 10 ns
    output  out_clk 
);
	
	reg[32:0] count = 0;
reg tempclk = 0;
reg [15:0] tempctime = -1;

	
	always @(negedge in_clk)
	begin

		if (count == 499999) begin
		 count <= 0;
		 tempclk <= ~tempclk;
		end
		else begin
		  count <= count + 1;
		end
	end


    assign out_clk = tempclk;
    
    
    always @ (negedge out_clk) begin
    tempctime <= tempctime + 1;
    end
    

endmodule
