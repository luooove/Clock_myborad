//2014年3月13日
//计数60次输出进位，并可以加减

module Sixty(Reset_N,Sixty_in,Add,Subtract,Sixty_out,count);
input Reset_N;
//input Clk_50MHz;
input Sixty_in;
input Add,Subtract;
reg Add0,Add1;
reg Subtract0,Subtract1;
output Sixty_out;
output[0:5] count;
reg Sixty_out;
reg[0:5] count;
parameter Full_59 = 6'b11_1011;


always@(posedge Sixty_in or posedge Add or posedge Subtract or negedge Reset_N )
begin
	if(!Reset_N)
		begin
			Sixty_out <= 0;
			count <= 0;
		end
		else if(Add)//加的时候不会产生进位
		begin
			count <= count + 1'b1;
			if(count == Full_59)//如果为60则赋值为0
				begin
					count <= 0;
				end
		end
	else if(Subtract)
		begin
			count <= count - 1'b1;
			if(count == 6'b11_1111)//如果为64则赋值为59
				begin
					count <= 6'b11_1011;
				end
		end
	else 
		begin
			Sixty_out <= 0;
			count <= count + 1'b1;
			if(count == Full_59)//如果为60则赋值为0
				begin
				   Sixty_out <= 1;
					count <= 0;
				end
		end
end

endmodule
