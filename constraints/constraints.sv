/*module tb;
  class abc;
    rand bit [7:0] a[];  // Explicit bit width (optional but good practice)
    constraint size { a.size() == 10; }
    constraint mirr { 
      foreach (a[i]) 
        if (i % 2 == 0)
          a[i] == 0;
        else 
          a[i] == (i + 1) / 2;
    }
  endclass 

  abc m_h = new();
  
  initial begin 
    if (m_h.randomize()) begin
      $display("\n\n");
      $write("\t\t\t the required pattern is: ");
      foreach (m_h.a[i])
        $write("%0d ", m_h.a[i]);
      $display("\n\n");
    end
    else begin
      $display("Randomization failed!");
    end
  end 
endmodule : tb

OUTPUT:
 the required pattern is: 0 1 0 2 0 3 0 4 0 5
#
*/

/*module test;
class eve;
	rand int val;
	real out_val;
	
	constraint a1{val inside {[990:1000]};}
	
	function void post_randomize();
	out_val = val/10.0;
	$display("\t\t\t unique value is %2f",out_val);
	endfunction 
endclass 

initial 
	begin 
	eve p1=new();
	repeat(20) 
		begin 
			p1.randomize();
		end 
	end 
endmodule

OUTPUT:
# run -all
#                        unique value is 100.000000
#                        unique value is 99.200000
#                        unique value is 99.000000
#                        unique value is 99.700000
#                        unique value is 99.200000
#                        unique value is 99.600000
#                        unique value is 99.700000
#                        unique value is 99.200000
#                        unique value is 99.900000
#                        unique value is 99.700000
#                        unique value is 99.400000
#                        unique value is 99.800000
#                        unique value is 99.900000
#                        unique value is 99.700000
#                        unique value is 99.000000
#                        unique value is 99.700000
#                        unique value is 99.900000
#                        unique value is 99.800000
#                        unique value is 99.000000
#                        unique value is 99.500000
#  quit -f
*/


//3. Constraint - divisible by 5.
/*class abc;
rand bit [7:0] a;
constraint divby5 {a%5==0;}
endclass 

module tb;
abc m_h = new();

initial 
	begin 
	repeat (5)
		begin 
		m_h.randomize();
		$display("A%%5=%d",m_h.a);
		end 
	end 
endmodule

OUTPUT:
# run -all
# A%5= 75
# A%5=220
# A%5= 40
# A%5=190
# A%5= 75
#  quit -f
*/

//4. Derive odd numbers within the range of 10 to 30 using SV constraint.
/*class abc;
rand bit [7:0] a;
constraint odd {a inside {[10:30]};
				a%2 ==1;}
endclass 

module tb;
abc m_h = new();

initial 
	begin 
	repeat(15) 
		begin 
		m_h.randomize;
			if(m_h.a%2 ==1)
			$display("\t\t\t odd number =%d",m_h.a);
			else 
			$display("%0d is not an odd number",m_h.a);
		end 
	end 
endmodule : tb

OUTPUT:

# run -all
#                        odd number = 27
#                        odd number = 23
#                        odd number = 25
#                        odd number = 23
#                        odd number = 25
#                        odd number = 19
#                        odd number = 29
#                        odd number = 27
#                        odd number = 29
#                        odd number = 15
#                        odd number = 29
#                        odd number = 23
#                        odd number = 15
#                        odd number = 19
#                        odd number = 13
#  quit -f
# End time:*/

/*5. Write a constraint for 4-bit dynamic array. The size of the array 
should be in between 15 to 20. There should be even number in odd 
locations and odd number in even locations. */
/*class abc;
	rand bit [3:0] a[];
	int i;
	constraint arr_size {a.size() inside {[15:20]};}
	
	constraint odd_pos {foreach (a[i]) {
						if(i%2 ==0)
							a[i]%2 ==1;
						else 
							a[i]%2 ==0;
							}
							}
function  void display();
	$display("\t\t\t*.........size =%d..........*\n",a.size());
		foreach (a[i]) begin 
				if(i%2 ==0)
					$write("\tindex=%d(even location) ",i);
				else 
					$write("\tindex=%d(odd location) ",i);
					
				if(a[i]%2 ==0)
					$display("\tindex=%d(even number) ",a[i]);
				else 
					$display("\tindex=%d(odd number) ",a[i]);
				end 
			endfunction 
			endclass 
			
			module test;
			abc m_h =new();
			
			initial 
				begin 
				repeat(5)
					begin 
						m_h.randomize();
						m_h.display();
					end 
				end 
			endmodule 
*/

/*6. Write a constraint for two random variables such that one 
variable should not match with the other & the total number of bits 
toggled in one variable should be 5 w.r.t the other*/
/*class abc;
	rand bit [7:0] datain;
	rand bit [7:0] prev_data;
	
	constraint d1{datain !=prev_data;}
	constraint ones{$countones(datain) ==5;}
endclass 

module tb;
abc m_h;
initial 
begin 
m_h = new();
	repeat(25)
	begin 
	m_h.randomize();
	$display("\t\t\tprevious_data =%0b",m_h.prev_data);
	$display("\t\t\tdata =%0b\n",m_h.datain);
	end 
end 
endmodule 

OUTPUT:
# run -all
#                       previous_data =10100001
#                       data =11111000
#
#                       previous_data =11000011
#                       data =1011101
#
#                       previous_data =11000010
#                       data =10110011
#
#                       previous_data =101101
#                       data =11001110
#
#                       previous_data =11101110
#                       data =10011110
#
#                       previous_data =110100
#                       data =11111000
#
#                       previous_data =101111
#                       data =10101101
#
#                       previous_data =11010
#                       data =11000111
#
#                       previous_data =10101110
#                       data =1110011
#
#                       previous_data =11101
#                       data =11011001
#
#                       previous_data =10101111
#                       data =11011100
#
#                       previous_data =110110
#                       data =10011110
#
#                       previous_data =101110
#                       data =11100110
#
#                       previous_data =11101100
#                       data =1010111
#
#                       previous_data =100
#                       data =10101101
#
#                       previous_data =1110001
#                       data =11111000
#
#                       previous_data =11
#                       data =11000111
#
#                       previous_data =100101
#                       data =11101010
#
#                       previous_data =1001001
#                       data =11010101
#
#                       previous_data =10111011
#                       data =10111001
#
#                       previous_data =10100
#                       data =11101001
#
#                       previous_data =10000101
#                       data =11010011
#
#                       previous_data =10111011
#                       data =11111
#
#                       previous_data =11101011
#                       data =10101110
#
#                       previous_data =111
#                       data =11110010
#
#  quit -f
*/
/*7. Write a constraint such that when rand bit[3:0] a is randomized, 
the value of “a” should not be same as 5 previous occurrences of the 
value of “a”. */
/*class abc;
	rand bit [3:0] a;
	int queue[$:7];
	
	constraint c1 {!(a inside  {queue});}
	
function void post_randomize();
	queue.push_front(a);
	$display("value of a =%0d \n",a);
	if(queue.size ==6)
		queue.pop_back();
	$display("prev_occurences =%0p",queue);
endfunction 
endclass 

module tb;
abc m_h;
initial 
	begin 
		m_h = new();
		repeat(4)
		begin 
		m_h.randomize();
		end 
	end 
endmodule 

OUTPUT:
# run -all
# value of a =10
#
# prev_occurences =10
# value of a =7
#
# prev_occurences =7 10
# value of a =15
#
# prev_occurences =15 7 10
# value of a =0
#
# prev_occurences =0 15 7 10
#  quit -f
*/

//8. Constraint to generate 0, 1, x and z randomly
/*class rand_4_states;
	typedef enum {s0,s1,s2,s3} states;
	rand states sir;
	logic a;
	rand bit ctrl;
	constraint ctrl_c {ctrl dist {0:=5,1:=5};}
	
constraint c1{
				if (ctrl)
					sir inside {s0,s1};
				else 
					sir inside {s2,s3};
				}
function void post_randomize();
	case(sir)
	s0:a=0;
	s1:a=1;
	s2:a='x;
	s3:a='z;
	endcase 
endfunction 
endclass 
 
module tb;
rand_4_states c;
initial 
	begin 
	c=new();
	repeat(4)
		begin 
		c.randomize();
		$display("\t\t\t state is %0d",c.a);
		end 
	end 
endmodule 

OUTPUT:

# run -all
#                        state is z
#                        state is 0
#                        state is z
#                        state is 0
#  quit -f
*/

/*9. Write a program using dynamic array. 
[i] array1: no. of elements should be between 30-40. 
[ii] array2: sum of all elements should be < 100  
[iii] array3: sum of all elements should be > 100
*/
/*class abc;
rand int unsigned array1[];
rand bit [3:0] array2[];
rand int unsigned array3[];

constraint arr_size{array1.size() ==20;
					array2.size() ==30;
					array3.size() ==10;}
constraint c1 {foreach(array1[i])
			array1[i] inside {[30:40]};}
function void display();
	$display("size of: array1 =%0d,array2=%0d,array3=%0d\n",array1.size,array2.size,array3.size);
	$display("elements of the arrays are:");
	$display("array1:%0p\n",array1);
	$display("array2:%0p\n",array2);
	$display("array3:%0p\n",array3);
	$display("sum of : array2=%d (<100),array3 =%d(>100)",array2.sum,array3.sum);
endfunction 
endclass 

module tb;
abc c_h;

initial 
	begin 
	c_h = new();
	$display("\n\n");
	c_h.randomize() with{array2.sum<100; array3.sum>100;};
	c_h.display();
	$display("\n\n");
	end 
endmodule 

OUTPUT:
# size of: array1 =20,array2=30,array3=10
#
# elements of the arrays are:
# array1:32 32 34 34 40 35 36 36 31 30 37 35 33 30 39 31 38 35 33 38
#
# array2:0 0 0 0 0 0 0 0 4 0 0 0 0 0 0 1 0 3 0 0 0 3 2 0 0 0 0 0 2 0
#
# array3:4276953428 3100392584 2876673918 3556036730 665249003 594936294 3380448764 921425898 389610813 47787460
#
# sum of : array2=15 (<100),array3 =2629645708(>100)
#
#
#
#  quit -f
*/

/*  10.There are two constraints applied to same variable. One will generate the 
value within the range of [25:50] and another expression should be greater 
than 40. What should be the value generated, and what is the reason? 
*/
/*class con;
	rand bit [7:0] data;
	constraint const_1{data inside {[25:50]};}
	constraint const_2{data>40;}
endclass 
module tb;
con con_h;
initial 
	begin 
	con_h = new();
	$display("\n\n");
	repeat(5) 
		begin 
		con_h.randomize();
		$display("\t\t data =%0d",con_h.data);
		
		if(con_h.data<40)
			$display("\t\t data =%d (under [25:50])",con_h.data);
		end 
	$display("\n\n");
	end 
endmodule 

OUTPUT:
# run -all
#
#
#
# size of: array1 =20,array2=30,array3=10
#
# elements of the arrays are:
# array1:32 32 34 34 40 35 36 36 31 30 37 35 33 30 39 31 38 35 33 38
#
# array2:0 0 0 0 0 0 0 0 4 0 0 0 0 0 0 1 0 3 0 0 0 3 2 0 0 0 0 0 2 0
#
# array3:4276953428 3100392584 2876673918 3556036730 665249003 594936294 3380448764 921425898 389610813 47787460
#
# sum of : array2=15 (<100),array3 =2629645708(>100)
#
#
#
#  quit -f*/
/* 11. Constraint with array size of 5 to 10 values & the array values 
should be in ascending order. */
/*class abc;
	rand bit [4:0] array[];
	
	constraint c_asc {array.size inside {[5:10]};
						foreach (array[i])
						if(i>0)
							array[i] > array[i-1];
					}
	function void display();
		$display("\t\t\t size is '%0d'",array.size());
		$display("\t\t index value");
		foreach(array[i])
			begin 
			$display("\t\t [%0d] | %0d",i,array[i]);
			end 
			$display("\t ascending_order array =%p",array);
			$display("\n\n");
	endfunction 
endclass 

module ascending;
abc c_h;
initial 
	begin 
	c_h = new();
	repeat(2) 
		begin 
		c_h.randomize();
		c_h.display();
		end 
	end 
endmodule 

OUTPUT:

# run -all
#                        size is '8'
#                index value
#                [0] | 1
#                [1] | 6
#                [2] | 8
#                [3] | 9
#                [4] | 11
#                [5] | 27
#                [6] | 28
#                [7] | 30
#        ascending_order array ='{1, 6, 8, 9, 11, 27, 28, 30}
#
#
#
#                        size is '10'
#                index value
#                [0] | 0
#                [1] | 5
#                [2] | 6
#                [3] | 7
#                [4] | 8
#                [5] | 9
#                [6] | 10
#                [7] | 11
#                [8] | 12
#                [9] | 24
#        ascending_order array ='{0, 5, 6, 7, 8, 9, 10, 11, 12, 24}
#
#
#
#  quit -f
*/
/*12. Constraint with array size of 5 to 10 values & the array values should be 
in descending order.*/

/*class abc;
	rand bit [4:0] array[];
	
	constraint c_desc {array.size inside {[5:10]};
						foreach (array[i])
						if(i>0)
							array[i] > array[i-1];
					}
	function void display();
		$display("\t\t\t size is '%0d'",array.size());
		$display("\t\t index value");
		foreach(array[i])
			begin 
			$display("\t\t [%0d] | %0d",i,array[i]);
			end 
			$display("\t descending_order array =%p",array);
			$display("\n");
	endfunction 
endclass 

module descending;
abc c_h;
initial 
	begin 
	c_h = new();
	repeat(2) 
		begin 
		c_h.randomize();
		c_h.display();
		end 
	end 
endmodule */

//13. Constraint - for 0-100 range 70% and for 101-255 range 30% 
/*class abc;
	rand bit[7:0] a;
	constraint c_dist {a dist {[0:100] :=7, [101:255] :=3};}
endclass 

module tb;
abc m_h = new();
initial 
	begin 
	repeat(5)
		begin 
		m_h.randomize;
		if(m_h.a < 100)
			$display("\t\t\t a=%d (under dist.[0:100])",m_h.a);
		else 
			$display("\t\t\t a=%d (under dist. [101:255])",m_h.a);
		end 
	end 
endmodule 

OUTPUT:

# run -all
#                        a= 79 (under dist.[0:100])
#                        a=155 (under dist. [101:255])
#                        a=  8 (under dist.[0:100])
#                        a= 46 (under dist.[0:100])
#                        a= 23 (under dist.[0:100])
#  quit -f
*/

//14. Without inside operator generate random values for the range 34-43. 
/*class con;
rand logic [7:0]a;
constraint c_range {(a>34) && (a<43);}
endclass 

module tb;
con con_h;
initial 
	begin 
	con_h = new();
	$display("\n vlaue of a (>34 and <43) is :");
	repeat(5)
		begin
		con_h.randomize();
		$display("\t\t a=%0d",con_h.a);
		end 
		$display("\n\n");
	end 
endmodule 

OUTPUT:
# run -all
#
#  vlaue of a (>34 and <43) is :
#                a=42
#                a=36
#                a=40
#                a=37
#                a=42
#
#
#
#  quit -f
*/
//     15. Generate unique values without using rand or randc.
/*class con;
int data[15];
function new();
foreach (data[i]) 
	begin 
		data[i] =i;
	end 
endfunction 

function void display();
	$display("\n\n");
	$display("\t\t unique values =%p",data);
	$display("\n\n");
endfunction

function void data_shuffle();
data.shuffle();
endfunction 
endclass 

module tb;
con con_h;
initial 
	begin 
	con_h = new();
	con_h.data_shuffle();
	con_h.display();
	end 
endmodule 

OUTPUT:
   unique values ='{0, 9, 14, 5, 7, 8, 11, 10, 1, 12, 6, 4, 3, 13, 2}
#
*/
