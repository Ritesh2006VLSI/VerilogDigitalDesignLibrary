`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.06.2026 11:24:52
// Design Name: 
// Module Name: logic_gates_tb
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


module logic_gates_tb(

    );
    reg a,b;
    wire out_and,out_or,out_xor,out_not;
    logic_gates uut (
        .a(a),
        .b(b),
        .out_and(out_and),
        .out_or(out_or),
        .out_xor(out_xor),
        .out_not(out_not)
    );
    initial begin
        $monitor("a=%b b=%b AND=%b OR=%b XOR=%b NOT=%b",
                  a,b,out_and,out_or,out_xor,out_not);

        a=0; b=0; #10;
        a=0; b=1; #10;
        a=1; b=0; #10;
        a=1; b=1; #10;

        $finish;
    end
endmodule
