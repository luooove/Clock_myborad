//Display
//思想，每次只发送一个数据，然后这个模块只管显示

module Dipslay(Channal,Data,Duan,Wei);

input[0:7] Channal;
input [0:3] Data;//进来的一位数据
output[0:7] Duan;//段选
output[0:7] Wei;//位选
reg [0:7] Duan;
reg[0:7] Wei;//位选

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
parameter Bar =   8'b0000_0010;
parameter LetterA =  8'b1110_1110;
parameter LetterB =  8'b0011_1110;
parameter LetterC =  8'b1001_1100;
parameter LetterD =  8'b0111_1010;
parameter LetterE =  8'b1001_1110;
parameter LetterF =  8'b1000_1110;


parameter Wei8 = 8'b1111_0111;//OK
parameter Wei7 = 8'b1111_1011;//OK
parameter Wei6 = 8'b1111_1101;//OK
parameter Wei5 = 8'b1111_1110;//OK
parameter Wei4 = 8'b0111_1111;//OK
parameter Wei3 = 8'b1011_1111;//OK
parameter Wei2 = 8'b1101_1111;//OK
parameter Wei1 = 8'b1110_1111;//OK



always@(Channal)
begin
	case(Channal)
		4'd1 : Wei = Wei1;
		4'd2 : Wei = Wei2;
		4'd3 : Wei = Wei3;
		4'd4 : Wei = Wei4;
		4'd5 : Wei = Wei5;
		4'd6 : Wei = Wei6;
		4'd7 : Wei = Wei7;
		4'd8 : Wei = Wei8;
	endcase	
end

always@(Data)
begin
	case(Data) 
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
		4'd10: Duan = Bar;
	endcase
end

endmodule
