

module KEY_LED(Reset_N,Clk_50MHz,key_in,LED);
input Clk_50MHz;
input Reset_N;
input[0:3] key_in;
output[0:3] LED;
reg[0:3] LED;
always@(negedge Reset_N or posedge Clk_50MHz)
begin
	if(!Reset_N)
		begin
			LED <= 4'b0000;
		end
	else
		begin
		if(key_in != 4'b1111)
			LED <= ~LED;
		end
end



 //KEY(Reset_N,KEY_in,KEY_out);

endmodule
