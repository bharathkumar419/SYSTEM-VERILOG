/*class transaction ;
	int i;
endclass : transaction 

class extnd_trans extends transaction;
	int j;
endclass : extnd_trans 

transaction trans_h; //BCH
extnd_trans ext_h;//ECH

module test();
	initial 
		begin 
		trans_h = new(); //BC class object
		trans_h.i = 5; 
		
		ext_h = new();	//EC
		ext_h.i = 10;
		ext_h.j = 20;
		
		$display("%p",trans_h); //{i=5}
		$display("%p",ext_h);//{i=10,j=20}
		end
endmodule : test

OUTPUT:

# run -all
# '{i:5}
# '{i:10, j:20}
#  quit -f
*/

/*class transaction;
	bit [7:0] header,payload[],parity;
endclass : transaction 

class error_trans extends transaction;
	bit error_parity;
endclass: error_trans

transaction trans_h; //BCH
error_trans error_h;//ECH

module tb;
initial 
	begin 
		error_h = new(); //EC
		error_h.header=5;
		error_h.error_parity=20;
		//trans_h.header =10;
		$display("extended class =%p",error_h);
		$display("BC=%p",trans_h);
	end 
endmodule 

OUTPUT:

# run -all
# extended class ='{header:5, payload:'{}, parity:0, error_parity:0}
# BC=null
#  quit -f
*/


////////////////////////////////////////////////////////////////
/*
 class transaction;
	bit [7:0] header,payload[],parity;
endclass : transaction 

class error_trans extends transaction;
bit error_parity;
endclass: error_trans

transaction trans_h;//ECH
error_trans error_h;//ECH

module tb;
initial 
	begin 
		error_h = new();
		error_h.header=5;
		error_h.error_parity=20;
		trans_h.header =10;
		$display("extended class =%p",error_h);
		$display("BC=%p",trans_h);
	end 
endmodule

OUTPUT:
# ** Fatal: (SIGSEGV) Bad handle or reference.
#    Time: 0 ns  Iteration: 0  Process: /tb/#INITIAL#80 File: adoops.sv
# Fatal error at adoops.sv line 82
#
# HDL call sequence:
# Stopped at adoops.sv 82
#
#  quit -f
*/

/*class  m_800;
m_800 properties;
m_800 methods;
endclass : m_800

m_800 m_801[1000];

module test;
	initial 
		begin 
			foreach (m_801[i])
				m_801[i] = new();
			$display("m_801=%p",m_801);
		end 
endmodule :test

OUTPUT:
 m_801='{@m_800@1, @m_800@2, .................
@m_800@997, @m_800@998, @m_800@999, @m_800@1000}
*/

/*class m_zen extends m_800;
	m_zen properties;
	m_zen methods;
endclass 

m_zen m_zen1[10];
module test;
initial 
	begin 
		foreach (m_zen1[i])
		m_zen1[i] = new;
		$display("m_zen1=%p",m_zen1);
	end 
endmodule 

OUTPUT:
# run -all
# m_zen1='{@m_zen@1, @m_zen@2, @m_zen@3, @m_zen@4, @m_zen@5, @m_zen@6, @m_zen@7, @m_zen@8, @m_zen@9, @m_zen@10}
#  quit -f
*/

/*class account_c;
	int balance=0;//overridden by subclass balance property
	function int summary;
	return balance;
	endfunction : summary 
endclass : account_c

class linked_account extends account_c;
int balance;//overridden parent class 
//property balance 
function bit summary ;//class method
return balance + super.balance;
endfunction : summary
endclass : linked_account 

account_c p;
linked_account l;

module test;
	initial 
		begin 
			p=new();
			l=new();
			p.balance=500;
			l.balance=300;
			$display("p=%p",p);
			$display("1=%p",l);
		end 
endmodule 

OUTPUT:
# run -all
# p='{balance:500}
# 1='{balance:0, balance:300}
#  quit -f
*/


/*class account_c;
int balance=0; //overridden by extended class property 
	function int summary;
	return balance ;
	endfunction : summary 
endclass : account_c

class linked_account extends account_c;
	int balance; //overrides base class 
	//property balance 
	function int summary();
	return balance+super.balance;
	endfunction : summary
	
	function void set_super_balance(int b);
		super.balance = b;
	endfunction 
endclass : linked_account

account_c p;
linked_account a;

module test;
	int result;
	initial 
		begin 
			p=new();
			a=new();
			p.balance = 500;
			a.balance = 300;
			a.set_super_balance(200);
			result=a.summary();
			$display("sum is linked_account summary() = %d", result);
			p.summary();
			$display("p=%p",p);
			$display("a=%p",a);
		end 
endmodule 

OUTPUT:
** Warning: adoops.sv(214): (qverilog-2240) Treating stand-alone use of function 'summary' as an implicit VOID cast.
# run -all
# sum is linked_account summary() =         500
# p='{balance:500}
# a='{balance:200, balance:300}
#  quit -f
*/

////////////////////////////super.new////////////////////////////////////////////////////////
/*class account_c;
	int balance;
	
	function new(int pay);
	balance = pay;
	endfunction : new
	
	function void display; 
	$display("balance=%0d",balance);
	endfunction 
endclass : account_c

class linked_account extends account_c;
	int value;
	
		function new(int value);
		super.new(value);
		endfunction : new 
endclass : linked_account

linked_account lin_h;

module top;
initial 
	begin 
		lin_h = new(500);
		lin_h.display;
	end 
endmodule 

OUTPUT:

# run -all
# balance=500
#  quit -f
*/

/*class account_c;
	int balance;
	
	function new(int pay);
	balance = pay;
	endfunction : new
	
	function void display; 
	$display("balance=%0d",balance);
	endfunction 
endclass : account_c

class linked_account extends account_c;
	
		function new(int value);
		super.new(value);
		endfunction : new 
endclass : linked_account

linked_account lin_h;

module top;
initial 
	begin 
		lin_h = new(500);
		lin_h.value=20;
		lin_h.display;
	end 
endmodule 
 
OUTPUT:
** Error (suppressible): (qverilog-13276) adoops.sv(292): Could not find field/method name (value) in 'lin_h' of 'adoops_sv_unit::lin_h.value'.
End time: 22:18:15 on Jul 31,2025, Elapsed time: 0:00:01
Errors: 1, Warnings: 0
 */
///////////////////////////chaining constructor/////////////////////////////////
/*module test;
	class par_trans;
	int a;
	function new(int a=7);
		this.a =a;
	endfunction : new
	endclass : par_trans
	
	
	class child_trans extends par_trans(7);
		int b;
	endclass : child_trans
	
	child_trans c_h;
	initial 
		begin 
			c_h=new();
			$display("c_h=%p",c_h);
		end 
endmodule : test

OUTPUT:

# run -all
# c_h='{a:7, b:0}
#  quit -f
*/


/*module test;
	class par_trans;
	int a;
	function new(int a=7);
		this.a =a;
	endfunction : new
	endclass : par_trans
	
	
	class child_trans extends par_trans(7);//order/position
		int b;
	endclass : child_trans
	
	child_trans c_h;
	initial 
		begin 
			c_h=new();
			$display("c_h=%d",c_h);
		end 
endmodule : test

OUTPUT:

# run -all
# c_h=65539
#  quit -f
*/

////////////////////////////////////static properties////////////////////////////////////////////////
/*class packet;
    static int PKTC=0;
    int ID;
    function new();
        ID = PKTC++;
    endfunction
endclass : packet

class generator;
    task start();
        packet pkt_h=new();
        $display("pkt_h.ID = %d", pkt_h.ID);
    endtask : start
endclass : generator 

module test;
    initial begin
        // First declare all variables
        generator ogen[2];
        generator egen[10];
        int i;  // Declare loop variable
        
        // Then write executable statements
        foreach (ogen[i]) begin
            ogen[i] = new();
        end
        
        ogen[0].start(); // ID=0, PKTC=1
        ogen[1].start(); // ID=1, PKTC=2

        foreach (egen[i]) begin 
            egen[i] = new();
            egen[i].start();
            $display("egen[%0d] = %p", i, egen[i]);
        end
    end
endmodule

OUTPUT:

# run -all
# pkt_h.ID =           0
# pkt_h.ID =           1
# pkt_h.ID =           2
# egen[0] = '{}
# pkt_h.ID =           3
# egen[1] = '{}
# pkt_h.ID =           4
# egen[2] = '{}
# pkt_h.ID =           5
# egen[3] = '{}
# pkt_h.ID =           6
# egen[4] = '{}
# pkt_h.ID =           7
# egen[5] = '{}
# pkt_h.ID =           8
# egen[6] = '{}
# pkt_h.ID =           9
# egen[7] = '{}
# pkt_h.ID =          10
# egen[8] = '{}
# pkt_h.ID =          11
# egen[9] = '{}
#  quit -f
*/

/*class packet;
	int PKTC=0;
    int ID;
    function new();
        ID = PKTC++;
    endfunction
endclass : packet

class generator;
    task start();
        packet pkt_h=new();
        $display("pkt_h.ID = %d", pkt_h.ID);
    endtask : start
endclass : generator 

module test;
    initial begin
        // First declare all variables
        generator ogen[2];
        generator egen[10];
        int i;  // Declare loop variable
        
        // Then write executable statements
        foreach (ogen[i]) begin
            ogen[i] = new();
        end
        
        ogen[0].start(); // ID=0, PKTC=1
        ogen[1].start(); // ID=1, PKTC=2

        foreach (egen[i]) begin 
            egen[i] = new();
            egen[i].start();
            $display("egen[%0d] = %p", i, egen[i]);
        end
    end
endmodule

OUTPUT:

# run -all
# pkt_h.ID =           0
# pkt_h.ID =           0
# pkt_h.ID =           0
# egen[0] = '{}
# pkt_h.ID =           0
# egen[1] = '{}
# pkt_h.ID =           0
# egen[2] = '{}
# pkt_h.ID =           0
# egen[3] = '{}
# pkt_h.ID =           0
# egen[4] = '{}
# pkt_h.ID =           0
# egen[5] = '{}
# pkt_h.ID =           0
# egen[6] = '{}
# pkt_h.ID =           0
# egen[7] = '{}
# pkt_h.ID =           0
# egen[8] = '{}
# pkt_h.ID =           0
# egen[9] = '{}
#  quit -f
*/

////////////////////////////////////////////////Global constant ////////////////////////////////////////////////
/*module test;
	class trans;
	const int a=10; //declare a global constant 
					//for global constant value should be assigneed while 
					//declaration and it can be declared as static also 
	endclass : trans 
	
	trans t1;
	initial 
		begin 
			t1= new();
			//t1.a = 20;//error as we cannot assign a value to global constant outside 
			$display("t1=%d",t1);
		end 
endmodule : test 

OUTPUT:

# run -all
# t1=65538
#  quit -f
*/

////////////////////////////////static Methods ////////////////////////////////
/*class transaction ;
	static int i;
	int j;
	static function void stat_fun();
		int b;
		i++;
		b++;
		$display("stat_fun,i=%0d,b=%0d",i,b);
	endfunction : stat_fun 
	
	function static void fun_stat();
		int a;
		j++;
		a++;
		$display("fun_stat,j=%0d, a=%od",j,a);
	endfunction : fun_stat
	
endclass : transaction 

module test;
transaction t[];
	initial 
		begin 
		t = new[5];
		foreach (t[i])
			begin 
				t[i] = new();
				t[i].stat_fun();
			end 
		foreach (t[i])
			begin 
				t[i].fun_stat();
			end 
		end 
endmodule 

OUTPUT:

# run -all
# stat_fun,i=1,b=1
# stat_fun,i=2,b=1
# stat_fun,i=3,b=1
# stat_fun,i=4,b=1
# stat_fun,i=5,b=1
# fun_stat,j=1, a=00000000001d
# fun_stat,j=1, a=00000000002d
# fun_stat,j=1, a=00000000003d
# fun_stat,j=1, a=00000000004d
# fun_stat,j=1, a=00000000005d
#  quit -f
*/


/*class transaction;
  int a;

  function new(int a);
    this.a = a;
  endfunction
endclass

class extnd_trans extends transaction(9);
   int b; 
endclass

module test;
  extnd_trans ext_h;
  //transaction t;

  initial begin
    ext_h = new();
    $display(  " atrans=%d", ext_h.a);
  end
endmodule

OUTPUT:

# run -all
#  atrans=          9
#  quit -f
*/

/*
class transaction;
const int a;

function new(int a);
	this.a=a; //value should be assigned insisde the constructor it cannot be declared as static 
endfunction : new 

endclass : transaction 

transaction trans_h;

module test();
	initial 
		begin 
			trans_h = new(10);
			//trans_h.a =20;  //error : cannot assign a value outside the class 
			$display("trans_h =%p",trans_h);
		end 
endmodule : test

OUTPUT:

# run -all
# trans_h ='{a:10}
#  quit -f
*/



////////////////////////////////////POLYMORPHISM////////////////////////////////////////////////
//or with bc extended should be done by the same class 
/*
class base_c;
    virtual function void send();
        //drives the even parity //BC
        $display("Base class: driving even parity");
    endfunction : send 
endclass : base_c

class ec1_c extends base_c;
    virtual function void send();
        //drives the odd parity //EC1
        $display("EC1 class: driving odd parity");
    endfunction : send 
endclass : ec1_c

class ec2_c extends base_c;
    virtual function void send();
        //drives odd parity //EC2
        //with the delay 
        $display("EC2 class: driving odd parity with delay");
    endfunction : send
endclass : ec2_c

class driver;
    function new(base_c base_h);  //OC
        send_data(base_h);
    endfunction : new 
    virtual function void send_data(base_c base_h);
        base_h.send();
    endfunction : send_data
endclass : driver 

module test;
//TEST1
initial 
begin
    base_c BC = new();
    driver drv1 = new(BC); //OC
end

//TEST2
initial
begin
    ec1_c EC1 = new();
    driver drv2 = new(EC1); //OC
end

//TEST3
initial
 begin
    ec2_c EC2 = new();
    driver drv3 = new(EC2);
end
endmodule : test 

OUTPUT:

# run -all
# Base class: driving even parity
# EC1 class: driving odd parity
# EC2 class: driving odd parity with delay
#  quit -f
*/

/*class parent_trans;
    reg [7:0] header, parity;
    virtual function void calc_par();
        $display("Base class: driving even parity");
    endfunction : calc_par
endclass : parent_trans

class error_trans extends parent_trans;
    bit bad_crc;
    virtual function void calc_par();
        $display("Error_trans class: bad_crc = %0d", bad_crc);
    endfunction : calc_par
endclass : error_trans

module test;
    parent_trans pr_h;
    error_trans e1_h, e2_h;

    initial begin
        e1_h = new();          // Create error_trans object
        pr_h = e1_h;           // Parent handle points to child object (polymorphism)
        pr_h.calc_par();       // Calls error_trans::calc_par()

        // Downcasting using $cast
        if ($cast(e2_h, pr_h)) begin
            e2_h.calc_par();   // Corrected typo: cal_par → calc_par
        end
        else begin
            $display("Cast failed!");
        end
    end
endmodule : test

OUTPUT:
# run -all
# Error_trans class: bad_crc = 0
# Error_trans class: bad_crc = 0
#  quit -f
*/	

/*virtual class packet;
	bit [31:0] arr[0:3];
	pure virtual function void divider_pkt_one ();
endclass : packet 

class IPV4 extends packet;
bit [7:0] arr_4[0:4];
	virtual function void divider_pkt_one();
	arr_4[0]=super.arr[0] [7:0];
	arr_4[1]=super.arr[0] [15:8];
	arr_4[2]=super.arr[0] [23:16];
	arr_4[3]=super.arr[0] [32:24];
	endfunction : divider_pkt_one
endclass : IPV4

class IPV6 extends packet;
	bit [15:0] arr_2[0:1];
	virtual function void divider_pkt_one();
	arr_2[0]=super.arr[0] [15:0];
	arr_2[0]=super.arr[0] [31:16];
	endfunction : divider_pkt_one
endclass : IPV6
*/

/*virtual class packet;
    bit [31:0] arr[0:3];
    pure virtual function void divider_pkt_one();
endclass : packet 

class IPV4 extends packet;
    bit [7:0] arr_4[0:3];  // Changed to size 4 since we're storing 4 bytes
    virtual function void divider_pkt_one();
        arr_4[0] = super.arr[0][7:0];
        arr_4[1] = super.arr[0][15:8];
        arr_4[2] = super.arr[0][23:16];
        arr_4[3] = super.arr[0][31:24];  // Fixed bit-select range
    endfunction : divider_pkt_one
endclass : IPV4

class IPV6 extends packet;
    bit [15:0] arr_2[0:1];
    virtual function void divider_pkt_one();
        arr_2[0] = super.arr[0][15:0];
        arr_2[1] = super.arr[0][31:16];  // Fixed index to arr_2[1]
    endfunction : divider_pkt_one
endclass : IPV6

module top;
    initial begin
        IPV4 ipv4 = new();
        IPV6 ipv6 = new();
        
        // Example usage
        ipv4.arr[0] = 32'hAABBCCDD;
        ipv4.divider_pkt_one();
        $display("IPV4 divided: %h %h %h %h", ipv4.arr_4[0], ipv4.arr_4[1], ipv4.arr_4[2], ipv4.arr_4[3]);
        
        ipv6.arr[0] = 32'h11223344;
        ipv6.divider_pkt_one();
        $display("IPV6 divided: %h %h", ipv6.arr_2[0], ipv6.arr_2[1]);
    end
endmodule

OUTPUT:
# run -all
# IPV4 divided: dd cc bb aa
# IPV6 divided: 3344 1122
#  quit -f
# End time: 
*/

//////////////////////////////p-class with the static properties////////////////////////////////////////
/*class packet # (size=32);
static bit [size-1:0]a;
bit [size-1:0]b;
	function new();
	a++;
	b++;
	endfunction 
endclass : packet 
packet #(8) pkt_h1;
packet pkt_h2;

module test;
initial 
	begin 
	pkt_h1 = new();
	pkt_h2 = new();
	$display("pkt_h1.a=%0d,pkt_h1.b=%0d",pkt_h1.a,pkt_h1.b);
	$display("pkt_h2.a=%0d,pkt_h2.b=%0d",pkt_h2.a,pkt_h2.b);
	end 
endmodule : test

OUTPUT:

# run -all
# pkt_h1.a=1,pkt_h1.b=1
# pkt_h2.a=1,pkt_h2.b=1
#  quit -f
*/

/*class trans #(type T=bit);
	T=new();
	virtual function void display();
	$display("I am in base class");
	endfunction 
endclass : trans

class extend_trans extends trans #(int);
function void display();
	$display("I am in extended class");
endfunction 

module test();
initial 
	begin 
		trans trans_h=new();
		extend_trans ex_h=new();
		trans_h = ex_h;  //ph=ch
		trans_h.display();
	end 
endmodule : test */

/*class trans #(type T=bit);
    T obj;  // Declare a variable of type T

    // Remove obj = new() since T might be a primitive type
    function new();
    endfunction

    virtual function void display();
        $display("I am in base class");
    endfunction 
endclass : trans

class extend_trans extends trans #(int);
    function void display();
        $display("I am in extended class");
    endfunction 
endclass : extend_trans

module test();
    initial begin 
        // trans_h must be declared as trans#(int), but instantiated as extend_trans
        extend_trans ex_h = new();
        trans #(int) trans_h;  // Declare handle
        trans_h = ex_h;  // Polymorphism: base class handle points to derived class
        trans_h.display();  // Calls extended class's display()
        
        // Initialize the int value (since T=int)
        trans_h.obj = 42;
        $display("obj = %0d", trans_h.obj);
    end 
endmodule : test

OUTPUT:
# run -all
# I am in extended class
# obj = 42
#  quit -f
*/

/////////////////////DATA ENCAPSULATION //////////////////////////////////////////
/*module test;
class parent_trans;
	logic [1:0]a;
	protected logic [1:0]b;
	function void display();
	$display("a=%d,b=%d",a,b);
	endfunction : display
	
	function void update(logic[1:0]a,b);
	this.a=a;
	this.b=b;
	endfunction : update 
endclass : parent_trans 

class child_trans extends parent_trans;
	logic[1:0]c;
	function void calc();
	super.display(); //no error protected methods of parent class can be acccesed by the child class 
	super.a=2; //error local variable of parent class cannot be accessed bt child class 
	super.b=1; //no error protected variable of parent class cannot be accessed bt child class
	endfunction  
	endclass : child_trans 
endmodule : test

OUTPUT:
u didn't get any error 
*/

/*module test;
class parent_trans;
	local logic [1:0]a;
	protected logic [1:0]b;
	function void display();
	$display("a=%d,b=%d",a,b);
	endfunction : display
	
	function void update(logic[1:0]a,b);
	this.a=a;
	this.b=b;
	endfunction : update 
endclass : parent_trans 

class child_trans extends parent_trans;
	logic[1:0]c;
	function void calc();
	super.display(); //no error protected methods of parent class can be acccesed by the child class 
	super.a=2; //error local variable of parent class cannot be accessed bt child class 
	super.b=1; //no error protected variable of parent class cannot be accessed bt child class
	endfunction  
	endclass : child_trans 
endmodule : test

OUTPUT:

** Error (suppressible): (qverilog-8688) adoops.sv(945): Illegal access to local member a.
        Full name of member: test.parent_trans::a
        Full name of calling scope: test.child_trans
** Error (suppressible): (qverilog-8688) adoops.sv(945): Illegal access to local member a.
        Full name of member: test.parent_trans::a
        Full name of calling scope: test.child_trans
End time: 16:20:50 on Aug 07,2025, Elapsed time: 0:00:01
Errors: 2, Warnings: 0
*/


/*module test;
class parent_trans;
	local logic [1:0]a;
	logic [1:0]b;
	function void display();
	$display("a=%d,b=%d",a,b);
	endfunction : display
	
	function void update(logic[1:0]a,b);
	this.a=a;
	this.b=b;
	endfunction : update 
endclass : parent_trans 

class child_trans extends parent_trans;
	logic[1:0]c;
	function void calc();
	super.display(); //no error protected methods of parent class can be acccesed by the child class 
	super.a=2; //error local variable of parent class cannot be accessed bt child class 
	super.b=1; //no error protected variable of parent class cannot be accessed bt child class
	endfunction  
	endclass : child_trans 
endmodule : test*/

