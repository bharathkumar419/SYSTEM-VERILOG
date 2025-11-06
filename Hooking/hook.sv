//////////////////////////////HOOKING//////////////////////////////
/*class callback_base;
	virtual task pre_send;
	endtask : pre_send
endclass : callback_base

class driver;
	callback_base call_base_h = new();
	task send;
	call_base_h.pre_send();
	#30;
	$display($time,"completed Driving");
	endtask :send
endclass : driver 


class callback_extend extends callback_base;
task pre_send();
	$display("Adding delay");
	#20;
	endtask : pre_send
endclass : callback_extend

module test;
	driver drv;
	callback_extend extnd_h;
	initial 
		begin 
		drv=new();
		drv.send();
		extnd_h = new();
		drv.call_base_h = extnd_h;
		drv.send();
		end 
endmodule : test

OUTPUT:
# run -all
#                   30completed Driving
# Adding delay
#                   80completed Driving
#  quit -f
*/
