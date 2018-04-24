module aaaa_tb;
reg b,c,d,o;
wire oooooooo;
aaaa u1 ( .b(b), .c(c), .d(d), .o(o), .oooooooo(oooooooo) );
initial begin
	a = 0; b = 0; c = 0; d = 0; #50;
	a = 0; b = 0; c = 0; d = 1; #50;
	a = 0; b = 0; c = 1; d = 0; #50;
	a = 0; b = 0; c = 1; d = 1; #50;
	a = 0; b = 1; c = 0; d = 0; #50;
	a = 0; b = 1; c = 0; d = 1; #50;
	a = 0; b = 1; c = 1; d = 0; #50;
	a = 0; b = 1; c = 1; d = 1; #50;
	a = 1; b = 0; c = 0; d = 0; #50;
	a = 1; b = 0; c = 0; d = 1; #50;
	a = 1; b = 0; c = 1; d = 0; #50;
	a = 1; b = 0; c = 1; d = 1; #50;
	a = 1; b = 1; c = 0; d = 0; #50;
	a = 1; b = 1; c = 0; d = 1; #50;
	a = 1; b = 1; c = 1; d = 0; #50;
	a = 1; b = 1; c = 1; d = 1; #50;
end
endmodule
