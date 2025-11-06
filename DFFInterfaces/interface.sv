//////////////////////////////////////basic syntax//////////////////////////////////////
/*module test;
interface mem_bus(clk);
parameter dbus=32,abus=8;
input clk;
wire direction;
wire[dbus-1:0] data;
wire[abus-1:0] address;
endinterface : mem_bus
endmodule :test */

//////////////////////////////////////interface refernce //////////////////////////////////////
/*module mem_mod(input clk,duv_bus bus);
reg [31:0] mem [0:3];
wire read,write;
logic[31:0] rdata;
assign read = (bus.gnt &&(bus.mode==0));
assign write = (bus.gnt &&(bus.mode==1));
assign bus.data =read? rdata : 'bz;
always @(posedge clk);
initial 
begin 
	if(read)
		rdata=mem[bus.addr];
	else if(write)
		mem[bus.addr]=bus.data;
end 
endmodule : mem_mod
interface duv_bus;
logic start,gnt,rdy;
logic [1:0]mode;
logic [7:0]addr;
wire [7:0]data;
endinterface : duv_bus */
////////////////////////////////////// DFF interface //////////////////////////////////////

/*interface dff_if(input clk);

logic d0,d1,sel,rst,q;

parameter thold = 2, //output skew 
			tetup = 4; //input skew 

clocking cb@(posedge clk);
	default input #(tsetup) output #(thold);
	output d0;
	output d1;
	output rst;
	output sel;
	input q;
endclocking

modport DUV (input d0,d1,rst,sel,clk,output q);

//task for checking reset 
task sync_reset;
	cb.rst<=1;
	cb.sel<=$random;
	cb.d0<=1;
	cb.d1<=1;
	repeat(2)
		@(cb);
	if(cb.q !==0)
		begin 
			$display("RESET IS NOT WORKING");
			$stop;
		end
	else 
		$display("RESET IS WORKING");
endtask 
//task for checking reset 
task load_d0;
	cb.rst<=1;
	cb.sel<=0;
	cb.d0<=data;
	cb.d1<=~data;
	repeat(2)
		@(cb);
	if(cb.q !==data)
		begin 
			$display("LOAD d0 IS NOT WORKING");
			$stop;
		end
	else 
		$display("LOAD d0 IS WORKING");
endtask 
//task for checking reset 
task load_d1;
	cb.rst<=0;
	cb.sel<=1;
	cb.d0<=~data;
	cb.d1<=data;
	repeat(2)
		@(cb);
	if(cb.q !==data)
		begin 
			$display("LOAD d1 IS NOT WORKING");
			$stop;
		end
	else 
		$display("LOAD d1 IS WORKING");
endtask 
		
modport TEST(clocking cb, import task sync_reset(),import task load_d0(),
				import task load_d1());
endinterface 
//DFF DUT 
module dff(dff_if.DUV duv_if);
logic d;
always @(*)
	begin 
		case(duv_if.sel)
			0:d=duv_if.d0;
			1:d=duv_if.d1;
		default : d = duv_if.d0;
		endcase 
	end 
always @(posedge duv_if.clk)
	begin 
		if(duv_if.rst)
			duv_if.q<=0;
		else 
			duv_if.q<=d;
	end 
endmodule 

//sv tb and top module 
module testcase(dff_if.TEST test_if );
	initial 
		begin 
			@(test_if.cb);
			test_if.sync_reset;
			test_if.load_d0(1);
			test_if.load_d1(0);
			test_if.load_d0(0);
			test_if.load_d1(1);
			#10 
			$finish;
		end 
endmodule 

'timescale 10ns/1ns 
module top();
bit clk;
always
	#10 clk =!clk;
	
dff_if IF(clk);
dff RTL(IF);
testcase TB(IF);
endmodule */
