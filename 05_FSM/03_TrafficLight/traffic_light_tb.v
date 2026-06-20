`timescale 1s / 100ms

module tb_traffic_light;

    reg clk, rst;
    reg t1, t2, t3, t4;
    reg e1, e2, e3, e4;
    reg night_mode;

    wire r1, r2, r3, r4;
    wire g1, g2, g3, g4;
    wire y1, y2, y3, y4;

    traffic_light #(
        .GREEN_MAX(6'd10), 
        .CYCLE_MAX(6'd14)
    ) uut (
        .clk(clk), .rst(rst),
        .t1(t1), .t2(t2), .t3(t3), .t4(t4),
        .e1(e1), .e2(e2), .e3(e3), .e4(e4),
        .night_mode(night_mode),
        .r1(r1), .r2(r2), .r3(r3), .r4(r4),
        .g1(g1), .g2(g2), .g3(g3), .g4(g4),
        .y1(y1), .y2(y2), .y3(y3), .y4(y4)
    );

    always #0.5 clk = ~clk;

    initial begin
        clk = 0; rst = 1; 
        t1 = 0; t2 = 0; t3 = 0; t4 = 0;
        e1 = 0; e2 = 0; e3 = 0; e4 = 0;
        night_mode = 0;
        #2 rst = 0;
        t1 = 1; t2 = 1; t3 = 1; t4 = 1;
        #30; 
        e3 = 1; 
        #20;    
        e3 = 0; 
        #15;
        t1 = 0; t2 = 0; t3 = 0; t4 = 0;
        #30; 
        t1 = 1; 
        #20; 
        night_mode = 1;
        #10;
        night_mode = 0;
        #10;
        $finish; 
    end

    initial begin
        $monitor("NightMode=%b | ActiveSide=%b | Timer=%0d | Emer=%b%b%b%b | Traf=%b%b%b%b | Lights(G Y R) S1:%b%b%b S2:%b%b%b S3:%b%b%b S4:%b%b%b", 
                 night_mode, uut.side, uut.count, 
                 e1, e2, e3, e4, 
                 t1, t2, t3, t4, 
                 g1, y1, r1,  g2, y2, r2,  g3, y3, r3,  g4, y4, r4);
    end

endmodule