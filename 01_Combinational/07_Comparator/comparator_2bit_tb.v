`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.06.2026 07:40:11
// Design Name: 
// Module Name: comparator_2bit_tb
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


module comparator_2bit_tb(

    );
    reg [1:0] A, B;
    wire G, E, L;

// DUT Instantiation
    comparator_2bit uut (
        .A(A),
        .B(B),
        .G(G),
        .E(E),
        .L(L)
    );

    initial begin

        $monitor("A=%b B=%b G=%b E=%b L=%b",
              A, B, G, E, L);

        // A = B
        A = 2'b00; B = 2'b00; #10;

        // A < B
        A = 2'b00; B = 2'b01; #10;

        // A < B
        A = 2'b01; B = 2'b10; #10;

        // A > B
        A = 2'b10; B = 2'b01; #10;

        // A > B
        A = 2'b11; B = 2'b10; #10;

        // A = B
        A = 2'b11; B = 2'b11; #10;

        $finish;

    end
endmodule
