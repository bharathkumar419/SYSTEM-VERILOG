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

/////////////////////////Randomizaton /////////////////////////////////////////////
/*class transaction ;
	bit [1:0] pktlength ;
	bit [1:0] IPG;
	endclass : transaction 
	
	transaction t1;
	module test;
	initial
		begin 
			repeat(2);
				begin 
				t1=new();
				t1.randomize();
				t1.randomize(pktlength);
				$display("t1=%p",t1);
				end 
		end 
	endmodule : test
	
OUTPUT:
# run -all
# t1='{pktlength:2, IPG:0}
#  quit -f
*/

/*class transaction ;
	rand bit [1:0] pktlength ;
	rand bit [1:0] IPG;
	endclass : transaction 
	
	transaction t1;
	module test;
	initial
		begin 
			repeat(2);
				begin 
				t1=new();
				t1.randomize();
				t1.randomize(pktlength);
				$display("t1=%p",t1);
				end 
		end 
	endmodule : test
OUTPUT:
# run -all
# t1='{pktlength:2, IPG:0}
#  quit -f
*/

/*class trans;
int a;
	function new(int a);
		this.a=a;
	endfunction
endclass 

trans t1;
module test;
	initial 
		begin 
		t1 = new(5); ///oc
		$display("t1=%p",t1);
		end 
endmodule : test

OUTPUT:
# run -all
# t1='{a:5}
#  quit -f
*/

/*class transaction;
	rand bit [7:0] pkt_length;
	rand bit [0:1] header;
endclass : transaction 

transaction trans_h;

module test();
initial 
	begin 
		int success;
		trans_h=new();
		success = trans_h.randomize();
		$display("trans_h=%p,success=%d",trans_h,success);
	end 
endmodule : test

OUTPUT:
# Loading work.test(fast)
# run -all
# trans_h='{pkt_length:212, header:1},success=          1
#  quit -f
*/

/*class packet;
	rand bit [31:0] addr;
	randc bit [31:0] data;
	
	function void display(input string tag);
	$display ("[%0s] the randomize addr = %d and data =%d",tag,addr,data);
	endfunction  
endclass 

module test();
	packet pack;
	
	initial 
		begin 
			repeat(10)
			begin 
				pack = new();
				pack.randomize();
				pack.display("randomize");
				$display("pack=%p",pack);
			end
		end 
endmodule : test 

OUTPUT:
# run -all
# [randomize] the randomize addr =  535903081 and data = 729548523
# pack='{addr:535903081, data:729548523}
# [randomize] the randomize addr = 1191024580 and data = 400905705
# pack='{addr:1191024580, data:400905705}
# [randomize] the randomize addr = 1207945924 and data =3795047144
# pack='{addr:1207945924, data:3795047144}
# [randomize] the randomize addr = 3602078060 and data =2288878733
# pack='{addr:3602078060, data:2288878733}
# [randomize] the randomize addr =   83846412 and data =3700213399
# pack='{addr:83846412, data:3700213399}
# [randomize] the randomize addr =   30566114 and data = 944268854
# pack='{addr:30566114, data:944268854}
# [randomize] the randomize addr = 3372725677 and data =1048248740
# pack='{addr:3372725677, data:1048248740}
# [randomize] the randomize addr = 1706091899 and data =4025424637
# pack='{addr:1706091899, data:4025424637}
# [randomize] the randomize addr =  174748705 and data =2958313794
# pack='{addr:174748705, data:2958313794}
# [randomize] the randomize addr =  567379481 and data =2784033123
# pack='{addr:567379481, data:2784033123}
*/



/*class packet;
        rand  bit[31:0] addr;
        randc bit[31:0] data;

        function void display(input string tag);
            $display("[%0s] The randomize addr = %0d and data = %0d",tag , addr,data);
        endfunction

endclass

    module tb;
    packet pack;
        
        initial
		begin
        repeat(10)
			begin
            pack = new();
            if(pack.randomize())
                begin
                $display("The randomize is success");
                 pack.display("randomize");
                 end
                else begin
                 $display("The randomize is not success");
                end

			end
        end
    endmodule
OUTPUT:
# run -all
# The randomize is success
# [randomize] The randomize addr = 535903081 and data = 729548523
# The randomize is success
# [randomize] The randomize addr = 1191024580 and data = 400905705
# The randomize is success
# [randomize] The randomize addr = 1207945924 and data = 3795047144
# The randomize is success
# [randomize] The randomize addr = 3602078060 and data = 2288878733
# The randomize is success
# [randomize] The randomize addr = 83846412 and data = 3700213399
# The randomize is success
# [randomize] The randomize addr = 30566114 and data = 944268854
# The randomize is success
# [randomize] The randomize addr = 3372725677 and data = 1048248740
# The randomize is success
# [randomize] The randomize addr = 1706091899 and data = 4025424637
# The randomize is success
# [randomize] The randomize addr = 174748705 and data = 2958313794
# The randomize is success
# [randomize] The randomize addr = 567379481 and data = 2784033123
#  quit -f
*/

/*class packet;
        rand  bit[31:0] addr;
        randc bit[31:0] data;

        function void display(input string tag);
            $display("[%0s] The randomize addr = %0d and data = %0d",tag , addr,data);
        endfunction

    endclass

    module tb;
    packet pack;
        
        initial begin
        repeat(10)begin
            pack = new();
            pack.addr.rand_mode(0);
            pack.randomize();
            pack.display("randomize");
               
          end
        end
    endmodule

OUTPUT:

# run -all
# [randomize] The randomize addr = 0 and data = 729548523
# [randomize] The randomize addr = 0 and data = 400905705
# [randomize] The randomize addr = 0 and data = 3795047144
# [randomize] The randomize addr = 0 and data = 2288878733
# [randomize] The randomize addr = 0 and data = 3700213399
# [randomize] The randomize addr = 0 and data = 944268854
# [randomize] The randomize addr = 0 and data = 1048248740
# [randomize] The randomize addr = 0 and data = 4025424637
# [randomize] The randomize addr = 0 and data = 2958313794
# [randomize] The randomize addr = 0 and data = 2784033123
#  quit -f
*/

/*class simple_range;

    rand bit[31:0] addr;
    rand bit[31:0] data;

    constraint c1{addr inside {[0:15]};}

    function void display(input string tag);
        $display("[%0s] The addr = %0d and data = %0d",tag,addr,data);
    endfunction

endclass

module tb;
    simple_range simple;

        initial begin
        repeat(20)
            begin

            simple = new();
            simple.randomize();
            simple.display("simple_rang");   
            end
        end
endmodule

OUTPUT:
# run -all
# [simple_rang] The addr = 9 and data = 729548523
# [simple_rang] The addr = 4 and data = 400905705
# [simple_rang] The addr = 4 and data = 3795047144
# [simple_rang] The addr = 12 and data = 2288878733
# [simple_rang] The addr = 12 and data = 3700213399
# [simple_rang] The addr = 2 and data = 944268854
# [simple_rang] The addr = 13 and data = 1048248740
# [simple_rang] The addr = 11 and data = 4025424637
# [simple_rang] The addr = 1 and data = 2958313794
# [simple_rang] The addr = 9 and data = 2784033123
# [simple_rang] The addr = 3 and data = 3654375982
# [simple_rang] The addr = 5 and data = 505724876
# [simple_rang] The addr = 0 and data = 1652447419
# [simple_rang] The addr = 0 and data = 2207821182
# [simple_rang] The addr = 2 and data = 2524267726
# [simple_rang] The addr = 5 and data = 1747395162
# [simple_rang] The addr = 2 and data = 2669481404
# [simple_rang] The addr = 5 and data = 109235927
# [simple_rang] The addr = 15 and data = 2820037257
# [simple_rang] The addr = 14 and data = 2628760768
#  quit -f
*/

////////////////////post_rand////////////////////////////////////////
/*class transaction;
	rand bit [7:0] data;
	rand bit [1:0] ch;
	
	function void post_randomize;
	$display("data is %p",data);
	$display("channel is %d",ch);
	endfunction : post_randomize
endclass : transaction

module test();
initial 
	begin 
		int success;
		transaction trans_h = new();
		success= trans_h.randomize();
		$display("trans_h=%p,success=%d",trans_h,success);
	end  
endmodule : test */

/*OUTPUT:

# run -all
# data is 208
# channel is 2
# trans_h='{data:208, ch:2},success=          1
#  quit -f*/

/*class transaction;
	rand bit [7:0] data;
	rand bit [1:0] ch;
	
	function void post_randomize;
	$display("data is %p",data);
	$display("channel is %d",ch);
	endfunction : post_randomize
endclass : transaction

module test();
initial 
	begin 
		int success;
		transaction trans_h = new();
		success= trans_h.randomize();
		//$display("trans_h=%p,success=%d",trans_h,success);
	end  
endmodule : test 
OUTPUT:
# run -all
# data is 208
# channel is 2
#  quit -f
*/


//////////////////////////////////////////pre_randomize///////////////////////////////////////////////////////////////
/*class transaction;
	rand bit [7:0] data;
	rand bit [1:0] ch;
	
	function void pre_randomize;
	$display("data is %p",data);
	$display("channel is %d",ch);
	endfunction : pre_randomize
endclass : transaction

module test();
initial 
	begin 
		int success;
		transaction trans_h = new();
		success= trans_h.randomize();
		$display("trans_h=%p,success=%d",trans_h,success);
	end  
endmodule : test

OUTPUT:
# run -all
# data is 0
# channel is 0
# trans_h='{data:208, ch:2},success=          1
#  quit -f
*/

