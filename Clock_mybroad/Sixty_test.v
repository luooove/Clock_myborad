//the testbench of Sixty

module Sixty_test();

reg Reset_N,Sixty_in,Add,Subtract;
wire Sixty_out;
wire[0:5] count;
initial
begin
	Reset_N <= 0;
	Sixty_in <= 0;
	Add <= 0;
	Subtract <= 0;
	#10 Reset_N <= 1;
end

always #10 Sixty_in <= ~Sixty_in;
//always begin #210  Add <= 1; #1 Add <= 0;end

Sixty m1(Reset_N,Sixty_in,Add,Subtract,Sixty_out,count);
//Sixty(Reset_N,Sixty_in,Add,Subtract,Sixty_out,count)

endmodule
