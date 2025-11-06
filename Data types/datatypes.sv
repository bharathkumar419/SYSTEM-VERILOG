module logic_test();

    parameter CYCLE = 20;
    logic q, q_b, d, clk, rst_n;

    initial 
	begin 
        clk = 0;           // procedural assignment
        rst_n = 0;         // BA
        forever 
		begin
            #(CYCLE/2) clk = ~clk;  // clock generation
            @(negedge clk);
            rst_n = 1'b1;
        	end
    	end

    assign q_b = ~q;       // continuous assignment

    diff DUT(q, d, clk, rst_n);  // DUT Instantiation (no inout ports)
endmodule : logic_test

//////////////////////////////////////////////////2.LOGIC EX /////////////////////////////////////////////////////////////////////////// */
/*module logic_test(inout y);
logic a_in,b_in;
assign b_in = 0;   //CA 
//assign a_in = 1; //we get error 

initial 
	begin 
		a_in = 0;
	end 
endmodule :logic_test 

module top;
logic c_out;
logic_test LT (c_out);
endmodule : top */

//////////////////////////////////////////////////2-state data type //////////////////////////////////////////////////
/*module test;
bit clk; //bit vlaue 0/1
bit [31:0]vbus;//32 bits unsigned 
int cnt ; //32 bits signed 
//int unsigned cnt; //32 bits unsigned 
byte crc_byte;//8 bits signed integer 
shortint sint; //16 bit signed integer 
longint lint;  //64 bits signed integer 


//clock generation - bit data type improves simulation performance 
//bit clk = 0;
always 
	clk = !clk;
endmodule : test */

//////////////////////////////////////////////////struct _data type//////////////////////////////////////////////////
/*module struc;
struct {bit [7:0]r,g,b; int colour;} pixel;
initial 
	begin 
		pixel.r =8'd25;
		pixel.g =8'd55;
		pixel.b =8'd11;
		pixel.colour =32'd894;
		$display ("pixel=%p",pixel);
	end 
initial 
	begin 
		pixel.colour =32'd10000;
		$display ("pixel=%p",pixel);
	end 
endmodule :struc */

/*module test;
struct {bit [7:0] address;
		logic [7:0] payload[0:63];
		enum {good,error} pkt_type;
		logic [7:0] parity;} packet;
initial 
	begin 
		packet.address = 8'd25;
		packet.pkt_type = error;
		$display("packet.address =%p,packet.pkt_type=%p",packet.address,packet.pkt_type);
	end 
endmodule : test */


/*module test_BRN_57_DB;
struct {int unsigned DT, VT, ST, UT;} S[50];
initial 
	begin 
	S[0].DT=10;
	S[0].VT=20;
	S[0].ST=15;
	S[0].UT=25;
	$display("S[0]=%p",S[0]);
	end 
endmodule : test_BRN_57_DB */

//////////////////////////////////////////////////user_defined data_type //////////////////////////////////////////////////
/*module test;
typedef bit [31:0] word_t;
word_t word1,word2;

struct {bit [7:0]r,g,b; int colour;} pixel;
initial 
	begin
		pixel.r =8'd25;
		pixel.g =8'd55;
		pixel.b =8'd11;
	end 
//user_defined structures 
typedef struct {bit [7:0]r,g,b; int colour;} pixel_st;
initial 
	begin
		pixel_st samsung_pixel;
		pixel_st sony_pixel;

		samsung_pixel.r=8'd25;
		sony_pixel='{8'd38,8'd98,8'd68,0};
		 $display("samsung_pixel=%p,sony_pixel=%p",samsung_pixel,sony_pixel);
	end 
	
 endmodule:test */
 
//////////////////////////////////////////////////enum EX//////////////////////////////////////////////////
 /*module test;
 typedef struct {bit [5:0] r,y;
			integer a;
			enum {c=12,d=8} pix;} word1;
	word1 w1,w2;
	initial 
		begin 
			w1.r=8'd15;
			w1.y=8'd88;
			w2 ='{8'd888,16'd419,0,1};  // Error (suppressible): practice.sv(138): (vopt-13174) Illegal assignment pattern. The number of elements (2) doesn't match with the type's width (4).
			$display("w1=%p,w2=%p",w1,w2);
		end
endmodule : test */

//////////////////////////////////////////////////enum ex//////////////////////////////////////////////////
/*module test;
    enum {red, green, blue, yellow, white , black} colours;            
            initial begin
            colours = colours.first;
            $display("The colour is =%0s and value is %0d",colours.name,colours);
            end    
endmodule:test */

//output : The color is =red and value is 0

/*module test;
    enum {red, green, blue, yellow, white , black} colours;            
            initial begin
            colours = colours.last;
            $display("The colour is =%0s and value is %0d",colours.name,colours);
            end    
endmodule:test*/

//output :The color is =red and value is 0


//////////////////////////////////////////////////ex //////////////////////////////////////////////////
/*module test;
	typedef enum {red, green, blue, yellow, white, black} colours;
	colours c1;
	
	initial 
		begin 
		 
		c1= c1.first;
		forever 
			begin 
			$display("The colour is =%p and valueis %d",c1.name,c1);
			if (c1==c1.last)
				break;
			c1=c1.next;
			end 
		end 
endmodule :test


output :
# The colour is ="red" and valueis           0
# The colour is ="green" and valueis           1
# The colour is ="blue" and valueis           2
# The colour is ="yellow" and valueis           3
# The colour is ="white" and valueis           4
# The colour is ="black" and valueis           5
#  quit -f */

//////////////////////////////////////////////////enum_txt //////////////////////////////////////////////////
/*module test;
enum {init, read, write, brd, bwr} fsm_state;
fsm_state = init;
fsm_state = read;*/
/*module test;
typedef enum {init, read, write, brd, bwr} fsm_state_et;
fsm_state_et pre_state, next_state;

fsm_state_et state = state.first;

initial 
	forever 
		begin 
			$display(" %s : %d", state.name,state);
			if(state == state.last())
				break;
			state = state.next();
		end 
endmodule : test

OUTPUT :
# Loading work.test(fast)
# run -all
#  init :           0
#  read :           1
#  write :           2
#  brd :           3
#  bwr :           4
#  quit -f */
//////////////////////////////////////////////////type conversions //////////////////////////////////////////////////
/*module test;
int c;
real r;
initial 
	begin 
	 c= int'(20.0-0.1);
	 r=real'(30);
	$display ("c=%d, r=%d", c,r);
	end 
endmodule : test

OUTPUT 
# run -all
# c=         20, r=        30
*/

//////////////////////////////////////////////////type conversions ex2 //////////////////////////////////////////////////
/*module test;
typedef enum{init, read, write, brd, bwr} fsm_state_e;

fsm_state_e state;
int c;

initial 
	begin 
		state = read;
		c = state; //can be done 
		state = 1; //static casting : no type checking ,wi]omt't give errors
		state = fsm_state_e'(5); //static caast, no runtime error even if out of range 
		
		$cast(state,5); //dynamic casting as task
						// gives error as 5 is outof bound value 
		if ($cast(state, 5)) //dynamic casting as system function 
			$display ("CASTING IS SUCCESSFUL");
		else 
			$display("CASTING IS FAILED");
	end 
endmodule : test */
	
//////////////////////////////////////////////////type conversions ex3 //////////////////////////////////////////////////
/*module test;

typedef enum {init, read, write, brd, bwr} fsm_state_e;

fsm_state_e state;
int c;

initial begin
    state = read;
    c = state;// can be done
    state = brd;             // static casting: no type checking, won't give error
    state = fsm_state_e'(5);// static cast, no runtime error even if out of range

    $cast(state, 5);// dynamic casting as task
			// gives error as 5 is out of bound value
    if ($cast(state, 5))// dynamic casting as system function
        $display("CASTING IS SUCCESSFUL");
    else
        $display("CASTING IS FAILED");
end

endmodule : test 

OUTPUT :
 Error: (vsim-3971) $cast to type 'enum int test.fsm_state_e' from 'bit signed[31:0]' failed in file practice.sv at line 278.
#    Time: 0 ns  Iteration: 0  Instance: /test
# CASTING IS FAILED
 */


//////////////////////////////////////////////////type conversions ex3 //////////////////////////////////////////////////
/*module test;

typedef enum {init, read, write, brd, bwr} fsm_state_e;

fsm_state_e state;
int c;

initial begin
    state = read;
    c = state;// can be done
    state = brd;             // static casting: no type checking, won't give error
    state = fsm_state_e'(5);// static cast, no runtime error even if out of range

    $cast(state, 4);// dynamic casting as task
			// gives error as 5 is out of bound value
    if ($cast(state, 5))// dynamic casting as system function
        $display("CASTING IS SUCCESSFUL");
    else
        $display("CASTING IS FAILED");
end

endmodule : test 

OUTPUT : 
CASTING IS FAILED */

//////////////////////////////////////////////////type conversions ex3 //////////////////////////////////////////////////
/*module test;

typedef enum {init, read, write, brd, bwr} fsm_state_e;

fsm_state_e state;
int c;

initial begin
    state = read;
    c = state;// can be done
    state = brd;             // static casting: no type checking, won't give error
    state = fsm_state_e'(5);// static cast, no runtime error even if out of range

    $cast(state, 3);// dynamic casting as task
			// gives error as 5 is out of bound value
    if ($cast(state, 5))// dynamic casting as system function
        $display("CASTING IS SUCCESSFUL");
    else
        $display("CASTING IS FAILED");
end

endmodule : test 

OUTPUT : 
# run -all
# CASTING IS FAILED */


//////////////////////////////////////////////////type conversions ex3 //////////////////////////////////////////////////

/*module test;

typedef enum {init, read, write, brd, bwr} fsm_state_e;

fsm_state_e state;
int c;

initial begin
    state = read;
    c = state;// can be done
    state = brd;             // static casting: no type checking, won't give error
    state = fsm_state_e'(5);// static cast, no runtime error even if out of range

    $cast(state, 2);// dynamic casting as task
			// gives error as 5 is out of bound value
    if ($cast(state, 5))// dynamic casting as system function
        $display("CASTING IS SUCCESSFUL");
    else
        $display("CASTING IS FAILED");
end

endmodule : test 

OUTPUT : 
# run -all
# CASTING IS FAILED */

//////////////////////////////////////////////////type conversions ex3 //////////////////////////////////////////////////

/*module test;

typedef enum {init, read, write, brd, bwr} fsm_state_e;

fsm_state_e state;
int c;

initial begin
    state = read;
    c = state;// can be done
    state = brd;             // static casting: no type checking, won't give error
    state = fsm_state_e'(5);// static cast, no runtime error even if out of range

    $cast(state, 1);// dynamic casting as task
			// gives error as 5 is out of bound value
    if ($cast(state, 5))// dynamic casting as system function
        $display("CASTING IS SUCCESSFUL");
    else
        $display("CASTING IS FAILED");
end

endmodule : test 

OUTPUT : 
# run -all
# CASTING IS FAILED */
//////////////////////////////////////////////////type conversions ex3 //////////////////////////////////////////////////

/*module test;

typedef enum {init, read, write, brd, bwr} fsm_state_e;

fsm_state_e state;
int c;

initial begin
    state = read;
    c = state;// can be done
    state = brd;             // static casting: no type checking, won't give error
    state = fsm_state_e'(5);// static cast, no runtime error even if out of range
	$display("value of c =%d",c);
	$display("value of state = %d",state); 
    $cast(state, 3);// dynamic casting as task
			// gives error as 5 is out of bound value
    if ($cast(state, 0))// dynamic casting as system function
        $display("CASTING IS SUCCESSFUL");
    else
        $display("CASTING IS FAILED");
end

endmodule : test 

OUTPUT :
# run -all
# value of c =          1
# value of state =           5
# CASTING IS SUCCESSFUL
#  quit -f */


//////////////////////////////////////////////////string//////////////////////////////////////////////////
/*module test;
string str;
initial 
	begin
		str = "MAVEN_SILICON";
		str = str.tolower(); 
		$display("character in the 5th position is %s", str.getc(5));
		str.putc(5, "-");
		$display("%s", str.substr(6, str.len-1));
		str = {str, ".com"};
		str = {{3{"w"}},".",str};
		disp($sformatf("https: //%s",str));
		end
	task disp(string s);
	$display("at time t = %0t, %s", $time, s);
	endtask 
endmodule : test

OUTPUT : 
 character in the 5th position is _
# silicon
# at time t = 0, https: //www.maven-silicon.com
#  quit -f 
*/

		
