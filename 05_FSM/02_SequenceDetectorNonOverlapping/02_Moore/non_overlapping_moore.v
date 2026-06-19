`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2026 20:48:14
// Design Name: 
// Module Name: non_overlapping_moore
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


module non_overlapping_moore(
    input clk,rst,
    input x,
    output reg y
    );
    reg [2:0]state,next_state;
    parameter A = 3'd0 , B = 3'd1 , C = 3'd2 , D = 3'd3, E = 3'd4 ;
    always@(posedge clk or posedge rst)begin
        if(rst) state <= A ;
        else state <= next_state;
    end
    always@(*)begin
        case(state)
            A : next_state = x ? B : A ;
            B : next_state = x ? B : C ;
            C : next_state = x ? D : A ;
            D : next_state = x ? E : C ;
            E : next_state = x ? A : A ;
            default : next_state = A ;
        endcase
    end
    always@(*)begin
        case(state)
            E : y = 1'b1 ;
            default : y = 1'b0 ;
        endcase
    end
endmodule
