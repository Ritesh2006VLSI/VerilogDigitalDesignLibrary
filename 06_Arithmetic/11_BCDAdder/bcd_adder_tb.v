`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2026 21:21:21
// Design Name: 
// Module Name: bcd_adder_tb
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


module bcd_adder_tb(
    );
    reg  [3:0] a, b;
    reg cin;
    wire [3:0] sum;
    wire cout;
    bcd_adder uut (.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));
    initial begin
        a = 4'd0; b = 4'd0; cin = 0;
        #10;
        a = 4'd5; b = 4'd3; cin = 0;   // 8
        #10;
        a = 4'd4; b = 4'd5; cin = 0;   // 9
        #10;
        a = 4'd5; b = 4'd7; cin = 0;   // 12
        #10;
        a = 4'd8; b = 4'd8; cin = 0;   // 16
        #10;
        a = 4'd9; b = 4'd9; cin = 0;   // 18
        #10;
        a = 4'd9; b = 4'd0; cin = 1;   // 10
        #10;
        a = 4'd7; b = 4'd8; cin = 1;   // 16
        #10;
        $finish;
    end
    initial begin
        $monitor("a=%d b=%d cin=%b | cout=%b sum=%d | bcd result=%b %b", a, b, cin, cout, sum,{3'b000,cout},sum);
    end
endmodule
