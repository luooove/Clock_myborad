//Display


module Dipslay2(Millisecond,Data,Duan,Wei);

input Millisecond;
input [5:0] Data;//进来的两位数据
output[7:0] Duan;//段选
output Wei;//位选
reg [7:0] Duan;
reg Wei;//位选
wire[3:0] SHI;//十位
wire[3:0] GE;//个位

//parameter Zero =  8'b0000_0000;
//parameter One =   8'b0000_0001;
//parameter Two =   8'b0000_0010;
//parameter Three = 8'b0000_0100;
//parameter Four =  8'b0000_1000;
//parameter Five =  8'b0001_0000;
//parameter Six =   8'b0010_0000;
//parameter Seven = 8'b0100_0000;
//parameter Eight = 8'b1000_0000;
//parameter Nine =  8'b0000_0011;
parameter Zero =  8'b1111_1100;
parameter One =   8'b0110_0000;
parameter Two =   8'b1101_1010;
parameter Three = 8'b1111_0010;
parameter Four =  8'b0110_0110;
parameter Five =  8'b1011_0110;
parameter Six =   8'b1011_1110;
parameter Seven = 8'b1110_0000;
parameter Eight = 8'b1111_1110;
parameter Nine =  8'b1111_0110;

assign SHI = Data/10;
assign GE = Data%10;


initial
begin
	Wei <= 0;
end

always@(posedge Millisecond)
begin
	if(Wei == 0)//选通个位时候把个位的值赋值
		begin
			case(GE) 
				4'd0 : Duan = Zero;
				4'd1 : Duan = One;
				4'd2 : Duan = Two;
				4'd3 : Duan = Three;
				4'd4 : Duan = Four;
				4'd5 : Duan = Five;
				4'd6 : Duan = Six;
				4'd7 : Duan = Seven;
				4'd8 : Duan = Eight;
				4'd9 : Duan = Nine;
			endcase
		end
	else
		begin
			case(SHI) 
				4'd0 : Duan = Zero;
				4'd1 : Duan = One;
				4'd2 : Duan = Two;
				4'd3 : Duan = Three;
				4'd4 : Duan = Four;
				4'd5 : Duan = Five;
				4'd6 : Duan = Six;
				4'd7 : Duan = Seven;
				4'd8 : Duan = Eight;
				4'd9 : Duan = Nine;
			endcase
		end
end

//always@(posedge Millisecond)
//begin
//	Wei <= ~Wei;
//end



endmodule
