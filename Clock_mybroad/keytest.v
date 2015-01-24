//测试按键的小程序，按键一次翻转一次LED亮灭。
module keytest(Reset_N,Clk_50MHz,keyinput1,keyinput2,keyinput3,keyinput4,LED);
input Clk_50MHz;
input Reset_N;
input keyinput1,keyinput2,keyinput3,keyinput4;
output[7:0] LED;
reg[7:0] LED;
wire keyout1,keyout2,keyout3,keyout4;
wire sample_clk;
always @(negedge keyout1 or negedge keyout2 or negedge keyout3 or negedge keyout4 or negedge Reset_N)
begin
	if(!Reset_N)
		begin
			LED <= 8'b0000_0000;
		end
	else
		begin
			LED <= ~LED;  //翻转LED；
		end
end



onekey mekey1(.Reset_N(Reset_N),.sample_clk(sample_clk),.keyin(keyinput1),.keyout(keyout1));
//onekey(Reset_N,sample_clk,keyin,keyout);
onekey mekey2(.Reset_N(Reset_N),.sample_clk(sample_clk),.keyin(keyinput2),.keyout(keyout2));
//onekey(Reset_N,sample_clk,keyin,keyout);
onekey mekey3(.Reset_N(Reset_N),.sample_clk(sample_clk),.keyin(keyinput3),.keyout(keyout3));
//onekey(Reset_N,sample_clk,keyin,keyout);
onekey mekey4(.Reset_N(Reset_N),.sample_clk(sample_clk),.keyin(keyinput4),.keyout(keyout4));
//onekey(Reset_N,sample_clk,keyin,keyout);



sample_time m2(.Reset_N(Reset_N),.Clk_50MHz(Clk_50MHz),.sample_clk(sample_clk));
//sample_time(Reset_N,Clk_50MHz,sample_clk);
endmodule
