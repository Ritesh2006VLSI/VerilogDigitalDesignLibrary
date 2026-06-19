`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2026 09:50:09
// Design Name: 
// Module Name: overlapping_mealy
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


module overlapping_mealy(
    input clk,rst,
    input x,
    output reg y
    );
    reg [1:0]state,next_state;
    parameter  A = 2'b00 , B = 2'b01 , C = 2'b10 , D = 2'b11 ;
    always@(posedge clk or posedge rst)begin
        if(rst) state <= A ;
        else state <= next_state;
    end
    always@(*)begin
        case(state)
            A : next_state = x ? B : A ;
            B : next_state = x ? B : C ;
            C : next_state = x ? D : A ;
            D : next_state = x ? B : C ;
            default : next_state = A ;
        endcase
    end
    always@(*)begin
        case(state)
            A : y = 0 ;
            B : y = 0 ;
            C : y = 0 ;
            D : y = x ? 1 : 0 ;
            default : y = 0 ;
        endcase
    end
endmodule
