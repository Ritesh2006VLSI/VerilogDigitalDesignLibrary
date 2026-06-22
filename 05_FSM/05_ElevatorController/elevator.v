`timescale 1ns / 1ps

module elevator(
    input clk, rst,
    input req_here, req_above, req_below,
    input arrived,
    input timer_done,
    input door_fully_opened, door_fully_closed, door_blocked,
    input overload,
    input emergency,
    input [1:0] current_floor,
    output reg door_close, door_open,
    output reg move_up, move_down,
    output reg alarm
);
    
    localparam IDLE = 3'd0, MOVING_UP = 3'd1, MOVING_DOWN = 3'd2, 
               DOOR_OPENING = 3'd3, DOOR_CLOSING = 3'd4, DOOR_OPEN = 3'd5, 
               EMERGENCY_STATE = 3'd6;
               
    reg [2:0] state, next_state;
    reg curr_direction ;
    
    always @(posedge clk or posedge rst) begin
        if(rst) begin
            state <= IDLE;
            curr_direction <= 1'b1;
        end
        else begin  
            state <= next_state;
            if (next_state == MOVING_UP)        curr_direction <= 1'b1;
            else if (next_state == MOVING_DOWN) curr_direction <= 1'b0;
            end
    end
    
    always @(*) begin
        case(state)
            IDLE : begin
                if(emergency && current_floor != 2'd0)      next_state = MOVING_DOWN;
                else if(emergency && current_floor == 2'd0) next_state = DOOR_OPENING;
                else if(req_here)                           next_state = DOOR_OPENING;
                else if(curr_direction == 1'b1) begin
                    if(req_above)       next_state = MOVING_UP;
                    else if(req_below)  next_state = MOVING_DOWN;
                    else                next_state = IDLE;
                end
                else begin 
                    if(req_below)       next_state = MOVING_DOWN;
                    else if(req_above)  next_state = MOVING_UP;
                    else                next_state = IDLE;
                end
            end
            MOVING_UP : begin
                if(emergency)       next_state = IDLE; 
                else if(arrived)    next_state = DOOR_OPENING;
                else                next_state = MOVING_UP;
            end
            MOVING_DOWN : begin
                if(emergency && current_floor == 2'd0)  next_state = DOOR_OPENING;
                else if(!emergency && arrived)          next_state = DOOR_OPENING;
                else                                    next_state = MOVING_DOWN;
            end
            DOOR_OPENING : begin
                if(door_fully_opened) begin
                    if(emergency)   next_state = EMERGENCY_STATE;
                    else            next_state = DOOR_OPEN;
                end
                else next_state = DOOR_OPENING;
            end
            DOOR_CLOSING : begin
                if(door_fully_closed) begin
                    if(emergency && current_floor != 2'd0)      next_state = MOVING_DOWN;
                    else if(emergency && current_floor == 2'd0) next_state = DOOR_OPENING;
                    else                                        next_state = IDLE;
                end
                else if(!emergency && (door_blocked || req_here)) next_state = DOOR_OPENING;
                else next_state = DOOR_CLOSING;
            end
            DOOR_OPEN : begin
                if(emergency && current_floor == 2'd0)  next_state = EMERGENCY_STATE; 
                else if(emergency)                      next_state = DOOR_CLOSING;
                else if(overload)                       next_state = DOOR_OPEN;    
                else if(!door_blocked && timer_done)    next_state = DOOR_CLOSING;
                else                                    next_state = DOOR_OPEN;
            end
            EMERGENCY_STATE : begin
                if(!emergency)  next_state = DOOR_CLOSING;
                else            next_state = EMERGENCY_STATE;
            end        
            default : next_state = IDLE;                
        endcase
    end 
    
    always @(*) begin
        door_close = 0; door_open = 0; move_up = 0; move_down = 0;        
        alarm = emergency || (state == EMERGENCY_STATE) || overload;   
        case(state)
            MOVING_UP : begin
                move_up = 1;
            end
            MOVING_DOWN : begin
                move_down = 1;
            end
            DOOR_OPENING : begin
                door_open = 1;
            end
            DOOR_CLOSING : begin
                door_close = 1;
            end
            EMERGENCY_STATE : begin
                door_close = 0; door_open = 0; move_up = 0; move_down = 0; 
            end
            default : begin 
                door_close = 0; door_open = 0; move_up = 0; move_down = 0; 
            end
        endcase
    end
    
endmodule


module scheduler(
    input clk, rst,
    input [3:0] floor,
    input [1:0] current_floor,
    input door_open,
    input emergency,
    output reg req_here, req_above, req_below, arrived
);

    reg [3:0] pending_requests;
    wire [3:0] clear_mask;

    assign clear_mask = door_open ? (4'b0001 << current_floor) : 4'b0000;
    
    always @(posedge clk or posedge rst) begin
        if(rst) 
            pending_requests <= 4'd0;
        else if(emergency)
            pending_requests <= 4'd0; 
        else 
            pending_requests <= (pending_requests | floor) & ~clear_mask;
    end
    
    always @(*) begin
        req_here = 0; req_above = 0; req_below = 0; arrived = 0;    
        req_here = pending_requests[current_floor];
        arrived = req_here;
        case(current_floor)
            2'd0 : begin
                req_above = pending_requests[1] | pending_requests[2] | pending_requests[3];
            end
            2'd1 : begin
                req_below = pending_requests[0];
                req_above = pending_requests[2] | pending_requests[3];
            end
            2'd2 : begin
                req_below = pending_requests[0] | pending_requests[1];
                req_above = pending_requests[3];
            end
            2'd3 : begin
                req_below = pending_requests[0] | pending_requests[1] | pending_requests[2];
            end
        endcase
    end
    
endmodule

module elevator_system(
    input clk, rst,
    input [3:0] floor,
    input [1:0] current_floor,
    input timer_done,
    input door_fully_closed, door_fully_opened, door_blocked,
    input emergency,
    input overload,
    output door_close, door_open,
    output move_up, move_down,
    output alarm
);

    wire req_here, req_above, req_below, arrived;

    scheduler schedule(
        .clk(clk), .rst(rst),
        .floor(floor), .current_floor(current_floor),
        .door_open(door_open), 
        .emergency(emergency),
        .req_here(req_here), .req_above(req_above), .req_below(req_below), .arrived(arrived)
    );
                       
    elevator controller(
        .clk(clk), .rst(rst),
        .req_here(req_here), .req_above(req_above), .req_below(req_below), .arrived(arrived),
        .timer_done(timer_done), .door_fully_opened(door_fully_opened), .door_fully_closed(door_fully_closed), .door_blocked(door_blocked),
        .overload(overload),.emergency(emergency), .current_floor(current_floor),
        .door_close(door_close), .door_open(door_open),
        .move_up(move_up), .move_down(move_down),
        .alarm(alarm)
    );

endmodule