`timescale 1ns/1ps

module half_subtractor (
    input A,
    input B,
    output Diff,
    output Borrow
);

xor (Diff, A, B);
and (Borrow, ~A, B);

endmodule
