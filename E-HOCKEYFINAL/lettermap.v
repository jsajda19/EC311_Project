

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 12/06/2023 11:55:45 AM
// Design Name:
// Module Name: lettermap
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

//module that maps letters for ease of positioning and sizing
module lettermap(
input [6:0]wheight,
input [6:0]wwidth,
input [9:0]xstart,
input [8:0]ystart,
input [9:0]x,
input [8:0]y,
input [5:0]ID,
output reg value

    );
   
    wire A1, A2, A3, A4, V1, V2, V3,K1,K2,K3,K4,M1,M2,M3,M4,M5,Y1,Y2,Y3,D1,D2,D3,D4,one1,one2,one3,two1,two2,two3,two4,two5,three1,three2,three3,three4,four1,four2,four3;
    wire E1,E2,E3,E4,dash,B1,B2,B3,B4,B5,B6,U1,U2,U3,H1,H2,H3,O1,O2,O3,O4,C1,C2,C3,G1,G2,G3,G4,G5,R1,R2,R3,R4,R5,five1,five2,five3,five4,five5,six1,six2,six3,six4,six5,seven1,seven2,eight1,eight2,eight3,eight4,eight5;
   
   
   
   
   //Letter-mapping
    assign E1 = ((x > xstart) & (y > ystart) & (x < (xstart+(wwidth/5))) & (y < ystart + wheight)) ? 1 : 0;
    assign E2 = ((x >= xstart+(wwidth/5)) & (y > ystart) & (x < xstart+(2*wwidth/5)) & (y < ystart+(wheight/5))) ? 1 : 0;
    assign E3 = ((x >= xstart+(wwidth/5)) & (y > ystart+(2*wheight/5)) & (x < xstart+(2*wwidth/5)) & (y < ystart+(3*wheight/5))) ? 1 : 0;
    assign E4 = ((x >= xstart+(wwidth/5)) & (y > ystart+(4*wheight/5)) & (x < xstart+(2*wwidth/5)) & (y < ystart+wheight)) ? 1 : 0;
   
   
    assign dash = ((x > xstart+(wwidth/5)) & (y > ystart+(2*wheight/5)) & (x < (xstart+(4*wwidth/5))) & (y < ystart +(3*wheight/5))) ? 1 : 0;
   
   
    assign B1 = ((x > xstart) & (y > ystart) & (x < (xstart+(wwidth/5))) & (y < ystart + wheight)) ? 1 : 0;
    assign B2 = ((x >= xstart+(wwidth/5)) & (y > ystart) & (x < xstart+(3*wwidth/5)) & (y < ystart+(wheight/5))) ? 1 : 0;
    assign B3 = ((x >= xstart+(wwidth/5)) & (y > ystart+(4*wheight/5)) & (x < xstart+(3*wwidth/5)) & (y < ystart+(wheight))) ? 1 : 0;
    assign B4 = ((x >= xstart+(wwidth/5)) & (y > ystart+(2*wheight/5)) & (x < xstart+(2*wwidth/5)) & (y < ystart+(3*wheight/5))) ? 1 : 0;
    assign B5 = ((x >= xstart+(2*wwidth/5)) & (y >= ystart+(wheight/5)) & (x < (xstart+(3*wwidth/5))) & (y <= ystart+2+(2*wheight/5))) ? 1 : 0;
    assign B6 = ((x >= xstart+(2*wwidth/5)) & (y >= ystart+(3*wheight/5)-2) & (x < xstart+(3*wwidth/5)) & (y <= ystart+(4*wheight/5))) ? 1 : 0;
   
   
    assign U1 = ((x > xstart) & (y > ystart) & (x < (xstart+(wwidth/5))) & (y < ystart + wheight)) ? 1 : 0;
    assign U2 = ((x > xstart+(2*wwidth/5)) & (y > ystart) & (x < (xstart+(3*wwidth/5))) & (y < ystart + wheight)) ? 1 : 0;
    assign U3 = ((x >= xstart+(wwidth/5)) & (y > ystart+(4*wheight/5)) & (x <= (xstart+(2*wwidth/5))) & (y < ystart + wheight)) ? 1 : 0;
   
   
    assign K1 = ((x > xstart) & (x < xstart + (wwidth / 5)) & (y > ystart) & (y < ystart + wheight)) ? 1 : 0;
    assign K2 = ((x > xstart + (wwidth/5)) & (x < xstart + ((2*wwidth)/5)) & (y > ystart + ((2*wheight) / 5)) & (y < ystart + ((3*wheight) / 5))) ? 1 : 0;
    assign K3 = ((x > xstart + ((2*wwidth)/5)) & ((x < xstart + ((3*wwidth)/5)) & (y > ystart) & (y < ystart + ((2*wheight) / 5)))) ? 1 : 0;
    assign K4 = ((x > xstart + ((2*wwidth)/5)) & ((x < xstart + ((3*wwidth)/5))) & (y > ystart + ((3*wheight)/5)) & (y < ystart + wheight)) ? 1 : 0;

    assign M1 = ((x > xstart) & (x < xstart + (wwidth/5)) & (y > ystart) & (y < ystart + wheight)) ? 1 : 0;
    assign M2 = ((x > xstart + (wwidth/5)) & (x < xstart + (2*wwidth/5)) & (y > ystart + (wheight/5)) & (y < ystart + (2*wheight/5))) ? 1 : 0;
    assign M3 = ((x > xstart + (2*wwidth/5)) & (x < xstart + (3*wwidth/5)) & (y > ystart + (2*wheight/5)) & (y < ystart + (3*wheight/5))) ? 1 : 0;
    assign M4 = ((x > xstart + (3*wwidth/5)) & (x < xstart + (4*wwidth/5)) & (y > ystart + (wheight/5)) & (y < ystart + (2*wheight/5))) ? 1 : 0;
    assign M5 = ((x > xstart + (4*wwidth/5)) & (x < xstart + wwidth) & (y > ystart) & (y < ystart + wheight)) ? 1 : 0;


    assign Y1 = ((x > xstart) & (x < xstart + (wwidth/5)) & (y > ystart) & (y < ystart + (2*wwidth/5))) ? 1 : 0;
    assign Y2 = ((x > xstart + (wwidth/5)) & (x < xstart + (2*wwidth/5)) & (y > ystart + (wheight/5)) & (y < ystart + wheight)) ? 1 : 0;
    assign Y3 = ((x > xstart + (2*wwidth/5)) & (x < xstart + (3 * wwidth/5)) & (y > ystart) & (y < ystart + (2*wwidth/5))) ? 1 : 0;
   
   
   
    assign H1 = ((y > ystart) & (y < ystart + (wheight)) & (x > xstart) & (x < xstart + (wwidth/5))) ? 1 : 0;
assign H2 = ((y > ystart) & (y < ystart + (wheight)) & (x > xstart + (2*wwidth/5)) & (x < xstart + (3*wwidth/5))) ? 1 : 0;
assign H3 = ((y > ystart + (2*wheight/5)) & (y < ystart +(3*wheight/5)) & (x > xstart + (wwidth/5)) & (x < xstart + (2*wwidth/5))) ? 1 : 0;

assign O1 = ((y > ystart) & (y < ystart + wheight) & (x > xstart) & (x < xstart + (wwidth/5))) ? 1 : 0;
assign O2 = ((y > ystart) & (y < ystart + wheight) & (x > xstart + (2*wwidth/5)) & (x < xstart + (3*wwidth/5))) ? 1 : 0;
assign O3 = ((y > ystart) & (y < ystart + (wheight/5)) & (x > xstart + (wwidth/5)) & (x < xstart + (2*wwidth/5))) ? 1 : 0;
assign O4 = ((y > ystart + (4*wheight/5)) & (y < ystart + wheight) & (x > xstart + (wwidth/5)) & (x < xstart + (2*wwidth/5))) ? 1 : 0;

assign D1 = ((y > ystart) & (y < ystart + wheight) & (x > xstart) & (x < xstart + (wwidth/5))) ? 1 : 0;
assign D2 = ((y > ystart+(wheight/5)) & (y < ystart + (4*wheight/5)) & (x > xstart + (2*wwidth/5)) & (x < xstart + (3*wwidth/5))) ? 1 : 0;
assign D3 = ((y > ystart) & (y < ystart + (wheight/5)) & (x > xstart + (wwidth/5)) & (x < xstart + (2*wwidth/5))) ? 1 : 0;
assign D4 = ((y > ystart + (4*wheight/5)) & (y < ystart + wheight) & (x > xstart + (wwidth/5)) & (x < xstart + (2*wwidth/5))) ? 1 : 0;


 
assign C1 = ((y > ystart) & (y < ystart + wheight) & (x > xstart) & (x < xstart + (wwidth/5))) ? 1 : 0;
assign C2 = ((y > ystart + (4*wheight/5)) & (y < ystart + wheight) & (x > xstart + (wwidth/5)) & (x < xstart + (2*wwidth/5))) ? 1 : 0;
assign C3 = ((y > ystart ) & (y < ystart + (wheight/5)) & (x > xstart + (wwidth/5)) & (x < xstart + (2*wwidth/5))) ? 1 : 0;


assign G1 = ((y > ystart) & (y < ystart + wheight) & (x > xstart) & (x < xstart + (wwidth/5))) ? 1 : 0;
assign G2 = ((y > ystart ) & (y < ystart + (wheight/5)) & (x > xstart + (wwidth/5)) & (x < xstart + (4*wwidth/5))) ? 1 : 0;
assign G3 = ((y > ystart+(4*wheight/5)) & (y < ystart + (wheight)) & (x > xstart + (wwidth/5)) & (x < xstart + (4*wwidth/5))) ? 1 : 0;
assign G4 = ((y > ystart + (2*wheight/5)) & (y < ystart + (4*wheight/5)) & (x > xstart + (3*wwidth/5)) & (x < xstart + (4*wwidth/5))) ? 1 : 0;
assign G5 = ((y > ystart + (2*wheight/5)) & (y < ystart + (3*wheight/5)) & (x > xstart + (2*wwidth/5)) & (x < xstart + (3*wwidth/5))) ? 1 : 0;


assign R1 = ((y > ystart) & (y < ystart + wheight) & (x > xstart) & (x < xstart + (wwidth/5))) ? 1 : 0;
assign R2 = ((y > ystart + (3*wheight/5)) & (y < ystart + wheight) & (x > xstart + (2*wwidth/5)) & (x < xstart + (3*wwidth/5))) ? 1 : 0;
assign R3 = ((y > ystart) & (y < ystart + (wheight/5)) & (x > xstart + (wwidth/5)) & (x < xstart + (2*wwidth/5))) ? 1 : 0;
assign R4 = ((y > ystart + (2*wheight/5)) & (y < ystart + (3*wheight/5)) & (x > xstart + (wwidth/5)) & (x < xstart + (2*wwidth/5))) ? 1 : 0;
assign R5 = ((y > ystart ) & (y < ystart + (2*wheight/5)) & (x > xstart + (2*wwidth/5)) & (x < xstart + (3*wwidth/5))) ? 1 : 0;
   
   
assign one1 = ((y > ystart) & (y < ystart + wheight) & (x > xstart) & (x < xstart + (wwidth/5))) ? 1 : 0;

assign two1 = ((y > ystart) & (y < ystart + (wheight/5)) & (x > xstart) & (x < xstart + (2*wwidth/5))) ? 1 : 0;
assign two2 = ((y > ystart) & (y < ystart + (3*wheight/5)) & (x > xstart + (2*wwidth/5)) & (x < xstart + (3*wwidth/5))) ? 1 : 0;
assign two3 = ((y > ystart + (2*wheight/5)) & (y < ystart + (3*wheight/5)) & (x > xstart) & (x < xstart + (2*wwidth/5))) ? 1 : 0;
assign two4 = ((y > ystart+(3*wheight/5)) & (y < ystart + wheight) & (x > xstart) & (x < xstart + (wwidth/5))) ? 1 : 0;
assign two5 = ((y > ystart + (4*wheight/5)) & (y < ystart + wheight) & (x > xstart + (wwidth/5)) & (x < xstart + (3*wwidth/5))) ? 1 : 0;

 assign three1 = ((x > xstart + (wwidth/5)) & (y > ystart) & (x < (xstart+(2*wwidth/5))) & (y < ystart + wheight)) ? 1 : 0;
 assign three2 = ((x >= xstart) & (y > ystart) & (x < xstart+(wwidth/5)) & (y < ystart+(wheight/5))) ? 1 : 0;
 assign three3 = ((x >= xstart) & (y > ystart+(2*wheight/5)) & (x < xstart+(wwidth/5)) & (y < ystart+(3*wheight/5))) ? 1 : 0;
 assign three4 = ((x >= xstart) & (y > ystart+(4*wheight/5)) & (x < xstart+(wwidth/5)) & (y < ystart+wheight)) ? 1 : 0;
   
 assign four1 = ((x > xstart) & (x < xstart + (wwidth/5)) & (y > ystart) & (y < ystart + (3*wwidth/5))) ? 1 : 0;
 assign four2 = ((x > xstart + (wwidth/5)) & (x < xstart + (2*wwidth/5)) & (y > ystart + (2*wheight/5)) & (y < ystart + (3*wheight/5))) ? 1 : 0;
 assign four3 = ((x > xstart + (2*wwidth/5)) & (x < xstart + (3 * wwidth/5)) & (y > ystart) & (y < ystart + (wheight))) ? 1 : 0;
   


assign five1 = ((y > ystart) & (y < ystart + (wheight/5)) & (x > xstart+(wwidth/5)) & (x < xstart + (3*wwidth/5))) ? 1 : 0;
assign five2 = ((y > ystart) & (y < ystart + (3*wheight/5)) & (x > xstart ) & (x < xstart + (wwidth/5))) ? 1 : 0;
assign five3 = ((y > ystart + (2*wheight/5)) & (y < ystart + (3*wheight/5)) & (x > xstart +(wwidth/5)) & (x < xstart + (3*wwidth/5))) ? 1 : 0;
assign five4 = ((y > ystart+(3*wheight/5)) & (y < ystart + wheight) & (x > xstart + (2*wwidth/5)) & (x < xstart + (3*wwidth/5))) ? 1 : 0;
assign five5 = ((y > ystart + (4*wheight/5)) & (y < ystart + wheight) & (x > xstart) & (x < xstart + (2*wwidth/5))) ? 1 : 0;

assign six1 = ((x > xstart) & (y > ystart) & (x < (xstart+(wwidth/5))) & (y < ystart + wheight)) ? 1 : 0;
assign six2 = ((x >= xstart+(wwidth/5)) & (y > ystart) & (x < xstart+(3*wwidth/5)) & (y < ystart+(wheight/5))) ? 1 : 0;
assign six3 = ((x >= xstart+(wwidth/5)) & (y > ystart+(2*wheight/5)) & (x < xstart+(2*wwidth/5)) & (y < ystart+(3*wheight/5))) ? 1 : 0;
assign six4 = ((x >= xstart+(wwidth/5)) & (y > ystart+(4*wheight/5)) & (x < xstart+(2*wwidth/5)) & (y < ystart+wheight)) ? 1 : 0;
assign six5 = ((x >= xstart+(2*wwidth/5)) & (y > ystart+(2*wheight/5)) & (x < xstart+(3*wwidth/5)) & (y < ystart+wheight)) ? 1 : 0;


assign seven1 = ((x >= xstart) & (y > ystart) & (x < xstart+(2*wwidth/5)) & (y < ystart+(wheight/5))) ? 1 : 0;
assign seven2 = ((x >= xstart+(2*wwidth/5)) & (y > ystart) & (x < xstart+(3*wwidth/5)) & (y < ystart+wheight)) ? 1 : 0;

assign eight1 = ((x > xstart) & (y > ystart) & (x < (xstart+(wwidth/5))) & (y < ystart + wheight)) ? 1 : 0;
assign eight2 = ((x >= xstart+(wwidth/5)) & (y > ystart) & (x < xstart+(2*wwidth/5)) & (y < ystart+(wheight/5))) ? 1 : 0;
assign eight3 = ((x >= xstart+(wwidth/5)) & (y > ystart+(2*wheight/5)) & (x < xstart+(2*wwidth/5)) & (y < ystart+(3*wheight/5))) ? 1 : 0;
assign eight4 = ((x >= xstart+(wwidth/5)) & (y > ystart+(4*wheight/5)) & (x < xstart+(2*wwidth/5)) & (y < ystart+wheight)) ? 1 : 0;
assign eight5 = ((x >= xstart+(2*wwidth/5)) & (y > ystart) & (x < (xstart+(3*wwidth/5))) & (y < ystart + wheight)) ? 1 : 0;





assign A1 = ((x > xstart) & (y > ystart) & (x < xstart+(wwidth/5)) & (y < (ystart+wheight))) ? 1 : 0;

assign A2 = ((x > xstart+(2*wwidth/5)) & (y > ystart) & (x < xstart+(3*wwidth/5)) & (y < (ystart+wheight))) ? 1 : 0;

assign A3 = ((x > xstart+(wwidth/5)) & (y > ystart) & (x < xstart+(2*wwidth/5)) & (y < ystart+(wheight/5))) ? 1 : 0;

assign A4 = ((x > xstart+(wwidth/5)) & (y > ystart+(2*wheight/5)) & (x < xstart+(2*wwidth/5)) & (y < ystart+(3*wheight/5))) ? 1 : 0;




assign V1 = ((x > xstart) & (y > ystart) & (x < xstart+(wwidth/5)) & (y < (ystart+(4*wheight/5)))) ? 1 : 0;

assign V2 = ((x > xstart+(2*wwidth/5)) & (y > ystart) & (x < xstart+(3*wwidth/5)) & (y < ystart+(4*wheight/5))) ? 1 : 0;

assign V3 = ((x > xstart+(wwidth/5)) & (y > ystart+(4*wheight/5)) & (x < xstart+(2*wwidth/5)) & (y < ystart+wheight)) ? 1 : 0;
   
   
   //Letter selection
    always @(x,y) begin
    case(ID)
    0: value = dash;
    1: value = A1+A2+A3+A4;
    2: value = B1+B2+B3+B4+B5+B6;
    3: value = C1+C2+C3;
    4: value = D1+D2+D3+D4;
    5: value = E1+E2+E3+E4;
//    6:
    7: value = G1+G2+G3+G4+G5;
    8: value = H1+H2+H3;
//    9:
//    10:
    11: value = K1+K2+K3+K4;
//    12:
    13: value = M1+M2+M3+M4+M5;
//    14:
    15: value = O1+O2+O3+O4;
//    16:
//    17:
    18: value = R1+R2+R3+R4+R5;
//    19:
//    20:
    21: value = U1+U2+U3;
    22: value = V1+V2+V3;
//    23:
    24: value = five1+five2+five3+five4+five5;
    25: value = Y1+Y2+Y3;
   26: value = six1+six2+six3+six4+six5;
   27: value = seven1+seven2;
   28: value = eight1+eight2+eight3+eight4+eight5;
   29: value = one1;
    30: value = two1+two2+two3+two4+two5;
    31:  value = three1+three2+three3+three4;
    32: value = four1+four2+four3;
    endcase
end
   
   
   
   
endmodule