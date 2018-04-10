
module sled(
    input wire clock,
    output reg [7:0] seg,
    output reg [3:0] dig );

    reg [3:0] disp_dat; //显示数据寄存器
    reg [36:0] count; //定义计数寄存器

    always @ (posedge clock )
    begin 
        count = count + 1'b1;
        dig = 4'b0000;
    end

    always @ (count[24])
    begin
        disp_dat = {count[28:25]};
    end

    always @ (disp_dat)
    begin 
        case (disp_dat)
            4'h0 : seg = 8'hc0; //显示"0"
            4'h1 : seg = 8'hf9; //显示"1"
            4'h2 : seg = 8'ha4; //显示"2"
            4'h3 : seg = 8'hb0; //显示"3"
            4'h4 : seg = 8'h99; //显示"4"
            4'h5 : seg = 8'h92; //显示"5"
            4'h6 : seg = 8'h82; //显示"6"
            4'h7 : seg = 8'hf8; //显示"7"
            4'h8 : seg = 8'h80; //显示"8"
            4'h9 : seg = 8'h90; //显示"9"
            4'ha : seg = 8'h88; //显示"a"
            4'hb : seg = 8'h83; //显示"b"
            4'hc : seg = 8'hc6; //显示"c"
            4'hd : seg = 8'ha1; //显示"d"
            4'he : seg = 8'h86; //显示"e"
            4'hf : seg = 8'h8e; //显示"f"
        endcase
    end

endmodule
