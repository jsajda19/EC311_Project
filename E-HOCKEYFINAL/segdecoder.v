`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2023 11:57:18 AM
// Design Name: 
// Module Name: segdecoder
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


module segdecoder(
    input [3:0] outin,
    input [2:0] state,
    output [6:0] outh0
  
    );
    

reg [6:0] outhex0;


always @(*) begin

case (state)
4:case (outin)                                                                      
        0: outhex0 = 7'b0000001;  //0
        1: outhex0 = 7'b1001111;  //1
        2: outhex0 = 7'b0010010;  //2
        3: outhex0 = 7'b0000110;  //3
        4: outhex0 = 7'b1001100;  //4
        5: outhex0 = 7'b0100100;  //5
        6: outhex0 = 7'b0100000;  //6
        7: outhex0 = 7'b0001111;  //7
        8: outhex0 = 7'b0000000;  //8
        9: outhex0 = 7'b0000100;  //9
       
        10: outhex0 = 7'b0001000;  //A
        11: outhex0 = 7'b1100000;  //b
        12: outhex0 = 7'b0110001;  //C
        13: outhex0 = 7'b1000010;  //d
        14: outhex0 = 7'b0110000;  //E
        15: outhex0 = 7'b0111000;  //F
        
    endcase
5:case (outin)                                                                      
        0: outhex0 = 7'b0000001;  //0
        1: outhex0 = 7'b1001111;  //1
        2: outhex0 = 7'b0010010;  //2
        3: outhex0 = 7'b0000110;  //3
        4: outhex0 = 7'b1001100;  //4
        5: outhex0 = 7'b0100100;  //5
        6: outhex0 = 7'b0100000;  //6
        7: outhex0 = 7'b0001111;  //7
        8: outhex0 = 7'b0000000;  //8
        9: outhex0 = 7'b0000100;  //9
       
        10: outhex0 = 7'b0001000;  //A
        11: outhex0 = 7'b1100000;  //b
        12: outhex0 = 7'b0110001;  //C
        13: outhex0 = 7'b1000010;  //d
        14: outhex0 = 7'b0110000;  //E
        15: outhex0 = 7'b0111000;  //F
        
    endcase
6:case (outin)                                                                      
        0: outhex0 = 7'b0000001;  //0
        1: outhex0 = 7'b1001111;  //1
        2: outhex0 = 7'b0010010;  //2
        3: outhex0 = 7'b0000110;  //3
        4: outhex0 = 7'b1001100;  //4
        5: outhex0 = 7'b0100100;  //5
        6: outhex0 = 7'b0100000;  //6
        7: outhex0 = 7'b0001111;  //7
        8: outhex0 = 7'b0000000;  //8
        9: outhex0 = 7'b0000100;  //9
       
        10: outhex0 = 7'b0001000;  //A
        11: outhex0 = 7'b1100000;  //b
        12: outhex0 = 7'b0110001;  //C
        13: outhex0 = 7'b1000010;  //d
        14: outhex0 = 7'b0110000;  //E
        15: outhex0 = 7'b0111000;  //F
        
    endcase
7:case (outin)                                                                      
        0: outhex0 = 7'b0000001;  //0
        1: outhex0 = 7'b1001111;  //1
        2: outhex0 = 7'b0010010;  //2
        3: outhex0 = 7'b0000110;  //3
        4: outhex0 = 7'b1001100;  //4
        5: outhex0 = 7'b0100100;  //5
        6: outhex0 = 7'b0100000;  //6
        7: outhex0 = 7'b0001111;  //7
        8: outhex0 = 7'b0000000;  //8
        9: outhex0 = 7'b0000100;  //9
       
        10: outhex0 = 7'b0001000;  //A
        11: outhex0 = 7'b1100000;  //b
        12: outhex0 = 7'b0110001;  //C
        13: outhex0 = 7'b1000010;  //d
        14: outhex0 = 7'b0110000;  //E
        15: outhex0 = 7'b0111000;  //F
        
    endcase
default:

    case (outin)
        0: outhex0 = 7'b0000001;  //0
        1: outhex0 = 7'b1001111;  //1
        2: outhex0 = 7'b0010010;  //2
        3: outhex0 = 7'b0000110;  //3
        4: outhex0 = 7'b1001100;  //4
        5: outhex0 = 7'b0100100;  //5
        6: outhex0 = 7'b0100000;  //6
        7: outhex0 = 7'b0001111;  //7
        8: outhex0 = 7'b0000000;  //8
        9: outhex0 = 7'b0000100;  //9
        10: outhex0 = 7'b0001000;  //A
        11: outhex0 = 7'b1100000;  //b
        12: outhex0 = 7'b0110001;  //C
        13: outhex0 = 7'b1000010;  //d
        14: outhex0 = 7'b0110000;  //E
        15: outhex0 = 7'b0111000;  //F
        
    endcase
endcase
end
assign outh0 = outhex0;


endmodule
