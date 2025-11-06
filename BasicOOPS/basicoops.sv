/*class abc;
  int data;
  int addr;
endclass

abc o1, o2;

module test;

initial
 begin
o1 = new;
o2 = new;

o1.data = 10;
o1.addr = 20;

 o2.data = 30;
    // o2.addr defaults to 0


    //$display("o1.data = %0d, o1.addr = %0d", o1); wrong
    //$display("o2.data = %0d, o2.addr = %0d", o2);

    $display("o1.data = %0d, o1.addr = %0d", o1.data, o1.addr);
    $display("o2.data = %0d, o2.addr = %0d", o2.data, o2.addr);

    $display("o1 contents = %p", o1);
    $display("o2 contents = %p", o2);
  end
endmodule
OUTPUT:
# Loading work.test(fast)
# run -all
# o1.data = 10, o1.addr = 20
# o2.data = 30, o2.addr = 0
# o1 contents = '{data:10, addr:20}
# o2 contents = '{data:30, addr:0}
#  quit -f
*/
////////////////////////////////////prop/methods////////////////////////////////////////////////
/*module account_test;  // Wrap class in a module

  // Class definition
  class account_c;
    int balance = 100;
    
    function int summary();
      return balance;
    endfunction : summary
    
    task deposit(input int pay=500);
      balance = balance + pay;
      $display("balance = %0d", balance);
    endtask : deposit
  endclass : account_c
  
  // Testbench
  initial begin
    account_c acc = new();  // Create object
    $display("Initial balance: %0d", acc.summary());
    acc.deposit(200);       // Deposit 200 (default is 500)
  end

endmodule : account_test

OUTPUT:

# Initial balance: 100
# balance = 300
*/

/*class account_c;
int balance;
function new(input int open_bal=5);
	balance = open_bal;
endfunction : new
endclass : account_c

account_c m1;

module test;
initial 	
	begin 
	m1 = new;
	m1.balance = 500;
	$display("m1.balance=%0d",m1.balance);
	end 
endmodule : test

OUTPUT:

# run -all
# m1.balance=500
#  quit -f*/
/////////////////////////////////////////////////////////////////////constructor//////////////////////////////////////////////
/*module test;
class account_c;
int balance;
initial 
	begin 
	h = new;
	h.balance=1000;
	$display("b=%d",h.balance);
	$display("b=%p",h);
endclass : account_c
endmodule : test*/
////////////////////////////////////////////////////////////creating database/////////////////////////////////////////////////////////////////////
/*class BRN57_db;
  int unsigned ssc, inter, BE, DT, VT, ST, SVT;
endclass

module test;
  // Declare the array inside the module
  BRN57_db h[50];
  
  initial begin
    foreach(h[i]) begin
      h[i] = new();
      $display("h[%0d]=%p", i, h[i]);
    end
  end
endmodule

OUTPUT:
# h[0]='{ssc:0, inter:0, BE:0, DT:0, VT:0, ST:0, SVT:0}
# h[1]='{ssc:0, inter:0, BE:0, DT:0, VT:0, ST:0, SVT:0}
# h[2]='{ssc:0, inter:0, BE:0, DT:0, VT:0, ST:0, SVT:0}
# h[3]='{ssc:0, inter:0, BE:0, DT:0, VT:0, ST:0, SVT:0}
# h[4]='{ssc:0, inter:0, BE:0, DT:0, VT:0, ST:0, SVT:0}
# h[5]='{ssc:0, inter:0, BE:0, DT:0, VT:0, ST:0, SVT:0}
# h[6]='{ssc:0, inter:0, BE:0, DT:0, VT:0, ST:0, SVT:0}
# h[7]='{ssc:0, inter:0, BE:0, DT:0, VT:0, ST:0, SVT:0}
# h[8]='{ssc:0, inter:0, BE:0, DT:0, VT:0, ST:0, SVT:0}
# h[9]='{ssc:0, inter:0, BE:0, DT:0, VT:0, ST:0, SVT:0}
# h[10]='{ssc:0, inter:0, BE:0, DT:0, VT:0, ST:0, SVT:0}
# h[11]='{ssc:0, inter:0, BE:0, DT:0, VT:0, ST:0, SVT:0}
# h[12]='{ssc:0, inter:0, BE:0, DT:0, VT:0, ST:0, SVT:0}
# h[13]='{ssc:0, inter:0, BE:0, DT:0, VT:0, ST:0, SVT:0}
# h[14]='{ssc:0, inter:0, BE:0, DT:0, VT:0, ST:0, SVT:0}
# h[15]='{ssc:0, inter:0, BE:0, DT:0, VT:0, ST:0, SVT:0}
# h[16]='{ssc:0, inter:0, BE:0, DT:0, VT:0, ST:0, SVT:0}
# h[17]='{ssc:0, inter:0, BE:0, DT:0, VT:0, ST:0, SVT:0}
# h[18]='{ssc:0, inter:0, BE:0, DT:0, VT:0, ST:0, SVT:0}
# h[19]='{ssc:0, inter:0, BE:0, DT:0, VT:0, ST:0, SVT:0}
# h[20]='{ssc:0, inter:0, BE:0, DT:0, VT:0, ST:0, SVT:0}
# h[21]='{ssc:0, inter:0, BE:0, DT:0, VT:0, ST:0, SVT:0}
# h[22]='{ssc:0, inter:0, BE:0, DT:0, VT:0, ST:0, SVT:0}
# h[23]='{ssc:0, inter:0, BE:0, DT:0, VT:0, ST:0, SVT:0}
# h[24]='{ssc:0, inter:0, BE:0, DT:0, VT:0, ST:0, SVT:0}
# h[25]='{ssc:0, inter:0, BE:0, DT:0, VT:0, ST:0, SVT:0}
# h[26]='{ssc:0, inter:0, BE:0, DT:0, VT:0, ST:0, SVT:0}
# h[27]='{ssc:0, inter:0, BE:0, DT:0, VT:0, ST:0, SVT:0}
# h[28]='{ssc:0, inter:0, BE:0, DT:0, VT:0, ST:0, SVT:0}
# h[29]='{ssc:0, inter:0, BE:0, DT:0, VT:0, ST:0, SVT:0}
# h[30]='{ssc:0, inter:0, BE:0, DT:0, VT:0, ST:0, SVT:0}
# h[31]='{ssc:0, inter:0, BE:0, DT:0, VT:0, ST:0, SVT:0}
# h[32]='{ssc:0, inter:0, BE:0, DT:0, VT:0, ST:0, SVT:0}
# h[33]='{ssc:0, inter:0, BE:0, DT:0, VT:0, ST:0, SVT:0}
# h[34]='{ssc:0, inter:0, BE:0, DT:0, VT:0, ST:0, SVT:0}
# h[35]='{ssc:0, inter:0, BE:0, DT:0, VT:0, ST:0, SVT:0}
# h[36]='{ssc:0, inter:0, BE:0, DT:0, VT:0, ST:0, SVT:0}
# h[37]='{ssc:0, inter:0, BE:0, DT:0, VT:0, ST:0, SVT:0}
# h[38]='{ssc:0, inter:0, BE:0, DT:0, VT:0, ST:0, SVT:0}
# h[39]='{ssc:0, inter:0, BE:0, DT:0, VT:0, ST:0, SVT:0}
# h[40]='{ssc:0, inter:0, BE:0, DT:0, VT:0, ST:0, SVT:0}
# h[41]='{ssc:0, inter:0, BE:0, DT:0, VT:0, ST:0, SVT:0}
# h[42]='{ssc:0, inter:0, BE:0, DT:0, VT:0, ST:0, SVT:0}
# h[43]='{ssc:0, inter:0, BE:0, DT:0, VT:0, ST:0, SVT:0}
# h[44]='{ssc:0, inter:0, BE:0, DT:0, VT:0, ST:0, SVT:0}
# h[45]='{ssc:0, inter:0, BE:0, DT:0, VT:0, ST:0, SVT:0}
# h[46]='{ssc:0, inter:0, BE:0, DT:0, VT:0, ST:0, SVT:0}
# h[47]='{ssc:0, inter:0, BE:0, DT:0, VT:0, ST:0, SVT:0}
# h[48]='{ssc:0, inter:0, BE:0, DT:0, VT:0, ST:0, SVT:0}
# h[49]='{ssc:0, inter:0, BE:0, DT:0, VT:0, ST:0, SVT:0}
#  quit -f
*/


///////////////////////////////////////updating data///////////////////////////////////////
/*class BRN57_db;
  int unsigned ssc, inter, BE, DT, VT, ST, SVT;
endclass

module test;
  BRN57_db h[50];
  
  initial begin
    h[19] = new();  // Create object first
    // Then assign values
    h[19].ssc = 98;
    h[19].inter = 86;
    h[19].BE = 79;
    h[19].DT = 70;
    h[19].VT = 70;
    h[19].ST = 67;
    h[19].SVT = 85;
    
    $display("h[%0d]=%p", 19, h[19]);
  end
endmodule

OUTPUT:

# run -all
# h[19]='{ssc:98, inter:86, BE:79, DT:70, VT:70, ST:67, SVT:85}
#  quit -f
*/
/*typedef class account_c;

class account_c;
  int data;
endclass : account_c

module test;
  account_c h1, h2, h3;  // Declare handles inside module
  
  initial begin 
    h1 = new();
    h1.data = 1000;
    h2 = new();
    h2.data = 2000;
    
    // Call the task
    account_status(h1, h2);
  end 
  
  task automatic account_status(ref account_c h1, ref account_c h2);
    if (h1 == null || h2 == null) begin
      h3 = new();
      $display("One of the handles is null");
    end else begin
      $display("h1.data=%d, h2.data=%d", h1.data, h2.data);
    end
  endtask : account_status

endmodule : test 
OUTPUT:
# Loading work.test(fast)
# run -all
# h1.data=       1000, h2.data=       2000
#  quit -f
*/

///////////////////////////////////////constructor//////////////////////////////////////////////
/*class transaction;
	bit [31:0] src,dst;
	 
	function new();
	src=5;
	dst =3;
	endfunction : new
endclass : transaction 
	
	transaction trans_h;
	
module test;
	initial 
		begin 
		trans_h = new();
		$display("contents=%p",trans_h);
		end
endmodule : test 

OUTPUT:
# run -all
# contents='{src:5, dst:3}
#  quit -f
*/

/*class transaction;
	bit [31:0] src,dst;
	 
	function new(int x,int y=3);
	src=x;
	dst =y;
	endfunction : new
endclass : transaction 
	
	transaction trans_h;
	
module test;
	initial 
		begin 
		trans_h = new(5); //y uses default
		$display("contents=%p",trans_h);
		end
endmodule : test 

OUTPUT:
# run -all
# contents='{src:5, dst:3}
#  quit -f
*/

/*class transaction;
	bit [31:0] src,dst;
	 
	function new(int x,int y=3);
	src=x;
	dst =y;
	endfunction : new
endclass : transaction 
	
	transaction trans_h;
	
module test;
	initial 
		begin 
		trans_h = new(5,3); //y uses default
		$display("contents=%p",trans_h);
		end
endmodule : test 

OUTPUT:
# run -all
# contents='{src:5, dst:3}
#  quit -f
*/
////////////////////////////////Accessing members////////////////////////////////
/*
class account_c;
int balance;//class property

function int summary;
return balance ;
endfunction : summary

task deposit (input int pay); //class methods
balance = balance+pay;
endtask : deposit 
endclass : account_c

module test;
initial
begin 
	account_c acnt_h=new;
	acnt_h.deposit(2000);//access of class instance tasks
	$display("balance is %d",acnt_h.summary());
	//access instance function 
	$display("balance is %d",acnt_h.balance);
	//access instance property
end 
endmodule : test

OUTPUT: 
# Loading work.test(fast)
# run -all
# balance is        2000
# balance is        2000
#  quit -f
*/

/*class transaction ;
	bit [3:0] data;
	bit [15:0] addr;
	bit [15:0] mem;
endclass : transaction

transaction trans_h1;
transaction trans_h2;

module test;
	initial 
		begin 
			trans_h1 = new;
			trans_h1.addr=10;
			trans_h1.addr =200;
			trans_h1.mem = 30;
		trans_h2 =new trans_h1;
		$display("data1=%p,data2=%p,data3=%p",trans_h1,trans_h2,trans_h1.data);
		end 
endmodule : test

OUTPUT:
# Loading work.test(fast)
# run -all
# data1='{data:0, addr:200, mem:30},data2='{data:0, addr:200, mem:30},data3=0
#  quit -f
*/
////////////////////////////////object assignment ////////////////////////////////////////////////////////////////
class transaction;
int data;
endclass:transaction 

transaction trans_h1;
transaction trans_h2;
initial 
	begin 
		trans_h1 = new();
		trans_h1.data=10;
		trans_h2=new();
		trans_h2.data=20;
		trans_h2=trans_h1;
		trans_h2.data=50;
		$display("%d",trans_h1.data);
	end 
endclass 

////////////////////////////////shallow copy////////////////////////////////////////////////////////////////
/*class sub_class;
int obj;//sub class 
endclass : sub_class

class transaction;
	int data;
	sub_class sub_h = new(); //member (main) class object
endclass : transaction 

transaction trans_h1;
transaction trans_h2;


module test;
initial 
	begin
		trans_h1 = new;
		trans_h1.data = 4;
		trans_h1.sub_h.obj =5;
		
		trans_h2 = new trans_h1; //shallow copy
		$display("data1=%p,data2=%p,data3=%p",trans_h1,trans_h1.data,trans_h1.sub_h.obj);
	end 
endmodule : test

OUTPUT:

# run -all
# data1='{data:4, sub_h:@sub_class@1},data2=4,data3=5
#  quit -f
*/

/*class sub_class;
  int obj;
endclass : sub_class

class transaction;
  int data;
  sub_class sub_h = new();  // member class object
endclass : transaction

transaction trans_h1, trans_h2;

module test;
  initial
    begin
      trans_h1 = new;
      trans_h1.data = 4;
      trans_h1.sub_h.obj = 5;

      trans_h2 = new trans_h1; // shallow copy
$display("trans_h1.sub_h.obj=%d, trans_h2.sub_h.obj=%d ",trans_h1.sub_h.obj,trans_h2.sub_h.obj);
    end
endmodule : test

OUTPUT:
# run -all
# trans_h1.sub_h.obj=          5, trans_h2.sub_h.obj=          5
#  quit -f*/

////////////////////////////////////////////////////////Deep copy////////////////////////////////////////////////////////
/*class main;
	int data;
	int addr;
endclass : main

main m1,m2;

module test;
	initial	
		begin 
			m1 = new;
			m1.data = 100;
			m1.addr = 200;
			
			m2 = new;
		//deep copy 
		m2.data = m1.data;
		m2.addr = m1.addr;
		$display("m1=%p,m1.data=%p,m1.addr=%p,m2.data=%p,m2.addr=%p",m1,m1.data,m1.addr,m2.data,m2.addr);
		$display("m1=%p, m2=%p", m1, m2);
		end 
endmodule : test

OUTPUT:

# m1='{data:100, addr:200},m1.data=100,m1.addr=200,m2.data=100,m2.addr=200
# m1='{data:100, addr:200}, m2='{data:100, addr:200}
*/

/*class subclass;
  int obj;
endclass

class main;
  int data;
  subclass sub_h = new();
endclass

main m1, m2;  // m1, m2 are null objects initially

module test;
  initial
  begin
    m1 = new;       // Deep copy (DC)
    m1.data = 10;
    m1.sub_h.obj = 5;

    m2 = new;
    m2.data = m1.data;             // Copy primitive type
    m2.sub_h.obj = m1.sub_h.obj;   // Copy value, not handle (still shallow in effect)
    
    $display("m1.data = %0d", m1.data);            // 10
    $display("m1.sub_h.obj = %0d", m1.sub_h.obj);  // 5
      $display("m2.data = %0d", m2.data);            // 10
    $display("m2.sub_h.obj = %0d", m2.sub_h.obj);  // 5
   end
endmodule

OUTPUT:
# run -all
# m1.data = 10
# m1.sub_h.obj = 5
# m2.data = 10
# m2.sub_h.obj = 5
#  quit -f
*/

/*class sub;
  int obj;
endclass

class main;
  int data;
  sub sh = new();

  function main copy();
    copy = new();                     
    copy.data = this.data;           
    copy.sh.obj = this.sh.obj;       
  endfunction
endclass

main m1, m2;

module test;
  initial 
  begin
    m1 = new;
    m1.data = 10;
    m1.sh.obj = 20;

    m2 = m1.copy();  

    $display("m1.data = %0d", m1.data);       // 10
    $display("m1.sh.obj = %0d", m1.sh.obj);   // 20
    $display("m2.data = %0d", m2.data);       // 10
    $display("m2.sh.obj = %0d", m2.sh.obj);   // 20
  end
endmodule

OUTPUT:

# run -all
# m1.data = 10
# m1.sh.obj = 20
# m2.data = 10
# m2.sh.obj = 20
#  quit -f
*/

/*class sub;
	int obj;

	function sub copy2();
		copy2 = new();
		copy2.obj = this.obj;
	endfunction : copy2
endclass : sub
	

class main ;
	int data;
	sub s = new();
	
	function main copy1();
		copy1 = new();
		copy1.data = this.data;
		copy1.s = this.s.copy2;  //shallow copy 
	endfunction : copy1
endclass : main 
module test;
	initial 
		begin 
		main m1,m2; 
		m1 = new;
		m1.data = 10;
		m1.s.obj = 20;
		
		m2 = m1.copy1(); //shallow copy 
		
		$display("m1.data = %0d", m1.data);
		$display("m2.s.obj = %0d", m1.s.obj);
		$display("m2.data = %0d", m2.data);
		$display("m2.s.obj = %0d",m2.s.obj);
		end 
endmodule : test

OUTPUT:

# run -all
# m1.data = 10
# m2.s.obj = 20
# m2.data = 10
# m2.s.obj = 20
#  quit -f
*/

/*class sub;
int obj;

	function sub copy2();
		copy2 = new();
		copy2.obj = this.obj;
	endfunction : copy2
endclass : sub 

class main ;
	int data;
	sub s = new();
	
	function main copy1();
		copy1 = new();
		copy1.data = this.data;
		copy1.s = this.s;
	endfunction : copy1
endclass : main 


module test;
	initial 
		begin 
		main m1,m2;
		m1 = new();
		m1.data = 10;
		m1.s.obj = 20;
		
		m2 = m1.copy1();  //shallow copy 
		 $display("m1.data = %0d", m1.data);       // 10
		$display("m1.s.obj = %0d", m1.s.obj);     // 20
		$display("m2.data = %0d", m2.data);       // 10
		$display("m2.s.obj = %0d", m2.s.obj);     // 20
		end
endmodule
OUTPUT:
# run -all
# m1.data = 10
# m1.s.obj = 20
# m2.data = 10
# m2.s.obj = 20
#  quit -f
*/
