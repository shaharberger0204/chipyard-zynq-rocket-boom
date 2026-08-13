module pulse_gen (
    input        clk,        // 100 MHz
    input        rst_n,      // active-low reset
    input [31:0] ctrl,       // control bus from AXI GPIO
    output reg   pulse_out
);

    wire        enable;
    wire [30:0] N;
    reg  [30:0] cnt;

    assign enable = ctrl[0];
    assign N      = ctrl[31:1];

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            cnt       <= 31'd0;
            pulse_out <= 1'b0;
        end else if (!enable) begin
            cnt       <= 31'd0;
            pulse_out <= 1'b0;
        end else if (N == 31'd0) begin
            // Safety: avoid invalid configuration
            cnt       <= 31'd0;
            pulse_out <= pulse_out; // or force 0 if you prefer
        end else if (cnt == (N - 1)) begin
            cnt       <= 31'd0;
            pulse_out <= ~pulse_out;
        end else begin
            cnt <= cnt + 1'b1;
        end
    end

endmodule