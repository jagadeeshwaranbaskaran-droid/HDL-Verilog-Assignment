`timescale 1ns/1ps

module tb_decoder2to4;

reg A, B, Enable;
wire [3:0] Y;

decoder2to4 dut (
    .A(A),
    .B(B),
    .Enable(Enable),
    .Y(Y)
);

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_decoder2to4);

    $monitor("Time=%0t | Enable=%b A=%b B=%b | Y=%b",
             $time, Enable, A, B, Y);

    Enable = 0;
    A = 0;
    B = 0;
    #10;

    Enable = 1;

    {A, B} = 2'b00; #10;
    {A, B} = 2'b01; #10;
    {A, B} = 2'b10; #10;
    {A, B} = 2'b11; #10;

    $finish;
end

endmodule
