//取余数
module quyu(yushu,shi,ge);
input[0:5] yushu;
output[0:3] shi,ge;
reg[0:3]	shi,ge;
wire[0:5] temp,temp2;

assign temp = yushu/10;
assign temp2 = yushu - temp*10;
always@(yushu)
begin
	if(temp != 0)
		begin
			shi <= temp;
			ge <= temp2;
		end
	else	
		begin
			shi <= 0;
		end
end

endmodule
