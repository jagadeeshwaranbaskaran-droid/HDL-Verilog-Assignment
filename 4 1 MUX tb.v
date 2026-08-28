`timescale 1ns/1ps

module tb_mux4to1;

reg I0, I1, I2, I3;
reg S1, S0;
wire Y;

mux4to1 dut (
    .I0(I0),
    .I1(I1),
    .I2(I2),
    .I3(I3),
    .S1(S1),
    .S0(S0),
    .Y(Y)
);

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_mux4to1);

    $monitor("Time=%0t | I=%b%b%b%b | S=%b%b | Y=%b",
             $time, I3, I2, I1, I0, S1, S0, Y);

    I0=0; I1=1; I2=0; I3=1;

    S1=0; S0=0;
    #10 S1=0; S0=1;
    #10 S1=1; S0=0;
    #10 S1=1; S0=1;

    #10 $finish;
end

endmodule
