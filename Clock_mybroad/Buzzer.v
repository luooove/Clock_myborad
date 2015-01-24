//2014年3月15日
//蜂鸣器

module Buzzer_dididi(Reset_N,Clk_50MHz,Buzzer_trigger,Buzzer_out);
input Reset_N;
input Clk_50MHz;
input Buzzer_trigger;
output Buzzer_out;
reg Buzzer_out;
reg[25:0] count1,count2,count3;
parameter Sound_Step = 26'd16818;
parameter repeattime = 26'd50;
parameter fulltime = 26'd5000;
reg Trigger_flag;



always@(posedge Clk_50MHz or posedge Buzzer_trigger or negedge Reset_N)
begin
if(!Reset_N)
begin
	Trigger_flag <= 0;
	Buzzer_out <= 0;
	count1 <= 0;//最小计数
	count2 <= 0;
	count3 <= 0;
end
else 
begin
if(Buzzer_trigger)
	begin		
		Trigger_flag <= 1;
		count1 <= 0;//最小计数
		count2 <= 0;
		count3 <= 0;
	end
else 
begin

if(Trigger_flag == 1)
	begin
	   count1 <= count1 + 1;//小次翻转的计数
		//count2 <= count2 + 1;
	   count3 <= count3 + 1;//一次运行的计数
	end
if(count3 == fulltime)
		Trigger_flag <= 0;
		
if(Trigger_flag == 1)
	begin
		if(count2 <= repeattime)
			begin
				if(count1 == Sound_Step/2)
					begin
						Buzzer_out <= ~Buzzer_out;
						count2 <= count2 + 1;
						count1 <= 0;
					end	
			end
		else
			begin
				Buzzer_out <= 0;
			end
			
	end
end
end
		
end


endmodule
