//

module key2(Reset_N,Clk_50MHz,KEY_in,KEY_out);


 
//++++++++++++++++++++++++++++++++++++++
// 获取键值 开始
//++++++++++++++++++++++++++++++++++++++
KEY_out [4:1] key_val;                     // 键值
 
key_debounce u0(
  .i_clk            (Clk_50MHz),
  .i_rst_n          (Reset_N),
  .i_key            (KEY_in),
  .o_key_val        (KEY_out)           // 按下为0，松开为1
);  
//--------------------------------------
// 获取键值 结束
//--------------------------------------
 
 
//++++++++++++++++++++++++++++++++++++++
// 按下键后开关LED 开始
//++++++++++++++++++++++++++++++++++++++
always @ (posedge CLOCK_50, negedge Q_KEY)
  if (!Q_KEY)
    LED <= 4'hF;                        // 0灭1亮
  else
    case (1'b0)
      key_val[1] : LED[1] <= ~LED[1];
      key_val[2] : LED[2] <= ~LED[2];
      key_val[3] : LED[3] <= ~LED[3];
      key_val[4] : LED[4] <= ~LED[4];
      default    : LED    <=  LED   ;   // 缺省亮灭情况不变
    endcase 
//--------------------------------------
// 按下键后开关LED 结束
//--------------------------------------
 
endmodule
