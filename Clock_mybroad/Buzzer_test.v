module Buzzer_test(Clk_50MHz,Buzzer_out);
input Clk_50MHz;
output Buzzer_out;
reg Buzzer_out;
reg[14:0] counter;
reg [23:0] tonc;
parameter clkdivider = 50000000/440/2;

always @(posedge Clk_50MHz)
begin
	tonc <= tonc +1'b1;
end

always @(posedge Clk_50MHz)
begin
if(counter == 0)
	counter <= (tonc[23]? clkdivider-1 :clkdivider/2-1);
else
	counter <= counter-1;
end

always @(posedge Clk_50MHz)
begin
	if(counter ==0)
		Buzzer_out <= ~Buzzer_out;
end
endmodule
