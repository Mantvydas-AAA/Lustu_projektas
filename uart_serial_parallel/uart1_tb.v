`timescale 1ns/1ps



module SIPO_tb;



    // Inputs

    reg clk;

    reg reset;

    reg serial_in;

    reg shift;



    // Outputs

    wire [7:0] parallel_out;



    // Instantiate the Unit Under Test (UUT)

 uart_8bitserial uut (

    .clk(clk),

    .reset(reset),

    .serial_in(serial_in),

    .shift(shift),

    .parallel_out(parallel_out)

);



    // Clock generation (10 ns period)

    always #5 clk = ~clk;



    initial begin

        // Initialize signals

        clk = 0;

        reset = 1;

        serial_in = 0;

        shift = 0;



        // Apply reset

        #10;

        reset = 0;



        // Test sequence: shift in 8 bits (e.g., 11010110)

        shift = 1;



        serial_in = 1; #10;

        serial_in = 1; #10;

        serial_in = 0; #10;

        serial_in = 1; #10;

        serial_in = 0; #10;

        serial_in = 1; #10;

        serial_in = 1; #10;

        serial_in = 0; #10;



        shift = 0;



        // Wait and observe

        #20;



        // Apply reset again

        reset = 1; #10;

        reset = 0;



        #20;



        $finish;

    end



    // Monitor signals

    initial begin

        $monitor("Time=%0t | reset=%b shift=%b serial_in=%b parallel_out=%b",

                 $time, reset, shift, serial_in, parallel_out);

    end



endmodule
