`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2026 12:19:57
// Design Name: 
// Module Name: parity_checker_tb
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


module parity_checker_tb(

    );
    reg [3:0] data;
    reg parity;
    wire error;
    parity_checker uut(
        .data(data),
        .parity(parity),
        .error(error)
    );
    initial begin
        data = 4'b1010; parity = 0; #10;
        data = 4'b1010; parity = 1; #10;
        $finish;
    end
    initial
        $monitor("data=%b parity=%b error=%b",data, parity, error);
endmodule
