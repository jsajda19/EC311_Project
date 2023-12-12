`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2023 05:40:50 PM
// Design Name: 
// Module Name: GOScreen
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

//GAME OVER screen
module GOScreen(
    input [9:0] x,
    input [8:0] y,
    output reg gameout
    );
   
    reg [5:0] IDG = 7;
    reg [5:0] IDA = 1;
    reg [5:0] IDM = 13;
    reg [5:0] IDE = 5;
    reg [5:0] IDO = 15;
    reg [5:0] IDV = 22;
    reg [5:0] IDR = 18;
    reg [6:0] wwidth = 60;
    reg [6:0] wheight = 60;
    reg [9:0] xstart1 = 210;
    reg [9:0] xstart2 = 227;
   
    wire outA, outG, outM, outE1, outO, outV, outE2, outR;
   
   
    lettermap G(.x(x),.y(y),.xstart(xstart1),.ystart(240-(wheight)),.ID(IDG),.value(outG),.wwidth(wwidth),.wheight(wheight));
    lettermap A(.x(x),.y(y),.xstart(xstart1 + wwidth),.ystart(240-(wheight)),.ID(IDA),.value(outA),.wwidth(wwidth),.wheight(wheight));
    lettermap M(.x(x),.y(y),.xstart(xstart1 + (9*wwidth/5)),.ystart(240-(wheight)),.ID(IDM),.value(outM),.wwidth(wwidth),.wheight(wheight));
    lettermap E1(.x(x),.y(y),.xstart(xstart1 + 3*wwidth),.ystart(240-(wheight)),.ID(IDE),.value(outE1),.wwidth(wwidth),.wheight(wheight));
    lettermap O(.x(x),.y(y),.xstart(xstart2),.ystart(240+(wheight/2)),.ID(IDO),.value(outO),.wwidth(wwidth),.wheight(wheight));
    lettermap V(.x(x),.y(y),.xstart(xstart2 + (4*wwidth/5)),.ystart(240+(wheight/2)),.ID(IDV),.value(outV),.wwidth(wwidth),.wheight(wheight));
    lettermap E2(.x(x),.y(y),.xstart(xstart2 + (8*wwidth/5)),.ystart(240+(wheight/2)),.ID(IDE),.value(outE2),.wwidth(wwidth),.wheight(wheight));
    lettermap R(.x(x),.y(y),.xstart(xstart2 + (2196*wwidth/1000)),.ystart(240+(wheight/2)),.ID(IDR),.value(outR),.wwidth(wwidth),.wheight(wheight));
   
    always @ (x,y) begin
        gameout = outG + outA + outM + outE1 + outO + outV + outE2 + outR;
    end
   
endmodule