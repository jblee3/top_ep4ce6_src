module top_ep4ce6 (input wire [3:0] sw,
output wire [3:0] led );
    my_and add0(sw[0], sw[1], led[0]);
endmodule
