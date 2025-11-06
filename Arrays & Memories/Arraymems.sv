////////////////////////////////////////////////packed arrays ////////////////////////////////////////////////////*/
/*module test;
bit [3:0] [7:0] byte_packed;
initial 
	begin 
		byte_packed = 32'h5454_5454;
		$displayh(byte_packed,//show all 32bits
					byte_packed[0],
					byte_packed[0][0]);
		$displayh(byte_packed,//show all 32bits
					byte_packed[0],
					byte_packed[3][7]);
	end 
	
endmodule :test			

OUTPUT 
# Loading sv_std.std
# Loading work.test(fast)
# run -all
# 54545454540
# 54545454540
#  quit -f*/

/*module test;
	bit [7:0] packed_array;
		initial 
			begin 
				packed_array = 4'b1000_0101;
				for(int i=0;i<$size(packed_array);i++)
				begin 
					$display("the 1-d value is Data[%0d] = %0d",i,packed_array[i]);
				end 
			end 
endmodule : test

OUTPUT:

# run -all
# the 1-d value is Data[0] = 1
# the 1-d value is Data[1] = 0
# the 1-d value is Data[2] = 1
# the 1-d value is Data[3] = 0
# the 1-d value is Data[4] = 0
# the 1-d value is Data[5] = 0
# the 1-d value is Data[6] = 0
# the 1-d value is Data[7] = 0 */

/*module test;
	bit [7:0] packed_array;
		initial 
			begin 
			for (int i=0; i<$size(packed_array);i++)
				begin 
				packed_array[i]=i;
				$display("the 1-d value is Data[%0d] = %0d",i,packed_array[i]);
				end 
			end 
endmodule : test

OUTPUT
 run -all
# the 1-d value is Data[0] = 0
# the 1-d value is Data[1] = 1
# the 1-d value is Data[2] = 0
# the 1-d value is Data[3] = 1
# the 1-d value is Data[4] = 0
# the 1-d value is Data[5] = 1
# the 1-d value is Data[6] = 0
# the 1-d value is Data[7] = 1
#  quit -f
$size(packed_array)
This will return the total number of bits (i.e., 8), not the number of elements (which is 1, since it's a scalar of 8 bits). But you’re treating it like an array of 8 elements.

In packed arrays like bit[7:0], indexing is bit-wise (bit 0 to bit 7). So, $size(packed_array) works correctly if you mean to access bit-wise.
*/


/*module test;
	bit [3:0] [7:0] packed_array;
	initial 
		begin 
			packed_array = 32'habcd_efda;
			$display("The packed_array=%0b",packed_array);
			for (int i=0;i<$size(packed_array);i++)
				begin 
				$display("the 1-D value is Data[%0d] = %0b",i,packed_array[i]);
				end
		end 
endmodule : test 
OUTPUT:
# run -all
# The packed_array=10101011110011011110111111011010
# the 1-D value is Data[0] = 11011010
# the 1-D value is Data[1] = 11101111
# the 1-D value is Data[2] = 11001101
# the 1-D value is Data[3] = 10101011 */



/*module test;
	bit [3:0] [7:0] packed_array;
	initial 
		begin 
			packed_array = 32'habcd_efda;
			$display("The packed_array=%0b",packed_array);
			for (int i=0;i<$size(packed_array);i++)
				begin 
				packed_array[i] = i;
				$display("the 1-D value is Data[%0d] = %0b",i,packed_array[i]);
				end
		end 
endmodule : test 

OUTPUT: 
# The packed_array=10101011110011011110111111011010
# the 1-D value is Data[0] = 0
# the 1-D value is Data[1] = 1
# the 1-D value is Data[2] = 10
# the 1-D value is Data[3] = 11
*/

/*module tb;
    bit[3:0][7:0] packed_array[0:2];
        
 initial 
	begin
            packed_array[0] = 32'd255;
            packed_array[0][3] = 8'd5;
	    packed_array[0][1][2] = 1'd1;
          	 // for(int i = 0 ; i<$size(packed_array);i++)
          	 // begin
		//packed_array[i] = i;
                //$display("The 1-D value is Data[%0d] = %0b",i,packed_array[i]);
		   $display("packed_array=%p,packed_array[0] = %0b,packed_array[0][3] = %0b,packed_array[0][1][2] = %0b",packed_array,packed_array[0],
				packed_array[0][3],packed_array[0][1][2]);

              //  end
        end
endmodule  

OUTPUT: 
# run -all
# packed_array='{'{5, 0, 4, 255}, '{0, 0, 0, 0}, '{0, 0, 0, 0}},packed_array[0] = 101000000000000010011111111,packed_array[0][3] = 101,packed_array[0][1][2] = 1
#  quit -f
 */
 
 
/* 
module test;
	bit [31:0] packet1[5], packet2[5];
	
	initial 
		begin 
		int i;
		int j;
		
			for (i=0;i<$size(packet1); i++)
			begin 
				packet1[i] = i;
				$display("The 1-D value is packet1[%0d] = %0d",i,packet1[i]);
			end 
			foreach (packet2[j])
			begin 
				packet2[j] = j*2;
				$display ("The 1-D value is packet2[%0d] = %0d",j,packet2[j]);
			end 
		end 
endmodule : test

OUTPUT:

# run -all
# The 1-D value is packet1[0] = 0
# The 1-D value is packet1[1] = 1
# The 1-D value is packet1[2] = 2
# The 1-D value is packet1[3] = 3
# The 1-D value is packet1[4] = 4
# The 1-D value is packet2[0] = 0
# The 1-D value is packet2[1] = 2
# The 1-D value is packet2[2] = 4
# The 1-D value is packet2[3] = 6
# The 1-D value is packet2[4] = 8
#  quit -f */



/*module test ;
int md_array[3][2] = '{'{0,1}, '{2,3},'{4,5} };

initial 
	begin 
	foreach (md_array[i,j])
		$display("md_array [%0d] [%0d] = %0d",i,j,md_array[i][j]);
	end
endmodule 

OUTPUT: 
# md_array [0] [0] = 0
# md_array [0] [1] = 1
# md_array [1] [0] = 2
# md_array [1] [1] = 3
# md_array [2] [0] = 4
# md_array [2] [1] = 5
#  quit -f */

////////////////////////////////////////////////accessing elements from an array////////////////////////////////////////////////
/*module test;
 logic [31:0] msrc[5],mdst[5];
	initial 
		begin 
			for (int i=0; i<$size(msrc); i++)
			msrc[i] =i;
			foreach (mdst[j])
				mdst[j] =msrc[j] *4;
		end 
	int mda [3][3] ='{'{0,1,2},
						'{3,4,5},
						'{5,6,7}};
	initial 
		begin 
		foreach (mda[i,j])
			$display("mda[%0d] [%0d]= %0d",i,j, mda[i][j]);
		end 
endmodule : test

OUTPUT:
# run -all
# mda[0] [0]= 0
# mda[0] [1]= 1
# mda[0] [2]= 2
# mda[1] [0]= 3
# mda[1] [1]= 4
# mda[1] [2]= 5
# mda[2] [0]= 5
# mda[2] [1]= 6
# mda[2] [2]= 7
#  quit -f
# End time: 10*/


////////////////////////////////////////////////copy and compare ////////////////////////////////////////////////
/*module test;
bit [31:0] msrc[5] = {0,1,2,3,4},
			mdst[5]={5,4,3,2,1};
//copy and compare all the values and without any loop 
initial 
	begin 
		if (msrc ==mdst) //compare all msrc values with mdst
			$display ("msrc is equal to mdst");
		else 
			$display("msrc is not equal to mdst");
			
	mdst = msrc; //copy all msrc values to mdst
	
	//compare 4 values of msrc with mdst
	if(msrc[1:4] == mdst [1:4])
		$display("msrc is equal to mdst");
	else 
		$display("msrc is not equal to mdst");
	end
endmodule : test 

OUTPUT:
# run -all
# msrc is not equal to mdst
# msrc is equal to mdst
#  quit -f
*/

////////////////////////////////////////////////dynamic array  ////////////////////////////////////////////////
/*module test;
int da1[],da2[];
initial 
	begin 
		da1= new[10]; //allocates 10 elements  
		foreach (da1[i]) //initializing 
			da1[i]=i;
			da2=da1; //copying 
			da1=new[30](da1);//allocating 30 new & copy existing int a
			da1=new[100];//allocating 100 new ints-old values are lost 
			//da2.delete(); //delete all elements os da2
	end 
endmodule : test */

/*module test;
	int md_array[3][2] ='{'{0,9}, '{8,7}, '{6,5} };
		initial 
			begin 
				foreach 
					(md_array[i,j])
						$display ("md_array[%0d][%0d] = %0d",i,j,md_array[i][j]);
			end 
endmodule : test 

OUTPUT:
# run -all
# md_array[0][0] = 0
# md_array[0][1] = 9
# md_array[1][0] = 8
# md_array[1][1] = 7
# md_array[2][0] = 6
# md_array[2][1] = 5
#  quit -f
*/

/*module test;
	int arr1[100];
	int arr2[100];//if size is different then we get array mimatch with the width so use same width 
	
	initial 
			begin 
			for (int i=0;i<$size(arr1);i++)
				begin 
					arr1[i]=i;
				end 
				$display("the array1 is %p",arr1);
				
				arr2 = arr1;
				$display("the array2 is %p",arr2);
			end  
endmodule : test

OUTPUT: 
#the array1 is '{0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99}
# the array2 is '{0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99}
*/


