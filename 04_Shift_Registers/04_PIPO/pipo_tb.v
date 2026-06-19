`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2026 08:29:44
// Design Name: 
// Module Name: pipo_tb
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


module pipo_tb(
    );
    reg clk;
    reg rst;
    reg [3:0] d;
    wire [3:0] q;
    pipo uut(.clk(clk),.rst(rst),.din(d),.q(q));
    always #5 clk = ~clk;
    initial begin
        clk = 0;
        rst = 1;
        d = 4'b0000;
        #10 rst = 0;
        d = 4'b1011;
        #10;
        d = 4'b1100;
        #10;
        d = 4'b0110;
        #10;
        d = 4'b1111;
        #10;
        $finish;
    end
    always @(posedge clk)
    begin
        $display("d=%b q=%b", d, q);
    end
endmodule
