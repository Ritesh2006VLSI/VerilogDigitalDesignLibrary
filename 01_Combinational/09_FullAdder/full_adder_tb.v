`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.06.2026 12:11:15
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
    reg a,b,c_in;
    wire sum,c_out;
    integer i;
    full_adder uut(.a(a),.b(b),.c_in(c_in),.sum(sum),.c_out(c_out));
    initial begin
        $monitor("a=%b b=%b c_in=%b sum=%b c_out=%b",
                  a,b,c_in,sum,c_out);

        for(i=0;i<8;i=i+1) begin
            {a,b,c_in}=i;
            #10;
        end

        $finish;
    end
endmodule
