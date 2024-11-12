`timescale 1ps/1ps


module decoder_tb ();
    reg a_in, b_in, c_in;
    wire [7:0] d_out;

    decoder decoder_0(
        .d(d_out),
        .a(a_in),
        .b(b_in),
        .c(c_in)
    );

    integer i;
    reg [2:0] test_in;
    reg [7:0] expected_out;

    initial begin
        $dumpfile("decoder.vcd");
        $dumpvars(0, decoder_tb);

        for (i = 0; i < 8; i = i + 1) begin
            test_in = i;
            c_in = test_in[0];
            b_in = test_in[1];
            a_in = test_in[2];
            expected_out = 0;
            expected_out[i] = 1;

            #1

            if (d_out == expected_out) begin
                $display("PASS: decoder(%b, %b, %b) == %b == %b", a_in, b_in, c_in, d_out, expected_out);
            end else begin
                $display("  FAIL: decoder(%b, %b, %b) == %b != %b", a_in, b_in, c_in, d_out, expected_out);
            end
        end
        #1
        $finish;
    end
endmodule
