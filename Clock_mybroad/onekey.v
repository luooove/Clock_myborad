module onekey(Reset_N,sample_clk,keyin,keyout);
input Reset_N;      //复位
input sample_clk;   //采样时钟  40Hz, 25ms
input keyin;        //按键输入
output keyout;      //处理信号输出

reg key_in_Q,key_in_Q2,key_in_Q3;

always @(posedge sample_clk or negedge Reset_N)
begin
	if(!Reset_N)
		begin
			key_in_Q  <= 1'b1;
			key_in_Q2 <= 1'b1;
			key_in_Q3 <= 1'b1;
		end
	else
		begin
			key_in_Q  <= keyin;
			key_in_Q2 <= key_in_Q;
			key_in_Q3 <= key_in_Q2;
		end
end

assign keyout = key_in_Q2 | key_in_Q3;

endmodule
