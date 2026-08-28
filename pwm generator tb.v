module tb;

reg clk,reset;
reg [7:0] duty;
wire pwm;

pwm_generator uut(clk,reset,duty,pwm);

always #1 clk=~clk;

initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    clk=0;
    reset=1;
    duty=8'd64;

    #5 reset=0;

    #600;

    duty=8'd128;

    #600;

    duty=8'd192;

    #600;

    $finish;
end

endmodule
