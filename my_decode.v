module my_decode (
                input wire [1:0] i,
                input wire e,
                output reg [3:0] y );

    always @(i, e) begin
            if (e) begin
                    y=4'b1111;
            end
            else begin
                    case (i)
                            2'b00: y=4'b1110;
                            2'b01: y=4'b1101;
                            2'b10: y=4'b1011;
                            2'b11: y=4'b0111;
                            default: y=4'b1111;
                    endcase 
            end
    end

endmodule
