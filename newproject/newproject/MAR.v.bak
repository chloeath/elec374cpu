module MAR(
    input wire [31:0] D,       // Data input
    input wire enable,         // Enable signal for the register
    input wire clk,            // Clock signal
    input wire clr,            // Clear signal
    output reg [31:0] Q        // Output of the register
);

    // Synchronous clear and data latch operation
    always @(posedge clk or posedge clr) begin
        if (clr) begin
            Q <= 32'b0;           // Clear the register if clr is high
        end
        else if (enable) begin
            Q <= D;               // Latch data on rising edge of clock when enabled
        end
    end

endmodule
