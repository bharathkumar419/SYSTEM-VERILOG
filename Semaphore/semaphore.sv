////////////////////semaphores////////////////////////////////
/*module test;
	// in class driver 
		class driver;
		//write task send with input arguement of string name
		task send (input string var1);
		//get the key using sem handle 
		sem.get(1);
		
		//display the string which indicates the respective driver information 
		$display("%s got key",var1);
		
		//put the key using sem handle 
		sem.put(1);
		
		//display the string which indicates the respective driver information 
		$display("%s dropped key",var1);
		endtask 
		endclass : driver 
	
	//declare an array of two drivers
	driver drv[2];
	//declare a handle for semaphore 
	semaphore sem;
	//within intial block 
	initial 
		begin 
		drv[0]=new();
		drv[1]=new();
		
		//creates an instance of semaphore handle and initialize it with 1 key
		repeat(5)
			fork 
				drv[0].send("driver----1");
				drv[1].send("driver---2");
			join 
		end 
		
		// Call send task of both drivers 5 times within fork join
		// pass any meaning full string message to indicate the driver information


	endmodule*/

///////////////////////semaphore////////////////////////////////////////////////////*/
/*module test_semaphore;

	// In class driver
		
              class driver;

		// write task send with input argument of string type
			task send(input string var1);

			// Get the key using sem handle 
			sem.get(1);

			// Display the string which indicates the respective driver information
			$display("%s got key", var1);

			// Put the key using sem handle 
			sem.put(1);			

			// Display the string which indicates the respective driver information
			$display("%s dropped key", var1);
			endtask
     		endclass : driver

	// Declare an array of two drivers  
	driver drv[2];
		
	// Declare a handle for semaphore
	semaphore sem;

	// Within initial block
	initial
		begin
			drv[0]=new();
			drv[1]=new();


		// Create instances of drivers
			
			sem=new(1);

		// Create the instance of semaphore handle and initialize it with 1 key
		// Call send task of both drivers 5 times within fork join
		// pass any meaning full string message to indicate the driver information
		repeat(5)
				
					fork
						drv[0].send("driver --1");
						drv[1].send("driver --2");
					join
				
			
		end
		

endmodule 
	
output:# run -all
# driver --1 got key
# driver --1 dropped key
# driver --2 got key
# driver --2 dropped key
# driver --1 got key
# driver --1 dropped key
# driver --2 got key
# driver --2 dropped key
# driver --1 got key
# driver --1 dropped key
# driver --2 got key
# driver --2 dropped key
# driver --1 got key
# driver --1 dropped key
# driver --2 got key
# driver --2 dropped key
# driver --1 got key
# driver --1 dropped key
# driver --2 got key */

/*module test_semaphore;

	// In class driver
		
              class driver;

		// write task send with input argument of string type
			task send(input string var1);

			// Get the key using sem handle 
			sem.get(1);
			#1;
			// Display the string which indicates the respective driver information
			$display("%s got key", var1);
			
			
			// Put the key using sem handle 
			sem.put(1);			
			#2;
			// Display the string which indicates the respective driver information
			$display("%s dropped key", var1);
			endtask
     		endclass : driver

	// Declare an array of two drivers  
	driver drv[2];
		
	// Declare a handle for semaphore
	semaphore sem;

	// Within initial block
	initial
		begin
			drv[0]=new();
			drv[1]=new();


		// Create instances of drivers
			
			sem=new(2);

		// Create the instance of semaphore handle and initialize it with 1 key
			repeat(5)
				
					fork
						drv[0].send("driver --1");
						drv[1].send("driver --2");
					join
				
			
		end
		// Call send task of both drivers 5 times within fork join
		// pass any meaning full string message to indicate the driver information


	endmodule 




output: driver --1 got key
# driver --2 got key
# driver --1 dropped key
# driver --2 dropped key
# driver --1 got key
# driver --2 got key
# driver --1 dropped key
# driver --2 dropped key
# driver --1 got key
# driver --2 got key
# driver --1 dropped key
# driver --2 dropped key
# driver --1 got key
# driver --2 got key
# driver --1 dropped key
# driver --2 dropped key
# driver --1 got key
# driver --2 got key
# driver --1 dropped key
# driver --2 dropped key*/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////*/

/*module test_semaphore;

	// In class driver
		
              class driver;

		// write task send with input argument of string type
			task send(input string var1);

			// Get the key using sem handle 
			sem.get(1);
			#1;
			// Display the string which indicates the respective driver information
			$display("%s got key", var1);
			
				#2;		
			// Put the key using sem handle 
			sem.put(1);
				
		
			// Display the string which indicates the respective driver information
			$display("%s dropped key", var1);
			endtask
     		endclass : driver

	// Declare an array of two drivers  
	driver drv[2];
		
	// Declare a handle for semaphore
	semaphore sem;

	// Within initial block
	initial
		begin
			drv[0]=new();
			drv[1]=new();


		// Create instances of drivers
			
			sem=new(1);

		// Create the instance of semaphore handle and initialize it with 1 key
			repeat(5)
				
					fork
						drv[0].send("driver --1");
						drv[1].send("driver --2");
					join
				
			
		end
		// Call send task of both drivers 5 times within fork join
		// pass any meaning full string message to indicate the driver information


	endmodule 



output:# driver --1 got key
# driver --1 dropped key
# driver --2 got key
# driver --2 dropped key
# driver --1 got key
# driver --1 dropped key
# driver --2 got key
# driver --2 dropped key
# driver --1 got key
# driver --1 dropped key
# driver --2 got key
# driver --2 dropped key
# driver --1 got key
# driver --1 dropped key
# driver --2 got key
# driver --2 dropped key
# driver --1 got key
# driver --1 dropped key
# driver --2 got key
# driver --2 dropped key
///////////////////////////////////////////////////////////////////////////////*/

/*module test_semaphore;

	// In class driver
		
              class driver;

		// write task send with input argument of string type
			task send(input string var1);

			// Get the key using sem handle 
			sem.get(1);
			#1;
			// Display the string which indicates the respective driver information
			$display("%s got key", var1);
			
				
			// Put the key using sem handle 
			sem.put(1);
				#2;		
		
			// Display the string which indicates the respective driver information
			$display("%s dropped key", var1);
			endtask
     		endclass : driver

	// Declare an array of two drivers  
	driver drv[2];
		
	// Declare a handle for semaphore
	semaphore sem;

	// Within initial block
	initial
		begin
			drv[0]=new();
			drv[1]=new();


		// Create instances of drivers
			
			sem=new(1);

		// Create the instance of semaphore handle and initialize it with 1 key
			repeat(5)
				
					fork
						drv[0].send("driver --1");
						drv[1].send("driver --2");
					join
				
			
		end
		// Call send task of both drivers 5 times within fork join
		// pass any meaning full string message to indicate the driver information


	endmodule 

output: driver --1 got key
# driver --2 got key
# driver --1 dropped key
# driver --2 dropped key
# driver --1 got key
# driver --2 got key
# driver --1 dropped key
# driver --2 dropped key
# driver --1 got key
# driver --2 got key
# driver --1 dropped key
# driver --2 dropped key
# driver --1 got key
# driver --2 got key
# driver --1 dropped key
# driver --2 dropped key
# driver --1 got key
# driver --2 got key
# driver --1 dropped key
# driver --2 dropped key
//////////////////////////////////////////////////////////////////////////////////////////////*/


/*module test_semaphore;

  // Semaphore handle
  semaphore sem;

  // Driver class
  class driver;

    // send task with input string for identification
    task send(input string var1);
      if (sem.try_get(1)) begin  // Non-blocking get
        #1;
        $display("%s got key at time %0t", var1, $time);
        sem.put(1);
        #2;
        $display("%s dropped key at time %0t", var1, $time);
      end else begin
        $display("%s could NOT get key at time %0t", var1, $time);
      end
    endtask

  endclass : driver

  // Declare an array of two driver handles
  driver drv[2];

  // Initial block
  initial begin
    // Create semaphore with 1 key
    sem = new(1);

    // Create driver instances
    drv[0] = new();
    drv[1] = new();

    // Repeat 5 times and fork both driver sends in parallel
    repeat(5) begin
      fork
        drv[0].send("driver --1");
        drv[1].send("driver --2");
      join
    end
  end

endmodule

output:# run -all
# driver --2 could NOT get key at time 0
# driver --1 got key at time 1
# driver --1 dropped key at time 3
# driver --2 could NOT get key at time 3
# driver --1 got key at time 4
# driver --1 dropped key at time 6
# driver --2 could NOT get key at time 6
# driver --1 got key at time 7
# driver --1 dropped key at time 9
# driver --2 could NOT get key at time 9
# driver --1 got key at time 10
# driver --1 dropped key at time 12
# driver --2 could NOT get key at time 12
# driver --1 got key at time 13
# driver --1 dropped key at time 15
//////////////////////////////////////////////////////////////////////*/



/*module test_semaphore;

  // Semaphore handle
  semaphore sem;

  // Driver class
  class driver;

    // send task with input string for identification
    task send(input string var1);
      if (sem.try_get(1)) begin  // Non-blocking get
        #1;
        $display("%s got key at time %0t", var1, $time);
        sem.put(1);
        $display("%s dropped key at time %0t", var1, $time);
      end else begin
        $display("%s could NOT get key at time %0t", var1, $time);
      end
    endtask

  endclass : driver

  // Declare an array of two driver handles
  driver drv[2];

  // Initial block
  initial begin
    // Create semaphore with 1 key
    sem = new();

    // Create driver instances
    drv[0] = new();
    drv[1] = new();

    // Repeat 5 times and fork both driver sends in parallel
    repeat(5) begin
      fork
        drv[0].send("driver --1");
        drv[1].send("driver --2");
      join
    end
  end

endmodule

output:
driver --1 could NOT get key at time 0
# driver --2 could NOT get key at time 0
# driver --1 could NOT get key at time 0
# driver --2 could NOT get key at time 0
# driver --1 could NOT get key at time 0
# driver --2 could NOT get key at time 0
# driver --1 could NOT get key at time 0
# driver --2 could NOT get key at time 0
# driver --1 could NOT get key at time 0
# driver --2 could NOT get key at time 0
#  quit -f

///////////////////////////////////////////////////////////////////////////////////////////////////////*/


/*module test_semaphore;

  // Semaphore handle
  semaphore sem;

  // Driver class
  class driver;

    // send task with input string for identification
    task send(input string var1);
      if (sem.try_get(1)) begin  // Non-blocking get
        #1;
        $display("%s got key at time %0t", var1, $time);
        
      end else begin
        $display("%s could NOT get key at time %0t", var1, $time);
	sem.put(1);
        $display("%s dropped key at time %0t", var1, $time);
      end
    endtask

  endclass : driver

  // Declare an array of two driver handles
  driver drv[2];

  // Initial block
  initial begin
    // Create semaphore with 1 key
    sem = new();

    // Create driver instances
    drv[0] = new();
    drv[1] = new();

    // Repeat 5 times and fork both driver sends in parallel
    repeat(5) begin
      fork
        drv[0].send("driver --1");
        drv[1].send("driver --2");
      join
    end
  end

endmodule

output: driver --1 could NOT get key at time 0
# driver --1 dropped key at time 0
# driver --2 got key at time 1
# driver --1 could NOT get key at time 1
# driver --1 dropped key at time 1
# driver --2 got key at time 2
# driver --1 could NOT get key at time 2
# driver --1 dropped key at time 2
# driver --2 got key at time 3
# driver --1 could NOT get key at time 3
# driver --1 dropped key at time 3
# driver --2 got key at time 4
# driver --1 could NOT get key at time 4
# driver --1 dropped key at time 4
# driver --2 got key at time 5
#  quit -f 
//////////////////////////////////////////////////////////////////////////*/

/*module test_semaphore;

	// In class driver
		
              class driver;

		// write task send with input argument of string type
			task send(input string var1);

			// Get the key using sem handle 
			sem.get(1);
			#1;
			// Display the string which indicates the respective driver information
			$display("%s got key", var1);
					
			// Put the key using sem handle 
			sem.put(1);
			
			#2;	
		
			// Display the string which indicates the respective driver information
			$display("%s dropped key", var1);
			endtask
     		endclass : driver

	// Declare an array of two drivers  
	driver drv[2];
		
	// Declare a handle for semaphore
	semaphore sem;

	// Within initial block
	initial
		begin
			drv[0]=new();
			drv[1]=new();


		// Create instances of drivers
			
			sem=new(0);

		// Create the instance of semaphore handle and initialize it with 1 key
			repeat(5)
				
					fork
						drv[0].send("driver --1");
						drv[1].send("driver --2");
					join
				
			
		end
		// Call send task of both drivers 5 times within fork join
		// pass any meaning full string message to indicate the driver information


	endmodule 


output:Noting will be print

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////*/

module test;

  class producer;
    task send(int id, string msg);
      if (sem.try_get(1))
        $display("%s[%d] got the key at t=%t", msg, id, $time);
      else
        $display("no keys are available at t=%t", $time);
      #2;
      sem.put(1);
      $display("%s[%d] drops the key at t=%t", msg, id, $time);
    endtask
  endclass

  class consumer;
    task send(int id, string msg);
      if (sem.try_get(1))
        $display("%s[%d] got the key at t=%t", msg, id, $time);
      else
        $display("no keys are available at t=%t", $time);
      #2;
      sem.put(1);
      $display("%s[%d] drops the key at t=%t", msg, id, $time);
    endtask
  endclass

  producer p;
  consumer c;
  semaphore sem;

  initial begin
    sem = new(1); // initialize with 1 key
    repeat(2) begin
      fork
        p.send(0, "p");
        c.send(0, "c");
      join
    end
  end

endmodule

output:
# p[          0] got the key at t=                   0
# no keys are available at t=                   0
# p[          0] drops the key at t=                   2
# c[          0] drops the key at t=                   2
# p[          0] got the key at t=                   2
# c[          0] got the key at t=                   2
# p[          0] drops the key at t=                   4
# c[          0] drops the key at t=                   4
#  quit -f
# End time: 14:41:41 on AUG 28,2025, Elapsed time: 0:00:59

