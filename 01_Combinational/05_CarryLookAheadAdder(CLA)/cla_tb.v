`timescale 1ns / 1ps
module cla_tb(

    );
    reg  [3:0] A, B;
    reg  Cin;
    wire [3:0] Sum;
    wire Cout;
    cla DUT (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );
    initial begin
        $monitor("A = %b B = %b Cin = %b Sum = %b Cout = %b",
                 A, B, Cin, Sum, Cout);

        // Test Case 1
        A = 4'b0000; B = 4'b0000; Cin = 0;
        #10;

        // Test Case 2
        A = 4'b0011; B = 4'b0101; Cin = 0;
        #10;

        // Test Case 3
        A = 4'b1010; B = 4'b0101; Cin = 0;
        #10;

        // Test Case 4
        A = 4'b1111; B = 4'b0001; Cin = 0;
        #10;

        // Test Case 5
        A = 4'b1111; B = 4'b1111; Cin = 0;
        #10;

        // Test Case 6
        A = 4'b1011; B = 4'b0110; Cin = 1;
        #10;

        $finish;
    end
endmodule
