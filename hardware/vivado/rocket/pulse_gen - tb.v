`timescale 1ns / 1ps

module pulse_gen_tb();

    // ---------------------------------------------------------
    // 1. Signal Declarations
    // ---------------------------------------------------------
    reg clk;             // Clock input to the UUT
    wire pulse_out;      // Output from the UUT to observe

    // ---------------------------------------------------------
    // 2. Instantiate the Unit Under Test (UUT)
    // ---------------------------------------------------------
    pulse_gen uut (
        .clk(clk),
        .pulse_out(pulse_out)
    );

    // ---------------------------------------------------------
    // 3. Clock Generation (100MHz)
    // ---------------------------------------------------------
    // A 100MHz clock has a period of 10ns. 
    // We toggle the clock every 5ns to achieve this.
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    // ---------------------------------------------------------
    // 4. Test Scenario
    // ---------------------------------------------------------
    initial begin
        // Print message to the Tcl Console
        $display("Starting Simulation at time %t", $time);
        
        // Wait for 100ns to let initial signals settle
        #100;

        // IMPORTANT SIMULATION TIP:
        // Your pulse_gen counts to 50,000,000 before toggling.
        // At 100MHz, this takes 500ms (half a second). 
        // Software simulations are much slower than real hardware. 
        // To see results quickly in the waveform, change '49999999' 
        // in your Verilog code to a smaller number like '100'.

        // Wait for a significant amount of time to see the pulse toggle
        // If you changed the counter to 100, you will see a toggle here.
        #2000; 

        $display("Simulation finished at time %t", $time);
        $finish; // Stop the simulation
    end

endmodule