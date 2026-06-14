`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2026 07:41:59
// Design Name: 
// Module Name: full_adder_tb
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


module full_adder_tb(

    );
    reg a,b,cin;
    wire sum,cout;
    full_adder uut(.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));
    initial begin
        $monitor("a=%b b=%b cin=%b sum=%b cout=%b",a,b,cin,sum,cout);
        a = 0 ; b = 0 ; cin = 0 ;
        #10 a = 0 ; b = 0 ; cin = 1 ;
        #10 a = 0 ; b = 1 ; cin = 0 ;
        #10 a = 0 ; b = 1 ; cin = 1 ;
        #10 a = 1 ; b = 0 ; cin = 0 ;
        #10 a = 1 ; b = 0 ; cin = 1 ;
        #10 a = 1 ; b = 1 ; cin = 0 ;
        #10 a = 1 ; b = 1 ; cin = 1 ;
    end
endmodule
