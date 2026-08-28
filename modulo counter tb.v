module tb;

reg clk,reset;
reg [3:0] N;
wire [3:0] count;

modulo_counter uut(clk,reset,N,count);

always #5 clk=~clk;

initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    clk=0;
    reset=1;
    N=10;

    #10 reset=0;

    #100;

    N=5;

    #60;

    $finish;
end

endmodule
