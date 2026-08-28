module universal_shift_register(
    input clk,
    input reset,
    input [1:0] mode,
    input [3:0] parallel_in,
    input serial_left,
    input serial_right,
    output reg [3:0] Q
);

always @(posedge clk or posedge reset) begin
    if(reset)
        Q <= 4'b0000;
    else begin
        case(mode)
            2'b00: Q <= Q;                         // Hold
            2'b01: Q <= {serial_right,Q[3:1]};    // Shift right
            2'b10: Q <= {Q[2:0],serial_left};     // Shift left
            2'b11: Q <= parallel_in;              // Parallel load
        endcase
    end
end

endmodule
