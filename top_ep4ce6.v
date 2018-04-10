module top_ep4ce6 (
                input wire resetn,
                input wire clk50m,
                input wire uart_rx,
                input wire [3:0] sw,
                output wire uart_tx,
                output wire beep,
                output wire [4:0] led,
                output wire [7:0] seg7,
                output wire [3:0] seg_cs );

        wire beep_r;

        assign beep = sw[0]?beep_r:1'b0;

//    my_and add0(sw[0], sw[1], led[0]);
//    my_and add0(sw[0], sw[1], led[0]);
//    my_decode decode0( sw[1:0], sw[2], led );
    led_twinkle led_twinkle0( clk50m, led );
    sled sled0( clk50m, seg7, seg_cs );
    beep beep0( clk50m, beep_r );


    my_uart_top uart0(
                .clk(clk50m),
                .rst_n(resetn),
                .rs232_rx(uart_rx),
                .rs232_tx(uart_tx)
                );
endmodule
