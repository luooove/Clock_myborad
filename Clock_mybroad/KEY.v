//KEY
//2014年3月12日
//Description : 实现按键功能

module KEY(Reset_N,Millisecond_in,KEY_in,KEY_out);
input Reset_N;
input[0:3] KEY_in;
input Millisecond_in;
output[0:3] KEY_out;
wire Millisecond_in;

reg[0:3] KEY_out;
reg[0:5]  count;
reg Count_Figure;
reg[0:3]	key_samp1,key_samp1_locked;
reg[0:3]	key_samp2,key_samp2_locked;
always@(posedge Millisecond_in or negedge Reset_N)
begin
	if(!Reset_N)
		begin
			key_samp1 <= 4'b1111;
		end
	else
		begin
			key_samp1 <= KEY_in;
		end
end

always@(posedge Millisecond_in or negedge Reset_N)
begin
if(!Reset_N)
		begin
			key_samp1_locked <= 4'b1111;
		end
	else
		begin
			key_samp1_locked <= key_samp1;
		end
end

wire[0:3] key_change1;

assign key_change1 = key_samp1_locked &(~key_samp1);

always @(posedge Millisecond_in or negedge Reset_N)
begin
if(!Reset_N)
	begin
		count <= 6'b00_0000;
	end
else
	begin
		if(key_change1)
			count <= 6'b00_0000;
		else	
			count <= count + 1;
	end
end

always@(posedge Millisecond_in or negedge Reset_N)
begin
	if(!Reset_N)
		begin
			key_samp2 <= 4'b1111;
		end
	else
		begin
			if(count == 20)
				key_samp2 <= KEY_in;
		end
end

always@(posedge Millisecond_in or negedge Reset_N)
begin
if(!Reset_N)
		begin
			key_samp2_locked <= 4'b1111;
		end
	else
		begin
			key_samp2_locked <= key_samp2;
		end
end

wire[0:3] key_change2;

assign key_change2 = key_samp2_locked &(~key_samp2);

always@(posedge Millisecond_in or negedge Reset_N)
begin
if(!Reset_N)
		begin
			KEY_out <= 4'b1111;
		end
	else
		begin
			KEY_out <= ~key_change2;
		end
end
endmodule
