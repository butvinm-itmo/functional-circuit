`define decoder_block(i, a, b, c) \
    nand(x[i], a, b); \
    nand(y[i], x[i], x[i]); \
    nand(z[i], y[i], c); \
    nand(d[i], z[i], z[i]);


module decoder (
    output wire [7:0] d,
    input wire a,
    input wire b,
    input wire c
);
    wire A, B, C;

    nand(A, a, a);
    nand(B, b, b);
    nand(C, c, c);

    wire [7:0] x, y, z;

    `decoder_block(0, A, B, C);
    `decoder_block(1, A, B, c);
    `decoder_block(2, A, b, C);
    `decoder_block(3, A, b, c);
    `decoder_block(4, a, B, C);
    `decoder_block(5, a, B, c);
    `decoder_block(6, a, b, C);
    `decoder_block(7, a, b, c);
endmodule
