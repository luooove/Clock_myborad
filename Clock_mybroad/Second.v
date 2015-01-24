//Delay 1s
//2014年3月11日
//Description : Output 1 second


module Second(Reset_N,Clk_50MHz,Second_out);
input Reset_N,Clk_50MHz;
output Second_out;

reg Second_out;
reg[0:27] count;
parameter Full = 28'h17D7840;//25M分频 61A8 17D7840

always@(posedge Clk_50MHz)
begin
	if(!Reset_N)
		begin
			Second_out <= 0;
			count <= 0;
		end
	else
		begin
			if(count == Full)
				begin
					Second_out <= ~Second_out;
					count <= 0;
				end
			else
				begin
					count <= count + 1'b1;
				end
		end
end

endmodule
