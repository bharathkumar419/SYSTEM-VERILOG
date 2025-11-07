//////////////////////////////////////////constraints //////////////////////////////////////////
/*class transaction;
	rand bit [15:0] pkt_length;//16 bits
	constraint undersize{pkt_length<=16'd64;}
endclass : transaction 

transaction trans_h = new();

module test();
initial 
	begin 
		int success;
		for (int i=0;i<16;i++)
			begin 
				success = trans_h.randomize();
				$display("pkt_length is %d",trans_h.pkt_length);
			end 
	end 
endmodule : test */

/*OUTPUT:

# run -all
# pkt_length is    11
# pkt_length is     0
# pkt_length is    27
# pkt_length is     3
# pkt_length is     2
# pkt_length is    39
# pkt_length is    22
# pkt_length is    16
# pkt_length is    11
# pkt_length is    46
# pkt_length is    25
# pkt_length is     9
# pkt_length is    20
# pkt_length is    64
# pkt_length is    14
# pkt_length is    41
#  quit -f */

/*class transaction;
    rand bit [15:0] pkt_length; //16 bits
    constraint undersize {pkt_length <= 16'd64;}
endclass : transaction 

transaction trans_h = new();

module test();
    initial 
    begin 
        int success;
        for (int i=0; i<16; i++)
        begin 
            if(trans_h.pkt_length.rand_mode() == 1)
                $display("Randomization is enabled for pkt_length");
            else 
                trans_h.pkt_length.rand_mode(1); // Enable randomization
            
            success = trans_h.randomize();
            $display("pkt_length is %d", trans_h.pkt_length);
        end 
    end 
endmodule : test

OUTPUT:
# run -all
# Randomization is enabled for pkt_length
# pkt_length is    11
# Randomization is enabled for pkt_length
# pkt_length is     0
# Randomization is enabled for pkt_length
# pkt_length is    27
# Randomization is enabled for pkt_length
# pkt_length is     3
# Randomization is enabled for pkt_length
# pkt_length is     2
# Randomization is enabled for pkt_length
# pkt_length is    39
# Randomization is enabled for pkt_length
# pkt_length is    22
# Randomization is enabled for pkt_length
# pkt_length is    16
# Randomization is enabled for pkt_length
# pkt_length is    11
# Randomization is enabled for pkt_length
# pkt_length is    46
# Randomization is enabled for pkt_length
# pkt_length is    25
# Randomization is enabled for pkt_length
# pkt_length is     9
# Randomization is enabled for pkt_length
# pkt_length is    20
# Randomization is enabled for pkt_length
# pkt_length is    64
# Randomization is enabled for pkt_length
# pkt_length is    14
# Randomization is enabled for pkt_length
# pkt_length is    41
#  quit -f
*/

/*class transaction;
	rand bit [15:0] pkt_length;//16 bits
	constraint undersize{pkt_length<=16'd64;}
endclass : transaction 

transaction trans_h = new();

module test();
initial 
	begin 
		int success;
		if(trans_h.pkt_length.rand_mode())
		begin 
			for (int i=0;i<16;i++)
			success = trans_h.randomize();
		end 
		trans_h.undersize.constraint_mode(0);
		success=trans_h.randomize();
		trans_h.undersize.constraint_mode(1);
		success = trans_h.randomize();
		$display("success is %p",success);
	end 
endmodule : test

OUTPUT:

# run -all
# success is 1
#  quit -f
*/
//////////////////////////////////////////constraint and inheritance//////////////////////////////////////////
/*
class transaction;
	rand bit [15:0] pktlength;
	constraint oversize{pktlength>=16'hf000;}//constraint oversizelimit
endclass : transaction 

class trans_ext extends transaction;
	constraint undersize {pktlength<=16'hff50;}
endclass: trans_ext

trans_ext tex_h=new;

module test;
initial 
	begin 
		assert(tex_h.randomize());
		$display("pktlength for green is %b",tex_h.pktlength);
	end 
endmodule : test

OUTPUT:

# Loading work.test(fast)
# run -all
# pktlength for green is 1111001000011101
#  quit -f
*/

//////////////////////////////////////////constraint overriding ///////////////////////////////
/* 
class transaction;  //since randomize function is virtual constraints acts as a virtual 
	rand bit [15:0] pktlength;
	constraint oversize{pktlength>=16'hf000;}//constraint oversizelimit
endclass : transaction 

class trans_ext extends transaction;
	constraint undersize {pktlength<=16'hff50;}
endclass: trans_ext

trans_ext tex_h=new;

module test;
initial 
	begin 
		int success;
		success=tex_h.randomize();
		$display("pktlength for green is %b",tex_h.pktlength);
	end 
endmodule : test

OUTPUT:

# Loading work.test(fast)
# run -all
# pktlength for green is 1111001000011101
#  quit -f
*/

//////////////////////////////////////////soft constraint //////////////////////////////////////////
/*
class packet;
	rand bit [3:0] addr;
	constraint addr_range {soft addr>100;}
endclass : packet 

packet pkt_h;

module test();
initial 
	begin 
		pkt_h= new(); //object is created 
		repeat(2)
		begin 
		assert(pkt_h.randomize() with {addr<6;})
		$display("\taddr=%d",pkt_h.addr);
		end
	end 
endmodule : test

OUTPUT:

# run -all
#       addr= 2
#       addr= 2
#  quit -f
*/

///////////////////////////////////SET MEMBERSHIP///////////////////////////////////
/*
class transaction;
	rand bit [3:0] addr;
	constraint adc {addr inside {3,7,[11:15]};}
endclass : transaction 

transaction trans_h;

module test();
initial 
	begin 
		int success;
		trans_h = new();
		success =trans_h.randomize();
		$display("success=%d",success);
		$display("addr is %d",trans_h.addr);
	end 
endmodule : test

OUTPUT:
# run -all
# success=          1
# addr is  7
#  quit -f
*/
 
 
/*class transaction;
	rand bit [3:0] addr;
	bit [3:0] addr_previous [] = {1,2,3,5,8,10};
	constraint addr_range{addr inside {addr_previous};}
endclass : transaction

transaction trans_h;

module test();
initial 
	begin 
		int success;
		trans_h = new();
		success =trans_h.randomize();
		$display("success=%d",success);
		$display("addr is %d",trans_h.addr);
	end 
endmodule : test

OUTPUT:
# run -all
# success=          1
# addr is  2
#  quit -f
*/

////////////////////////
////////////////////////INLINE CONSTRAINT /////////////////////////////////////////////////////////////
/*class inline;
	rand bit [7:0] x,y,z;
	constraint c{z==x+y;} //1st condition as == declarative 
endclass : inline 

inline  in_h;

module test;
initial 
	begin 
	in_h = new;
	if(!(in_h.randomize() with {x<y;}))
	$display("randomization failed");
	$display("in_h=%d",in_h);
	end 
endmodule : test

OUTPUT:
# run -all
# in_h=65538
#  quit -f
*/


////////////////////////////////////////////////DISTRIBUTION constraint////////////////////////////////////////////////
/*class transaction;
	rand int vlantag;
	constraint tag {vlantag dist{7:=5,[11:20]:=3,[26:30]:/5};}
endclass : transaction 

transaction trans_h = new();

module test;
initial 
	begin 
		int success;
		success=trans_h.randomize();
		$display("tag is %d",trans_h.vlantag);
	end 
endmodule : test

OUTPUT:

# run -all
# tag is          11
#  quit -f
*/

////////////////////////////////////////////////CONDITIONAL CONSTARINT////////////////////////////////////////////////
/*class transaction;
	rand bit vlantag;
	bit mode;
	constraint tag{mode ==1->vlantag<96;
					mode ==0->vlantag<1248;}
endclass : transaction 

transaction trans_h = new();

module test();
initial 
	begin 
		int success;
		trans_h.mode=1;
		success =trans_h.randomize();
		$display("tag is %d",trans_h.vlantag);
	end 
endmodule : test

OUTPUT:
# run -all
# tag is 1
#  quit -f
*/

/*class transaction;
	rand bit vlantag;
	bit mode;
	constraint tag{if(mode ==1)
					vlantag<96;
					else if (mode ==0)
					vlantag<1248;}
endclass : transaction 

transaction trans_h = new();

module test();
initial 
	/*begin 
		int success;
		trans_h.mode=1;
		success =trans_h.randomize();
		$display("tag is %d",trans_h.vlantag);
	end 
	
	begin 
		int success;
		trans_h.mode=0;
		success =trans_h.randomize();
		$display("tag is %d",trans_h.vlantag);
	end 
endmodule : test */


/////////////////////////Static constraint ///////////////////////////////////
/* A static constraint is a constraint block declared with the static keyword, which means:

1.It's shared across all instances of the class

2.Any modifications to the constraint affect all instances

3.It exists at the class level rather than the instance level*/

/*class transaction;
	rand bit [3:0] addr;
	static constraint valid_addr {addr>8;}
endclass : transaction 

module test();
initial 
	begin 
		transaction t1_h,t2_h;
		t1_h = new();
		t2_h = new();
		
		assert (t1_h.randomize()); //addr>8
		
		t2_h.addr_range.constraint_mode(0);
		
		assert(t1_h.randomize()); //addr inside {[0:15]}
		assert(t2_h.randomize()); //addr inside {[0:15]}
		$display("t1_h=%d,t2_h=%d",t1_h,t2_h);
	end 
endmodule : test  */

/*class transaction;
    rand bit [3:0] addr;
    static constraint valid_addr {addr > 8;}  // Fixed constraint name
endclass : transaction 

module test();
    initial 
    begin 
        transaction t1_h, t2_h;
        t1_h = new();
        t2_h = new();
        
        assert(t1_h.randomize()); // addr > 8 (9-15)
        $display("t1_h.addr = %0d", t1_h.addr);
        
        // Correct way to disable static constraint
        transaction::valid_addr.constraint_mode(0);
        
        assert(t1_h.randomize()); // addr inside {[0:15]}
        assert(t2_h.randomize()); // addr inside {[0:15]}
        
        $display("After disabling constraint:");
        $display("t1_h.addr = %0d, t2_h.addr = %0d", t1_h.addr, t2_h.addr);
    end 
endmodule : test

OUTPUT:

# run -all
# t1_h.addr = 10
# After disabling constraint:
# t1_h.addr = 15, t2_h.addr = 5
#  quit -f
# End time: 11:*/

/////////////////////////extern constraint//////////////////////////////////////////////////
/*In SystemVerilog, extern constraints allow you to declare a constraint prototype inside a class and then define its implementation outside the class body. This is useful for:

1.Keeping class definitions clean (separating constraints from class structure)

2.Enhancing readability (especially for complex constraints)

3.Conditionally enabling/disabling constraints (useful in testbench scenarios)

Feature	Description
Separation of Concerns	| Constraints can be defined outside the class body, improving modularity.
Conditional Constraints	 | Can be enabled/disabled using constraint_mode().
Reusability	| Same constraint can be reused across multiple classes.
Dynamic Control	| Can be modified at runtime (unlike static constraints, which affect all instances).*/

/*class packet;
	rand bit [3:0] addr;
	constraint valid_addr;
endclass : packet 

constraint packet :: valid_addr{addr < 10;}
module test();
	initial 
		begin 
			packet pkt;
			pkt = new();
			repeat(2)
				begin 
					assert(pkt.randomize() with {addr < 5;});
					$display("t/addr = %d",pkt.addr);
				end 
		end 
endmodule : test 

OUTPUT:

# run -all
# t/addr =  1
# t/addr =  1
#  quit -f
*/


// First define the packet class
/*class packet;
    rand int start_addr;
    rand int end_addr;
endclass

module test;
    initial begin 
        packet pkt;
        pkt = new();
        repeat(3) begin 
            assert(pkt.randomize()) else $fatal("Randomization failed");
            $display("t\tstart_addr = %0d, end_addr = %0d", pkt.start_addr, pkt.end_addr);
        end 
    end 
endmodule : test

OUTPUT:

# run -all
# t     start_addr = 127207854, end_addr = -1055286653
# t     start_addr = 1806994106, end_addr = 334028209
# t     start_addr = -1382656938, end_addr = -1130236197
#  quit -f
*/

/*module test;
int a,b;
bit success;
initial 
	begin 
	success = std::randomize(a,b) with {a>10; a>20; b<100; b>50;};
	$display("a=%d,b=%d",a,b);
	end 
endmodule : test

OUTPUT:

# run -all
# a= 1519887572,b=         81
#  quit -f
*/

