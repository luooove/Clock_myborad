//the testbench of Display
//module Dipslay(Millisecond,Data,Duan,Wei);

module Dipslay_test();
reg Millisecond;
reg[0:5] Data;
wire[0:7]Duan;
wire Wei;

initial
begin
	Millisecond <= 0;
	Data <= 0;
end

always #1 Millisecond <= ~Millisecond;
always #2000 Data <= Data+1;

Dipslay m2(Millisecond,Data,Duan,Wei);
//Dipslay(Millisecond,Data,Duan,Wei);
endmodule
