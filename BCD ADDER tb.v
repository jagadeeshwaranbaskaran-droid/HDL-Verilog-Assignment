module tb;

reg [3:0] A,B;
reg cin;
wire [3:0] sum;
wire cout;

bcd_adder uut(A,B,cin,sum,cout);

initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    A=4; B=5; cin=0; #10;
    A=7; B=8; cin=0; #10;
    A=9; B=9; cin=0; #10;

    $finish;
end

endmodule
