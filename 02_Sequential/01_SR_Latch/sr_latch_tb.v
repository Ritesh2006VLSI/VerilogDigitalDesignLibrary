`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2026 15:16:35
// Design Name: 
// Module Name: sr_latch_tb
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


module sr_latch_tb(

    );
    reg S, R;
    wire Q, Qbar;

    sr_latch_behavioural uut(
        .s(S),
        .r(R),
        .q(Q),
        .qbar(Qbar)
    );
    
    /*sr_latch_theory uut(
        .s(S),
        .r(R),
        .q(Q),
        .qbar(Qbar)
    );*/

    initial
    begin
        $monitor("S=%b R=%b Q=%b Qbar=%b",
              S,R,Q,Qbar);

        S=0; R=0; #10; // Hold
        S=1; R=0; #10; // Set
        S=0; R=0; #10; // Hold
        S=0; R=1; #10; // Reset
        S=0; R=0; #10; // Hold
        S=1; R=1; #10; // Invalid

        $finish;
    end
endmodule
