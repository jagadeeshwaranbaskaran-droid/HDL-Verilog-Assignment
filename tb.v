`timescale 1ns/1ps

module tb_mux2to1;

reg I0, I1, S;
wire Y;

mux2to1 dut (
    .I0(I0),
    .I1(I1),
    .S(S),
    .Y(Y)
);

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_mux2to1);

    $monitor("Time=%0t | I0=%b I1=%b S=%b | Y=%b",
             $time, I0, I1, S, Y);

    I0=0; I1=0; S=0;
    #10 I0=0; I1=1; S=0;
    #10 I0=0; I1=1; S=1;
    #10 I0=1; I1=0; S=0;
    #10 I0=1; I1=0; S=1;
    #10 I0=1; I1=1; S=0;
    #10 I0=1; I1=1; S=1;

    #10 $finish;
end

endmodule
