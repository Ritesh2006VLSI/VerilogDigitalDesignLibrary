`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.06.2026 09:09:17
// Design Name: 
// Module Name: csa
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

module fa(
    input a,b,cin,
    output sum,cout
    );
    assign sum = (a ^ b) ^ cin ;
    assign cout = ( (a ^ b) & cin ) | ( a & b ) ;
endmodule

module csa_base #(parameter N=8)(
    input [N-1:0]a,b,c,
    output [N-1:0]sum,
    output [N-1:0]carry
    );
    genvar i;
    generate 
        for(i=0;i<N;i=i+1) 
        begin : CSA_STAGE

            fa fa_inst(
                .a   (a[i]),
                .b   (b[i]),
                .cin (c[i]),
                .sum (sum[i]),
                .cout(carry[i])
            );

        end
    endgenerate
endmodule

module csa #(parameter N=8)(
    input [N-1:0]a,b,c,d,e,f,g,h,
    output [N+3:0]result
    );
    localparam W = N + 4;
    wire [W-1:0] A,B,C,D,E,F,G,H;
    assign A = {{(W-N){1'b0}},a};
    assign B = {{(W-N){1'b0}},b};
    assign C = {{(W-N){1'b0}},c};
    assign D = {{(W-N){1'b0}},d};
    assign E = {{(W-N){1'b0}},e};
    assign F = {{(W-N){1'b0}},f};
    assign G = {{(W-N){1'b0}},g};
    assign H = {{(W-N){1'b0}},h};
    wire [W-1:0] s1,s2,s3,s4,s5,s6;
    wire [W-1:0] c1,c2,c3,c4,c5,c6;
    csa_base#(W) CSA1(.a(A),.b(B),.c(C),.sum(s1),.carry(c1));
    csa_base#(W) CSA2(.a(D),.b(E),.c(F),.sum(s2),.carry(c2));
    csa_base#(W) CSA3(.a(s1),.b(c1<<1),.c(s2),.sum(s3),.carry(c3));
    csa_base#(W) CSA4(.a(c2<<1),.b(G),.c(H),.sum(s4),.carry(c4));
    csa_base#(W) CSA5(.a(s3),.b(c3<<1),.c(s4),.sum(s5),.carry(c5));
    csa_base#(W) CSA6(.a(c4<<1),.b(s5),.c(c5<<1),.sum(s6),.carry(c6));
    assign result = s6 +( c6 << 1 ) ;
endmodule
