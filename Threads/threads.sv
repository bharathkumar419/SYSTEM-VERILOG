//////////////////THREADS////////////////////////THREADS
/*module test();
	initial 
		begin 
		#10;
		fork 
			begin 
			#20; //thread 1 //10+20=30
			end 
			begin 
			#40; //thread 2 //10+40=50
			end 
			begin 
			#10; //thread 3 //10+10=20
			end 
		join
		$display("exit is at time t =%t",$time);
		end 
endmodule : test

OUTPUT:
ans we get th final thread execution time 

# run -all
# exit is at time t =                  50
#  quit -f
*/

/*module test();
	initial 
		begin 
		#10;
		fork 
			begin 
			#20; //thread 1 //10+20=30
			end 
			begin 
			#40; //thread 2 //10+40=50
			end 
			begin 
			#10; //thread 3 //10+10=20
			end 
		join_any
		$display("exit is at time t =%t",$time);
		end 
endmodule : test

OUTPUT:
ans we get that first executed o/p

# run -all
# exit is at time t =                  20
#  quit -f
*/

/*module test();
	initial 
		begin 
		#10;
		fork 
			begin 
			#20; //thread 1 //10+20=30
			end 
			begin 
			#40; //thread 2 //10+40=50
			end 
			begin 
			#10; //thread 3 //10+10=20
			end 
		join_none
		$display("exit is at time t =%t",$time);
		end 
endmodule : test

OUTPUT:
all parent and child threads will be run parallely
# run -all
# exit is at time t =                  10
#  quit -f

*/

/*disable lable-terminates the named block 
disable fork -> terminates all the child threads below the current context level 
wait fork -> waits until  all the fork processes to completes the execution */


