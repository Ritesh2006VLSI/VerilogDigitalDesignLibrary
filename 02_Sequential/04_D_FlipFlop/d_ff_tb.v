`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2026 08:02:33
// Design Name: 
// Module Name: d_ff_tb
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


module d_ff_tb(

    );
    reg d,clk;
    wire q;
    d_ff uut(.d(d),.clk(clk),.q(q));
    always #5 clk = ~clk;
    initial begin
        $monitor("CLK=%b D=%b Q=%b",
              clk,d,q);

        clk = 0;

        d = 0; #10;
        d = 1; #10;
        d = 0; #10;
        d = 1; #10;

        $finish;
    end
endmodule
