 `timescale 1ns/1ps

module decoder2to4 (
    input A,
    input B,
    input Enable,
    output [3:0] Y
);

wire nA, nB;

not (nA, A);
not (nB, B);

and (Y[0], Enable, nA, nB);
and (Y[1], Enable, nA, B);
and (Y[2], Enable, A, nB);
and (Y[3], Enable, A, B);

endmodule
