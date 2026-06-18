`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.06.2026 09:37:01
// Design Name: 
// Module Name: csa_tb
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


module csa_tb();

parameter N = 8;

reg  [N-1:0] a,b,c,d,e,f,g,h;
wire [N+3:0] result;

csa #(N) dut(
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .e(e),
    .f(f),
    .g(g),
    .h(h),
    .result(result)
);

initial begin

    // Test Case 1
    a=10; b=13; c=7; d=5;
    e=4;  f=3;  g=2; h=1;
    #10;
    $display("--------------------------------");
    $display("a=%0d b=%0d c=%0d d=%0d",a,b,c,d);
    $display("e=%0d f=%0d g=%0d h=%0d",e,f,g,h);
    $display("Result=%0d Expected=45", result);

    // Test Case 2
    a=1; b=2; c=3; d=4;
    e=5; f=6; g=7; h=8;
    #10;
    $display("--------------------------------");
    $display("a=%0d b=%0d c=%0d d=%0d",a,b,c,d);
    $display("e=%0d f=%0d g=%0d h=%0d",e,f,g,h);
    $display("Result=%0d Expected=36", result);

    // Test Case 3
    a=100; b=50; c=25; d=75;
    e=10;  f=20; g=30; h=40;
    #10;
    $display("--------------------------------");
    $display("a=%0d b=%0d c=%0d d=%0d",a,b,c,d);
    $display("e=%0d f=%0d g=%0d h=%0d",e,f,g,h);
    $display("Result=%0d Expected=350", result);

    // Test Case 4
    a=255; b=255; c=255; d=255;
    e=255; f=255; g=255; h=255;
    #10;
    $display("--------------------------------");
    $display("a=%0d b=%0d c=%0d d=%0d",a,b,c,d);
    $display("e=%0d f=%0d g=%0d h=%0d",e,f,g,h);
    $display("Result=%0d Expected=2040", result);

    // Test Case 5
    a=0; b=0; c=0; d=0;
    e=0; f=0; g=0; h=0;
    #10;
    $display("--------------------------------");
    $display("a=%0d b=%0d c=%0d d=%0d",a,b,c,d);
    $display("e=%0d f=%0d g=%0d h=%0d",e,f,g,h);
    $display("Result=%0d Expected=0", result);

    #10 $finish;

end

endmodule
