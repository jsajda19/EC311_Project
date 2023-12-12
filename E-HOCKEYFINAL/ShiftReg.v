`timescale 1ns / 1ps


module ShiftReg(Qout, clk);

	input clk;
	output [3:0] Qout;
	reg [2:0] Q = 3'b000;

	always @ (posedge clk) begin
		if (Q<6)
		  Q <= Q + 1;
		else if (Q == 6)
		  Q <= 0;
	
	end

	assign Qout = Q;

endmodule