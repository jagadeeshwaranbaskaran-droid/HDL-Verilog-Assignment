`timescale 1ns/1ps

module tb_half_adder;

reg A, B;
wire Sum, Carry;

half_adder dut (
    .A(A),
    .B(B),
    .Sum(Sum),
    .Carry(Carry)
);

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_half_adder);

    $monitor("Time=%0t | A=%b B=%b | Sum=%b Carry=%b",
             $time, A, B, Sum, Carry);

    A = 0; B = 0;
    #10 A = 0; B = 1;
    #10 A = 1; B = 0;
    #10 A = 1; B = 1;

    #10 $finish;
end

endmodule
