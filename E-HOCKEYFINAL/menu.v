`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2023 06:45:06 PM
// Design Name: 
// Module Name: menu
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

//MENU screen
module menu(
    input [9:0] x,
    input [8:0] y,
    input [2:0] mode,
    output reg gameout
    );
   
    reg [5:0] IDH = 8;
    reg [5:0] IDO = 15;
    reg [5:0] IDC = 3;
    reg [5:0] IDK = 11;
    reg [5:0] IDE = 5;
    reg [5:0] IDY = 25;
    reg [5:0] IDM = 13;
    reg [5:0] IDD = 4;
    reg [5:0] IDone = 29;
    reg [5:0] IDtwo = 30;
    reg [5:0] IDthree = 31;
    reg [5:0] IDfour = 32;
    reg [5:0] IDfive = 24;
    reg [5:0] IDsix = 26;
    reg [5:0] IDseven = 27;
    reg [5:0] IDeight = 28;

    reg [5:0] IDDash = 0;
    reg [6:0] wwidth = 60;
    reg [6:0] wheight = 60;
    reg [9:0] xstart1 = 75;
    reg [9:0] xstart2 = 200;
   
    wire outDash, outH, outO, outE1, outC, outK, outE2, outY,outM , outO2 , outD , outE3,outone,outtwo,outthree,outfour,outfive,outsix,outseven,outeight;
   
   
    lettermap E1(.x(x),.y(y),.xstart(xstart1+10),.ystart(200-(wheight/2)),.ID(IDE),.value(outE1),.wwidth(wwidth),.wheight(wheight));
    lettermap Dash(.x(x),.y(y),.xstart(xstart1 + wwidth),.ystart(200-(wheight/2)),.ID(IDDash),.value(outDash),.wwidth(wwidth),.wheight(wheight));
    lettermap H(.x(x),.y(y),.xstart(xstart1 + 2*wwidth),.ystart(200-(wheight/2)),.ID(IDH),.value(outH),.wwidth(wwidth),.wheight(wheight));
    lettermap O(.x(x),.y(y),.xstart(xstart1 + 3*wwidth),.ystart(200-(wheight/2)),.ID(IDO),.value(outO),.wwidth(wwidth),.wheight(wheight));
    lettermap C(.x(x),.y(y),.xstart(xstart1 + 4*wwidth),.ystart(200-(wheight/2)),.ID(IDC),.value(outC),.wwidth(wwidth),.wheight(wheight));
    lettermap K(.x(x),.y(y),.xstart(xstart1 + 5*wwidth),.ystart(200-(wheight/2)),.ID(IDK),.value(outK),.wwidth(wwidth),.wheight(wheight));
    lettermap E2(.x(x),.y(y),.xstart(xstart1 + 6*wwidth),.ystart(200-(wheight/2)),.ID(IDE),.value(outE2),.wwidth(wwidth),.wheight(wheight));
    lettermap Y(.x(x),.y(y),.xstart(xstart1 + 7*wwidth),.ystart(200-(wheight/2)),.ID(IDY),.value(outY),.wwidth(wwidth),.wheight(wheight));
    lettermap M(.x(x),.y(y),.xstart(xstart2),.ystart(430-(2*wheight)),.ID(IDM),.value(outM),.wwidth(wwidth),.wheight(wheight));
    lettermap O2(.x(x),.y(y),.xstart(xstart2 + wwidth+10),.ystart(430-(2*wheight)),.ID(IDO),.value(outO2),.wwidth(wwidth),.wheight(wheight));
    lettermap D(.x(x),.y(y),.xstart(xstart2 + (2*wwidth)),.ystart(430-(2*wheight)),.ID(IDD),.value(outD),.wwidth(wwidth),.wheight(wheight));
    lettermap E3(.x(x),.y(y),.xstart(xstart2 + (3*wwidth)-10),.ystart(430-(2*wheight)),.ID(IDE),.value(outE3),.wwidth(wwidth),.wheight(wheight));
    
    lettermap one(.x(x),.y(y),.xstart(xstart2 + (4*wwidth)),.ystart(430-(2*wheight)),.ID(IDone),.value(outone),.wwidth(wwidth),.wheight(wheight));
    lettermap two(.x(x),.y(y),.xstart(xstart2 + (4*wwidth)),.ystart(430-(2*wheight)),.ID(IDtwo),.value(outtwo),.wwidth(wwidth),.wheight(wheight));
    lettermap three(.x(x),.y(y),.xstart(xstart2 + (4*wwidth)),.ystart(430-(2*wheight)),.ID(IDthree),.value(outthree),.wwidth(wwidth),.wheight(wheight));
    lettermap four(.x(x),.y(y),.xstart(xstart2 + (4*wwidth)),.ystart(430-(2*wheight)),.ID(IDfour),.value(outfour),.wwidth(wwidth),.wheight(wheight));
    lettermap five(.x(x),.y(y),.xstart(xstart2 + (4*wwidth)),.ystart(430-(2*wheight)),.ID(IDfive),.value(outfive),.wwidth(wwidth),.wheight(wheight));
    lettermap six(.x(x),.y(y),.xstart(xstart2 + (4*wwidth)),.ystart(430-(2*wheight)),.ID(IDsix),.value(outsix),.wwidth(wwidth),.wheight(wheight));
    lettermap seven(.x(x),.y(y),.xstart(xstart2 + (4*wwidth)),.ystart(430-(2*wheight)),.ID(IDseven),.value(outseven),.wwidth(wwidth),.wheight(wheight));
    lettermap eight(.x(x),.y(y),.xstart(xstart2 + (4*wwidth)),.ystart(430-(2*wheight)),.ID(IDeight),.value(outeight),.wwidth(wwidth),.wheight(wheight));

   
   // chooses mode number to be output by vga
    always @ (x,y) begin
        if (mode == 0) begin
       gameout = outE1 + outDash + outH + outO + outC + outK + outE2 + outY + outM + outO2 + outD + outE3 + outone;
        end
        if (mode == 1) begin
        gameout = outE1 + outDash + outH + outO + outC + outK + outE2 + outY + outM + outO2 + outD + outE3 + outtwo;
        end
        if (mode == 2) begin
        gameout = outE1 + outDash + outH + outO + outC + outK + outE2 + outY + outM + outO2 + outD + outE3 + outthree;
        end
        if (mode == 3) begin
        gameout = outE1 + outDash + outH + outO + outC + outK + outE2 + outY + outM + outO2 + outD + outE3 + outfour;
        end
        if (mode == 4) begin
        gameout = outE1 + outDash + outH + outO + outC + outK + outE2 + outY + outM + outO2 + outD + outE3 + outfive;
        end
        if (mode == 5) begin
        gameout = outE1 + outDash + outH + outO + outC + outK + outE2 + outY + outM + outO2 + outD + outE3 + outsix;
        end
        if (mode == 6) begin
        gameout = outE1 + outDash + outH + outO + outC + outK + outE2 + outY + outM + outO2 + outD + outE3 + outseven;
        end
        if (mode == 7) begin
        gameout = outE1 + outDash + outH + outO + outC + outK + outE2 + outY + outM + outO2 + outD + outE3 + outeight;
        end
    end
   
endmodule
