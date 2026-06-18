`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2026 15:58:31
// Design Name: 
// Module Name: s_ff_tb
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


module s_ff_tb(

    );
    reg S, R, CLK;
    wire Q;

    sr_ff uut(
        .s(S),
        .r(R),
        .clk(CLK),
        .q(Q)
    );

    always #5 CLK = ~CLK;

    initial
    begin
        $monitor("CLK=%b S=%b R=%b Q=%b Qbar=%b",
              CLK, S, R, Q, ~Q);
        CLK = 0;

        S=0; R=0; #10;
        S=1; R=0; #10;
        S=0; R=0; #10;
        S=0; R=1; #10;
        S=0; R=0; #10;
        S=1; R=1; #10;

        $finish;
    end
endmodule
