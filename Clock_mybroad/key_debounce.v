module key_debounce(i_clk,i_rst_n,i_key,o_key_val);
input i_clk,
input i_rst_n,
input[4:1] i_key;
output reg[4:1] o_key_val;
//++++++++++++++++++++++++++++++++++++++
reg [4:1] key_samp1, key_samp1_locked;
// 将i_key采集至key_samp1
always @ (posedge i_clk, negedge i_rst_n)
  if(!i_rst_n) 
    key_samp1 <= 4'hF;
  else        
    key_samp1 <= i_key;
 
// 将key_samp1锁存至key_samp1_locked
always @ (posedge i_clk, negedge i_rst_n)
  if(!i_rst_n) 
    key_samp1_locked <= 4'hF;
  else        
    key_samp1_locked <= key_samp1;
//--------------------------------------
 
//++++++++++++++++++++++++++++++++++++++
wire [4:1] key_changed1;
 
// 当key_samp1由1变为0时
// key_changed1由0变为1，只维持一个时钟周期
assign key_changed1 = key_samp1_locked & (~key_samp1); 
//--------------------------------------
 
 
//++++++++++++++++++++++++++++++++++++++
reg [19:0] cnt;
 
// 一旦有按键按下，cnt立即被清零
always @ (posedge i_clk, negedge i_rst_n)
  if(!i_rst_n)
    cnt <= 20'h0;
  else if(key_changed1)
    cnt <= 20'h0;
  else
    cnt <= cnt + 1'b1;
//--------------------------------------
 
 
//++++++++++++++++++++++++++++++++++++++
reg [4:1] key_samp2, key_samp2_locked;
 
// 只有当按键不变化（不抖动），且维持20ms以上时
// 才将i_key采集至key_samp2
always @ (posedge i_clk, negedge i_rst_n)
  if(!i_rst_n)
    key_samp2 <= 4'hF;
  else if(cnt == 20'hF_FFFF)            // 0xFFFFF/50M = 20.9715ms
    key_samp2 <= i_key;
 
// 将key_samp2锁存至key_samp2_locked
always @ (posedge i_clk, negedge i_rst_n)
  if(!i_rst_n)
    key_samp2_locked <= 4'hF;
  else
    key_samp2_locked <= key_samp2;
//--------------------------------------
 
//++++++++++++++++++++++++++++++++++++++
wire [4:1] key_changed2;
 
// 当key_samp2由1变为0时
// key_changed2由0变为1，只维持一个时钟周期
assign key_changed2 = key_samp2_locked & (~key_samp2); 
//--------------------------------------
 
 
//++++++++++++++++++++++++++++++++++++++
// 每次按键稳定后，输出键值
// 按下为0，松开为1
always @ (posedge i_clk, negedge i_rst_n)
  if(!i_rst_n)
    o_key_val <= 4'hF;
  else
    o_key_val <= ~key_changed2;
//--------------------------------------
 
endmodule
