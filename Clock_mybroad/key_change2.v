

module KEY_LED(Reset_N,key_in,LED);
input Reset_N;
input[0:3] key_in;
output[0:3] LED;
reg[0:3] LED;
always@(negedge Reset_N or posedge key_in)
begin
	if(!Reset_N)
		begin
			LED <= 4'b0000;
		end
	else
		begin
			LED <= ~LED;
		end
end



 //KEY(Reset_N,KEY_in,KEY_out);

endmodule
