`timescale 1ns / 1ps

module elevator_tb(
    );
    reg clk, rst;
    reg [3:0] floor;
    reg [1:0] current_floor;
    reg timer_done;
    reg door_fully_closed, door_fully_opened, door_blocked;
    reg overload;
    reg emergency;
    
    wire door_close, door_open;
    wire move_up, move_down;
    wire alarm;
    
    elevator_system uut (
        .clk(clk), .rst(rst),
        .floor(floor), .current_floor(current_floor),
        .timer_done(timer_done),
        .door_fully_closed(door_fully_closed), .door_fully_opened(door_fully_opened), .door_blocked(door_blocked),
        .overload(overload), .emergency(emergency),
        .door_close(door_close), .door_open(door_open),
        .move_up(move_up), .move_down(move_down),
        .alarm(alarm)
    );
    always #5 clk = ~clk;
    initial begin
        $display("Floor | UP | DN | OP | CL | Alm | State");
        $display("--------------------------------------------------");
        $monitor("   %d   |  %b |  %b |  %b |  %b |  %b  |  %d", 
                  current_floor, move_up, move_down, door_open, door_close, alarm, uut.controller.state);
    end
    initial begin
        clk = 0;
        rst = 1;
        floor = 4'b0000;
        current_floor = 2'd0;
        timer_done = 0;
        door_fully_closed = 1;
        door_fully_opened = 0;
        door_blocked = 0;
        overload = 0;
        emergency = 0;
        #20 rst = 0;
        #20;
        $display("\n--- SCENARIO 1: Call to Floor 2 ---");
        floor[2] = 1; #10; floor[2] = 0;
        wait(move_up == 1);
        #40 current_floor = 2'd1;
        #40 current_floor = 2'd2;
        wait(door_open == 1);
        #10 door_fully_closed = 0;
        #20 door_fully_opened = 1; 
        #40 timer_done = 1;
        wait(door_close == 1);
        #10 timer_done = 0;
        #10 door_fully_opened = 0;
        #20 door_fully_closed = 1;
        #20;
        $display("\n--- SCENARIO 2: Overload Test at Floor 2 ---");
        floor[2] = 1; #10; floor[2] = 0; 
        wait(door_open == 1);
        #10 door_fully_closed = 0;
        #20 door_fully_opened = 1;
        #10 overload = 1;
        #20 timer_done = 1;
        #50;
        overload = 0; 
        #20;
        wait(door_close == 1);
        #10 timer_done = 0;
        #10 door_fully_opened = 0;
        #20 door_fully_closed = 1;
        #20;
        $display("\n--- SCENARIO 3: Fire Alarm while on Floor 2 ---");
        emergency = 1;
        wait(move_down == 1);
        #40 current_floor = 2'd1;
        #40 current_floor = 2'd0;
        wait(door_open == 1);
        #10 door_fully_closed = 0;
        #20 door_fully_opened = 1;
        floor[3] = 1; 
        timer_done = 1;
        #50; 
        emergency = 0;
        #50;
        $finish;
    end
endmodule
