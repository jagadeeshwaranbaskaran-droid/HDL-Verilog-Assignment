module tb;

reg [7:0] A,B;
reg add_sub;
wire [7:0] Y;

saturating_arithmetic uut(A,B,add_sub,Y);

initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    A=200; B=100; add_sub=0; #10;
    A=50; B=100; add_sub=1; #10;
    A=100; B=50; add_sub=1; #10;

    $finish;
end

endmodule
