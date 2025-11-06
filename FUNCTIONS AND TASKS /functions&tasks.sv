/////////////////////////////////////////////tasks/////////////////////////////////////////////
/*module test;
	task write_mem;
		input reg [7:0] waddr,wdata;
		output ref [7:0] indata,addr;
			begin 
				indata<=wdata;
				addr<=waddr;
				write<=1'b0;
				#5 write <=1'b1;
				#10 write <= 1'b0;
			end 
	endtask : write_mem
endmodule : test 
*/

/////////////////////////////////////////////functions/////////////////////////////////////////////
/*module test;
	function reg [31:0] swapbytes;
	input reg [31:0] bus;
	reg [31:0] newbus;
	integer i;
	begin 
		for (i=0;i<4;i=i++)
		newbus=bus;
		swapbytes=(newbus);
	end 
	endfunction : swapbytes
endmodule : test*/

/////////////////////////////////////////////void functions/////////////////////////////////////////////
/*module test;
int a=5,b=7;
int sum,double;

function int summation(input [3:0] x,input [3:0]y,output [5:0] z);
	summation = x+y;
	z=2*summation;
endfunction : summation 

function void display();
	$display("sum is %0d and doubled value is %0d",sum, double );
endfunction : display 

//invocation of void function doesn't require an assignment 
initial 
	begin
		sum=summation(a,b,double); //traditional function 
		display(); //void function 
	end 
endmodule : test

OUTPUT:
# run -all
# sum is 12 and doubled value is 24
#  quit -f
 */


/*module fone;
int x;
	function int sum(input int a, input int b);
		return a+b;
	endfunction
	
	initial 
		begin 
			x=sum(1,2);
			$display("The value is sum =%0d",x);
		end 
endmodule : fone

OUTPUT:
# run -all
# The value is sum =3
#  quit -f
*/

/*module ftwo;
int x;
	function int sum(input int a, input int b);
		return a+b;
	endfunction 
	
	function void display (input string name);
		$display("[%0s],The sum of value sum = %0d",name,x);
	endfunction 
	
	initial 
		begin 
			x = sum(1,2);
			$display("The value is sum =%0d",x);
		end 
endmodule : ftwo

OUTPUT:
# run -all
# The value is sum =3
#  quit -f
*/

/////////////////////////////////////////////static fnction /////////////////////////////////////////////
/*module test;
task double (int a, string s);
	#5;
	a=a+2;
	$display($time, "%s : %d",s,a);
endtask : double 

initial
fork 
	begin 
		double(5,"FROM THREAD 1 : ");
	end 
	
	begin 
		#2;
		double(4, "FROM THREAD 2 : ");
	end 
join 
endmodule  : test

OUTPUT:
# run -all
#                    5FROM THREAD 2 :  :           6
#                    7FROM THREAD 2 :  :           8
#  quit -f
*/

/*module test;
task double (int a, string s);
	#5;
	a=a+2;
	$display($time, "%s : %d",s,a);
endtask : double 

initial
fork 
	begin 
		#5;
		double(5,"FROM THREAD 1 : ");
	end 
	
	begin 
		#2;
		double(4, "FROM THREAD 2 : ");
	end 
join 
endmodule : test

OUTPUT:
# run -all
#                    7FROM THREAD 1 :  :           7
#                   10FROM THREAD 1 :  :           9
#  quit -f
*/
/////////////////////////////////////////////autoamtic /////////////////////////////////////////////
/*module test;
task automatic double (int a, string s);
	#5;
	a=a+2;
	$display($time, "%s : %d",s,a);
endtask : double 

initial
fork 
	begin 
		double(5,"FROM THREAD 1 : ");
	end 
	
	begin 
		#2;
		double(4, "FROM THREAD 2 : ");
	end 
join 
endmodule : test

OUTPUT:
# run -all
#                    5FROM THREAD 1 :  :           7
#                    7FROM THREAD 2 :  :           6
#  quit -f
*/

/*module test;
task automatic double (int a, string s);
	#5;
	a=a+2;
	$display($time, "%s : %d",s,a);
endtask : double 

initial
fork 
	begin 
	#5;
		double(5,"FROM THREAD 1 : ");
	end 
	
	begin 
		#2;
		double(4, "FROM THREAD 2 : ");
	end 
join 
endmodule : test

OUTPUT:
# run -all
#                    7FROM THREAD 2 :  :           6
#                   10FROM THREAD 1 :  :           7
#  quit -f
*/

////////////////////////////////////////static //////////////////////////////////////////////////
/*module static_task;
int cout;
	task static static_task(int counter);
		counter =0;
		counter++;
		$display("counter value : %0d",counter);
	endtask 
	
	initial 
		begin 
			static_task(1);
			static_task(2);
		end 
endmodule : static_task

OUTPUT:
# Loading work.static_task(fast)
# run -all
# counter value : 1
# counter value : 1
#  quit -f
*/

/*module static_task;
int count;
	task static static_task(int counter);
		counter++;
		$display("counter value : %0d",counter);
	endtask 
	
	initial 
		begin 
			static_task(1);
			static_task(2);
		end 
endmodule :static_task

OUTPUT:
# Loading work.static_task(fast)
# run -all
# counter value : 2
# counter value : 3
#  quit -f */


/*module static_task;
int cout;
	task static static_task(int counter);
		counter++;
		$display("counter value : %0d",counter);
	endtask 
	
	initial 
		begin 
			static_task(1);
			static_task(5);
		end 
endmodule : static_task

OUTPUT:
# Loading work.static_task(fast)
# run -all
# counter value : 2
# counter value : 6
#  quit -f */


/////////////////////////////////////////////automatic/////////////////////////////////////////////
/*module automatic_task;
int cout;
	task automatic automatic_task(int counter);
		counter++;
		$display("counter value : %0d",counter);
	endtask 
	
	initial 
		begin 
			automatic_task(1);
			automatic_task(2);
		end 
endmodule : automatic_task

OUTPUT:
# run -all
# counter value : 2
# counter value : 3
#  quit -f*/


/*module automatic_task;
//int count;
	task automatic automatic_task(int counter);
		counter++;
		$display("counter value : %0d",counter);
	endtask 
	
	initial 
		begin 
			automatic_task(1);
			automatic_task(7);
		end 
endmodule : automatic_task

OUTPUT:
# run -all
# counter value : 2
# counter value : 8
#  quit -f*/

/////////////////////////////////////////////Default arguements/////////////////////////////////////////////
/*module tb;
task read(int j=0,int k,int data=1);
endtask : read
integer val =21;
read( ,5);
read(2,val);
read( ,5,7);
read();
endmodule : tb */

/////////////////////////////////////////////associative array/////////////////////////////////////////////
/*module test;
int amem [int];
initial 
	begin 
		amem[2]=1;
		amem[100]=5;
		amem[5]=60;
		amem[200]=89;
		if(amem.exists(5))
			$display("entry exists in mem,whose value is %d",amem[5]);
		else 
			$display("no entry");
			$display("number of entries in array is %0d",amem.num);
	end 
endmodule : test

OUTPUT:
# run -all
# entry exists in mem,whose value is          60
# number of entries in array is 4
#  quit -f */


/////////////////////////////////////////////array methods/////////////////////////////////////////////
/*module test;
//array reduction methods 
int cnt,sa;
int da[]={10,1,8,3,5,5};
cnt = da.sum with (item>7);//2:[10,8]
sa = da.sum with (item==5); //2:[5,5]
//sorting methods 
int da[]={10,1,7,3,4,4};
da.reverse(); //{4,4,3,7,1,10}
da.sort();//{1,3,4,4,7,10}
da.rsort();//{10,7,4,4,3,1}
da.shuffle();
endmodule : test */
/*module test();
    int ma = 20;

    function automatic void pass_by_ref(int fa);
        fa = fa * 2; // 40
        $display("Inside the function pass_by_ref fa = %d", fa);
    endfunction : pass_by_ref

    initial
        begin
            pass_by_ref(ma);
            $display("after calling the function pass_by_ref ma = %d", ma);
        end
endmodule : test

OUTPUT:
# run -all
# Inside the function pass_by_ref fa =          40
# after calling the function pass_by_ref ma =          20
#  quit -f
*/
module test();
    int ma = 20;

    function automatic void pass_by_ref(ref int fa);
        fa = fa * 2; // 40
        $display("Inside the function pass_by_ref fa = %d", fa);
    endfunction : pass_by_ref

    initial
        begin
            pass_by_ref(ma);
            $display("after calling the function pass_by_ref ma = %d", ma);
        end
endmodule : test
//output:
/*Loading sv_std.std
# Loading work.test(fast)
# run -all
# Inside the function pass_by_ref fa =          40
# after calling the function pass_by_ref ma =          40
#  quit -f
# End time: 12:00:31 on Nov 06,2025, Elapsed time: 0:00:10
# Errors: 0, Warnings: 0
*/
