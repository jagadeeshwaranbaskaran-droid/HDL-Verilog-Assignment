module tb;

reg clk,reset;
reg [1:0] mode;
reg [3:0] parallel_in;
reg serial_left,serial_right;
wire [3:0] Q;

universal_shift_register uut(
    clk,reset,mode,parallel_in,
    serial_left,serial_right,Q
);

always #5 clk=~clk;

initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    clk=0;
    reset=1;
    mode=0;
    parallel_in=0;
    serial_left=0;
    serial_right=0;

    #10 reset=0;

    parallel_in=4'b1010;
    mode=2'b11;
    #10;

    serial_right=1;
    mode=2'b01;
    #10;

    serial_left=1;
    mode=2'b10;
    #10;

    $finish;
end

endmodule
