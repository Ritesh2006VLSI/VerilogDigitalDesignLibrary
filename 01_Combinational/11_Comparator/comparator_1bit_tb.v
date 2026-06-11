`timescale 1ns / 1ps


module comparator_1bit_tb(

    );
    reg A,B;
    wire G,E,L;
    comparator_1bit uut(.A(A),.B(B),.G(G),.E(E),.L(L));
    initial begin
        $monitor("A=%b B=%b G=%b E=%b L=%b",A,B,G,E,L);
             A=0 ; B=0 ;
        #10  A=0 ; B=1 ;
        #10  A=1 ; B=0 ;
        #10  A=1 ; B=1 ;
        #10 $finish;    
    end
endmodule
