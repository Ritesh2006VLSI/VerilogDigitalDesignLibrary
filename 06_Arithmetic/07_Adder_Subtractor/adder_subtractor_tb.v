`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2026 09:16:29
// Design Name: 
// Module Name: adder_subtractor_tb
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


module adder_subtractor_tb(

    );
    reg a,b,c,control;
    wire sumdiff,carryborrow;

    adder_subtractor uut(
        .a(a),
        .b(b),
        .c(c),
        .control(control),
        .sumdiff(sumdiff),
        .carryborrow(carryborrow)
    );

    initial begin
        $monitor("a=%b b=%b c=%b control=%b sumdiff=%b carryborrow=%b",
                  a,b,c,control,sumdiff,carryborrow);

        // Addition (control = 0)
        control = 0;
        a=0; b=0; c=0; #10;
        a=0; b=0; c=1; #10;
        a=0; b=1; c=0; #10;
        a=0; b=1; c=1; #10;
        a=1; b=0; c=0; #10;
        a=1; b=0; c=1; #10;
        a=1; b=1; c=0; #10;
        a=1; b=1; c=1; #10;

        // Subtraction (control = 1)
        control = 1;
        a=0; b=0; c=0; #10;
        a=0; b=0; c=1; #10;
        a=0; b=1; c=0; #10;
        a=0; b=1; c=1; #10;
        a=1; b=0; c=0; #10;
        a=1; b=0; c=1; #10;
        a=1; b=1; c=0; #10;
        a=1; b=1; c=1; #10;

        $finish;
    end
endmodule
