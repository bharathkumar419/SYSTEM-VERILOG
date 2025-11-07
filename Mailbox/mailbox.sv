//////////////////////////////////////////////Mailbox/////////////////////////
/*module mailbox_demo();
	mailbox mbx1;
	initial 
		begin 
		mbx1=new(4);
		fork 
			begin :prcs_1
				bit [7:0]a;
				repeat(5)
				begin 
				a=$urandom_range(100);
				mbx1.put(a);
				$display("[%0t] sent data =%od",$time,a);
				#5;
				end 
			end 
			
			begin :prcs_2
				bit [7:0] a;
				repeat(5)
				begin 
				mbx1.get(a);
				$display("[%0t] recieved data =%od",$time,a);
				#10;
				end 
				if(mbx1.try_get(a))
				$display("[%0t] recieved data =%od",$time,a);
				else 
				$display("no elements to retrieve");
			end 
		join
	end 
endmodule */

/*module mailbox_demo();
	mailbox mbx1;
	initial 
		begin 
		mbx1=new(4);
		fork 
			begin :prcs_1
				bit [7:0]a;
				repeat(5)
				begin 
				a=$urandom_range(100);
				mbx1.put(a);
				$display("[%0t] sent data =%od",$time,a);
				#5;
				end 
			end 
			
			begin :prcs_2
				bit [7:0] a;
				repeat(5)
				begin 
				mbx1.get(a);
				$display("[%0t] recieved data =%od",$time,a);
				#10;
				end 
				if(mbx1.try_get(a))
				$display("[%0t] recieved data =%od",$time,a);
				else 
				$display("no elements to retrieve");
			end 
		join_none
	end 
endmodule */

/*class env;
	mailbox #(trans) gen2drv=new();
	generator gen=new(gen2drv);
	driver drv=new(gen2drv);
	task start;
	gen.start;
	dr.start;
	endtask : start
endclass : env

class generator;
trans trans_h;
mailbox #(trans) gen2drv;
	function new(mailbox #(trans)gen2drv);
	this.gen2drv=gen2drv;
	endfunction : new
	task start;
		fork 
			repeat(10)
			begin 
			trans_h=new();
			assert(trans_h.randomize());
			gen2drv.put(trans_h);
			end 
		join_none
	endtask : start
endclass : generator 

class driver;
	trans trans_h;
	mailbox #(trans) gen2drv;
	function new(mailbox #(trans) gen2drv);
	this.gen2drv=gen2drv;
	endfunction : new
		task start;
		fork 
			repeat(10) begin 
			gen2drv.get(trans_h);
			@(posedge duvif.cb.en);
			end 
		join_none 
		endtask : start 
endclass : driver */
