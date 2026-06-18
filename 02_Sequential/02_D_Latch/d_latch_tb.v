`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.06.2026 15:45:05
// Design Name: 
// Module Name: d_latch_tb
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


module d_latch_tb(

    );
    reg D, EN;
    wire Q,Qbar;

    d_latch_theory uut(
        .d(D),
        .en(EN),
        .q(Q),
        .qbar(Qbar)
    );
    
    /*d_latch_behavioral uut(
        .d(D),
        .en(EN),
        .q(Q),
        .qbar(Qbar)
    );
    */

    initial
    begin
        $monitor("D=%b EN=%b Q=%b",
                  D,EN,Q);

        D=0; EN=0; #10;
    
        EN=1; D=1; #10;
        D=0; #10;
        D=1; #10;

        EN=0; #10;

        D=0; #10;
        D=1; #10;

        EN=1; #10;

        $finish;
    end
endmodule
