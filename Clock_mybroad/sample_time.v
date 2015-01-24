
//2014年3月12日
//Description : 产生40HZ的频率


module sample_time(Reset_N,Clk_50MHz,sample_clk);
input Reset_N,Clk_50MHz;
output sample_clk;

reg sample_clk;
reg[19:0] count;
parameter Full = 20'h1312D0;//1312D0

always@(posedge Clk_50MHz)
begin
	if(!Reset_N)
		begin
			sample_clk <= 0;
			count <= 0;
		end
	else
		begin
			if(count == Full)
				begin
					sample_clk <= ~sample_clk;
					count <= 0;
				end
			else
				begin
					count <= count + 1'b1;
				end
		end
end

endmodule
