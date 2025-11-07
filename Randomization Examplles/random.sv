/*1. Write a system verilog constraint that should follow the below Rules.

	a. The dynamic array should contain 20 items.

	b. Out of 20 items, the values of 3 items should be equal to 5 at random positions.

	c. The values of 5 items must be 10 at random positions.

	d. The values of 8 items must be 15 and the remaining 4 items must be 20.*/
/* module tb;
    class array_constraints;
        rand int dynamic_array[];  // Dynamic array to be randomized

        // Constraint (a): Array size must be 20
        constraint array_size { dynamic_array.size() == 20; }

        // Constraint (b): Exactly 3 items must be 5 (random positions)
        constraint three_items_five {
            dynamic_array.sum() with ( (item == 5) ? 1 : 0 ) == 3;
        }

        // Constraint (c): Exactly 5 items must be 10 (random positions)
        constraint five_items_ten {
            dynamic_array.sum() with ( (item == 10) ? 1 : 0 ) == 5;
        }

        // Constraint (d): Exactly 8 items must be 15 and 4 items must be 20
        constraint remaining_items {
            dynamic_array.sum() with ( (item == 15) ? 1 : 0 ) == 8;
            dynamic_array.sum() with ( (item == 20) ? 1 : 0 ) == 4;
        }

        // Additional constraint to ensure no other values are allowed
        constraint allowed_values {
            foreach (dynamic_array[i]) {
                dynamic_array[i] inside {5, 10, 15, 20};
            }
        }
    endclass

    initial begin
        array_constraints ac = new();
        if (ac.randomize()) begin
            $display("Randomized array: %p", ac.dynamic_array);
            // Verification
            $display("Count of 5s: %0d", ac.dynamic_array.sum() with ( (item == 5) ? 1 : 0 ));
            $display("Count of 10s: %0d", ac.dynamic_array.sum() with ( (item == 10) ? 1 : 0 ));
            $display("Count of 15s: %0d", ac.dynamic_array.sum() with ( (item == 15) ? 1 : 0 ));
            $display("Count of 20s: %0d", ac.dynamic_array.sum() with ( (item == 20) ? 1 : 0 ));
        end else begin
            $display("Randomization failed!");
        end
    end
endmodule */
//2. Write a constraint for the sum of the product of two matrices to be less than 1000.
/*module tb;
    class matrix_constraints;
        // Define two 2D matrices (e.g., 3x3 for illustration)
        rand int matrix1[3][3];
        rand int matrix2[3][3];
        
        // Helper function to compute matrix product and return sum
        function int sum_of_product();
            automatic int product[3][3];
            automatic int sum = 0;
            
            // Compute matrix product (matrix1 * matrix2)
            for (int i = 0; i < 3; i++)
			begin
                for (int j = 0; j < 3; j++) 
				begin
                    product[i][j] = 0;
                    for (int k = 0; k < 3; k++) 
					begin
                        product[i][j] += matrix1[i][k] * matrix2[k][j];
                    end
                    sum += product[i][j];  // Sum all elements
                end
            end
            
            return sum;
        endfunction
        
        // Constraint: Sum of matrix product must be < 1000
        constraint sum_lt_1000 { sum_of_product() < 1000; }
        
        // Optional: Constrain matrix values to reasonable ranges for solvability
        constraint matrix_bounds {
            foreach (matrix1[i,j]) {
                matrix1[i][j] inside {[-10:10]};
                matrix2[i][j] inside {[-10:10]};
            }
        }
    endclass

    initial begin
        matrix_constraints mc = new();
        if (mc.randomize()) 
		begin
            $display("Matrix 1: %p", mc.matrix1);
            $display("Matrix 2: %p", mc.matrix2);
            $display("Sum of product: %0d", mc.sum_of_product());
        end 
		else 
		begin
            $display("Randomization failed!");
        end
    end
endmodule */
//3. Write a constraint to generate a random value for a var1 [7:0] within 50 and var2 [7:0] with the non-repeated value in every randomization?
/*module tb;
    class rand_values;
        rand bit [7:0] var1;  // 8-bit variable (0-255)
        rand bit [7:0] var2;  // 8-bit variable (0-255)
        
        // Store history of used var2 values
        static bit [7:0] var2_history[$];  // Queue to track past values
        
        // Constraint for var1: Must be <= 50
        constraint var1_range {
            var1 inside {[0:50]};
        }
        
        // Constraint for var2: Must be unique (not in history)
        constraint var2_unique {
            !(var2 inside {var2_history});
        }
        
        // Post-randomization: Update history
        function void post_randomize();
            var2_history.push_back(var2);
        endfunction
        
        // Optional: Clear history (if needed)
        function void clear_history();
            var2_history.delete();
        endfunction
    endclass

    initial begin
        rand_values rv = new();
        
        // Randomize 5 times (demonstrates non-repeating var2)
        repeat (5) begin
            if (rv.randomize()) begin
                $display("var1 = %0d, var2 = %0d", rv.var1, rv.var2);
            end else begin
                $display("Randomization failed!");
            end
        end
    end
endmodule */

//4. Write a constraint for 2D arrays where the value of an element should be different from its neighbors.
/*module tb;
    class array_constraints;
        // Dynamic 2D array (adjust size as needed)
        rand bit [7:0] array[][];  // 8-bit elements (0-255)
        int rows;
        int cols;

        // Initialize array dimensions
        function new(int r, int c);
            rows = r;
            cols = c;
            array = new[rows];
            foreach (array[i]) array[i] = new[cols];
        endfunction

        // Constraint: Each element must differ from its neighbors
        constraint neighbor_diff {
            foreach (array[i, j]) {
                // Left neighbor (if not in column 0)
                if (j > 0) array[i][j] != array[i][j-1];
                // Right neighbor (if not in last column)
                if (j < cols-1) array[i][j] != array[i][j+1];
                // Top neighbor (if not in row 0)
                if (i > 0) array[i][j] != array[i-1][j];
                // Bottom neighbor (if not in last row)
                if (i < rows-1) array[i][j] != array[i+1][j];
            }
        }

        // Optional: Print the array
        function void print_array();
            $display("Generated 2D Array:");
            foreach (array[i]) 
			begin
                foreach (array[i][j]) $write("%0d ", array[i][j]);
                $display();
            end
        endfunction
    endclass

    initial
	begin
        array_constraints ac = new(4, 4);  // 4x4 array
        if (!ac.randomize()) $error("Randomization failed");
        ac.print_array();
    end
endmodule */
