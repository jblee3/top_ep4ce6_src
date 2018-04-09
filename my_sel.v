module my_sel (
                input wire a,
                input wire b,
                input wire sel,
                output wire c );

    assign c = sel?a:b;

endmodule
