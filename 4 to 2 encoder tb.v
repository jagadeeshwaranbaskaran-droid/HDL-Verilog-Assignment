`timescale 1ns/1ps

module tb_encoder4to2;

reg [3:0] D;
wire [1:0] Y;

encoder4to2 dut (
    .D(D),
    .Y(Y)
);

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_encoder4to2);

    $monitor("Time=%0t | D=%b | Y=%b",
             $time, D, Y);

    D = 4'b0001;
    #10 D = 4'b0010;
    #10 D = 4'b0100;
    #10 D = 4'b1000;

    #10 $finish;
end

endmodule
