`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2026 17:52:21
// Design Name: 
// Module Name: traffic_light
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


module traffic_light#(
    parameter GREEN_MAX = 6'd54,
    parameter CYCLE_MAX = 6'd59
    )(
    input clk, rst,
    input t1, t2, t3, t4,
    input e1, e2, e3, e4, 
    input night_mode,
    output r1, r2, r3, r4,
    output reg g1, g2, g3, g4,
    output reg y1, y2, y3, y4
    );

    reg [5:0] count;
    reg [1:0] side;
    
    reg t_active;
    reg e_active; 
    
    wire side_trigger;
    wire any_traffic;
    wire any_emergency; 
    
    assign any_traffic = (t1 | t2 | t3 | t4);
    assign any_emergency = (e1 | e2 | e3 | e4);

    // Multiplexers (Input Routing)
    always @(*) begin
        case(side)
            2'b00 : begin t_active = t1; e_active = e1; end
            2'b01 : begin t_active = t2; e_active = e2; end
            2'b10 : begin t_active = t3; e_active = e3; end
            2'b11 : begin t_active = t4; e_active = e4; end
            default : begin t_active = t1; e_active = e1; end
        endcase
    end
    
    // Timer State Machine (Datapath)
    always @(posedge clk or posedge rst) begin
        if(rst) count <= 6'd0;
        else if (night_mode) count <= 6'd0;
        else begin
            if(count < GREEN_MAX) begin
                if (any_emergency & ~e_active) begin
                    count <= GREEN_MAX; 
                end
                else if(t_active | e_active) count <= count + 1; 
                else if(any_traffic) count <= GREEN_MAX;
                else count <= count; 
            end
            else if(count < CYCLE_MAX) begin
                count <= count + 1; 
            end
            else count <= 6'd0;
        end
    end

    assign side_trigger = (count == CYCLE_MAX);

    // Side State Machine (Control Logic)
    always @(posedge clk or posedge rst) begin
        if(rst) side <= 2'b00;
        else if(night_mode) side <= 2'b00;
        else if(side_trigger) begin
            if (e1) side <= 2'b00;
            else if (e2) side <= 2'b01;
            else if (e3) side <= 2'b10;
            else if (e4) side <= 2'b11;
            else begin
                case(side)
                    2'b00: begin
                        if(t2) side <= 2'b01;
                        else if(t3) side <= 2'b10;
                        else if(t4) side <= 2'b11;
                        else side <= 2'b00;
                    end
                    2'b01: begin
                        if(t3) side <= 2'b10;
                        else if(t4) side <= 2'b11;
                        else if(t1) side <= 2'b00;
                        else side <= 2'b01;
                    end
                    2'b10: begin
                        if(t4) side <= 2'b11;
                        else if(t1) side <= 2'b00;
                        else if(t2) side <= 2'b01;
                        else side <= 2'b10;
                    end
                    2'b11: begin
                        if(t1) side <= 2'b00;
                        else if(t2) side <= 2'b01;
                        else if(t3) side <= 2'b10;
                        else side <= 2'b11;
                    end
                    default: side <= 2'b00;                    
                endcase
            end
        end
    end
    
    // Output Logic Decoder
    wire is_green, is_yellow;
    assign is_green  = (count <= GREEN_MAX);
    assign is_yellow = (count >= GREEN_MAX + 1 && count <= CYCLE_MAX);
    
    always @(*) begin
        g1 = 0; g2 = 0; g3 = 0; g4 = 0;
        y1 = 0; y2 = 0; y3 = 0; y4 = 0;
        
        if (night_mode) begin
            y1 = clk;
            y2 = clk; 
            y3 = clk;
            y4 = clk;
        end else begin
            case (side)
                2'b00: begin g1 = is_green; y1 = is_yellow; end
                2'b01: begin g2 = is_green; y2 = is_yellow; end
                2'b10: begin g3 = is_green; y3 = is_yellow; end
                2'b11: begin g4 = is_green; y4 = is_yellow; end
            endcase
        end
    end

    assign r1 = night_mode ? 1'b0 : ~(g1 | y1);
    assign r2 = night_mode ? 1'b0  : ~(g2 | y2);
    assign r3 = night_mode ? 1'b0 : ~(g3 | y3);
    assign r4 = night_mode ? 1'b0  : ~(g4 | y4);
    
endmodule