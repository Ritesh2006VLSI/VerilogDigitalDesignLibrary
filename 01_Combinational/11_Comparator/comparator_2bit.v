`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.06.2026 06:32:49
// Design Name: 
// Module Name: comparator_2bit
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


module comparator_2bit(
    input [1:0]A,B,
    output reg G,
    output reg E,
    output reg L
    );
    always @(*) begin

        if(A[1] > B[1]) begin
            G=1;
            E=0;
            L=0;
        end

        else if(A[1] < B[1]) begin
            G=0;
            E=0;
            L=1;
        end

        else begin

            if(A[0] > B[0]) begin
                G=1;
                E=0;
                L=0;
            end

            else if(A[0] < B[0]) begin
                G=0;
                E=0;
                L=1;
            end

            else begin
                G=0;
                E=1;
                L=0;
            end
        end
      end
endmodule
