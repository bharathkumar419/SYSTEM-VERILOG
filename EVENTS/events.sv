////////////////////////////events /////////////////////
/*
module test;
event ev;

initial
	begin 
		$display("about to drive ctrl after 10 time units");
		#10;
		$display("control is driven at time ,t=%t", $time);
		-> ev;
	end 

	initial
		begin 
		$display("about to drive data");
		#10;
		wait(ev.triggered);
		$display("data is driven at time , t=%t",$time);
		end 
endmodule : test 

OUTPUT:
# run -all
# about to drive ctrl after 10 time units
# about to drive data
# control is driven at time ,t=                  10
# data is driven at time , t=                  10
#  quit -f
*/
