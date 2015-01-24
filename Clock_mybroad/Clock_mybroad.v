//the top of Clock Design 
//2014年3月12日
//Designer : Luo Xiaoxiang

module Clock_mybroad(Reset_N,Clk_50MHz,KEY_in,Duan,Wei,Buzzer_out,LED);


input Reset_N,Clk_50MHz;
input[3:0] KEY_in;
output[7:0] Duan;
output[7:0] Wei;
output Buzzer_out;
output[3:0] LED;

wire[7:0] Duan;
wire[7:0] Wei;
wire Sixty_in_S,Sixty_in_M,TwentyFour_in;
wire Add_S,Add_M,Add_H;
wire Subtract_S,Subtract_M,Subtract_H;
wire Sixty_out_S,Sixty_out_M,TwentyFour_out;
wire[5:0] count_S,count_M;
wire[4:0] count_H;
wire Millisecond_out;
wire Second_out;
wire Buzzer_trigger;
wire Buzzer_out;
wire[3:0] KEY_out;
wire[3:0] key_in;
wire Millisecond_in;
reg[7:0] Wei_count;
reg[3:0] Data;
reg[7:0]	Channal;
reg[5:0] Set_Time[1:6];

assign key_in = KEY_out;
assign Sixty_in_S = Second_out;//秒输出给60计数
assign Sixty_in_M = Sixty_out_S;
assign TwentyFour_in = Sixty_out_M;
assign Millisecond_in = Millisecond_out;//
assign Buzzer_trigger = ((Set_Time[1] == count_S%10) && (Set_Time[2] == count_S/10) && (Set_Time[3] == count_M%10) 
								&& (Set_Time[4] == count_M/10) && (Set_Time[5] == count_H%10) && (Set_Time[6] == count_H/10)) ? 1 : 0;

always@(posedge Millisecond_out or negedge Reset_N)
begin
	if(!Reset_N)
		begin
			Set_Time[1] = 6'd5;
			Set_Time[2] = 6'd0;
			Set_Time[3] = 6'd0;
			Set_Time[4] = 6'd0;
			Set_Time[5] = 6'd0;
			Set_Time[6] = 6'd0;
			Channal <= 4'b0001;
		end
	else
		begin
			Wei_count <= Wei_count << 1;		
			if(Wei_count == 8'b0000_0000)
				begin
					Wei_count <= 0000_0001;
				end
			case(Wei_count)
				8'b0000_0001 : begin Channal <= 4'd1; Data <= (count_S%10);end
				8'b0000_0010 : begin Channal <= 4'd2; Data <= (count_S/10);end
				8'b0000_0100 : begin Channal <= 4'd3; Data <= 4'd10 ;      end
				8'b0000_1000 : begin Channal <= 4'd4; Data <= (count_M%10);end
				8'b0001_0000 : begin Channal <= 4'd5; Data <= (count_M/10);end
				8'b0010_0000 : begin Channal <= 4'd6; Data <= 4'd10;       end
				8'b0100_0000 : begin Channal <= 4'd7; Data <= (count_H%10);end
				8'b1000_0000 : begin Channal <= 4'd8; Data <= (count_H/10);end
				default : Wei_count <= 8'b0000_0001;
			endcase
			
		end
end

Millisecond m0(Reset_N,Clk_50MHz,Millisecond_out);//产生微秒
// Millisecond(Reset_N,Clk_50MHz,Millisecond_out);

Second m1(Reset_N,Clk_50MHz,Second_out);//产生秒
// Second(Reset_N,Clk_50MHz,Second_out);

Dipslay m2(Channal,Data,Duan,Wei);//显示部分
// Dipslay(Channal,Data,Duan,Wei);

Sixty m4(Reset_N,Sixty_in_S,Add_S,Subtract_S,Sixty_out_S,count_S);//秒计算
Sixty m5(Reset_N,Sixty_in_M,Add_M,Subtract_M,Sixty_out_M,count_M);//分计算
//Sixty(Reset_N,Sixty_in,Add,Subtract,Sixty_out,count);

TwentyFour m6(Reset_N,TwentyFour_in,Add_H,Subtract_H,TwentyFour_out,count_H);//时计算
//TwentyFour(Reset_N,TwentyFour_in,Add,Subtract,TwentyFour_out,count);



Buzzer_dididi m7(Reset_N,Millisecond_in,Buzzer_trigger,Buzzer_out);
//Buzzer_dididi(Reset_N,Second_in,Buzzer_trigger,Buzzer_out);

KEY_LED m8(Reset_N,Clk_50MHz,key_in,LED);
//KEY_LED(Reset_N,key_in,LED);

KEY m9(Reset_N,Millisecond_in,KEY_in,KEY_out);
//KEY(Reset_N,Millisecond_in,KEY_in,KEY_out);

endmodule
