`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2026 09:01:12
// Design Name: 
// Module Name: adder_subtractor
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

module half_adder(
    input a,b,
    output sum,cout
);
    xor( sum , a ,b );
    and( cout , a , b );
endmodule

module full_adder(
    input a,b,cin,
    output sum,cout
);
    wire s1,c1,c2;
    half_adder h1( a , b , s1 , c1 );
    half_adder h2( s1 , cin , sum , c2 );
    or( cout , c1 , c2 );
endmodule

module adder_subtractor(
    input a,b,c,
    input control,
    output sumdiff,carryborrow
    );
    wire x;
    full_adder f1( a , (b^control) , (c^control) , sumdiff , x );
    assign carryborrow = control ? ~x : x ;
endmodule
