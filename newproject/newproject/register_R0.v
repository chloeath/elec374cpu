module register_R0(
    input wire clk,     // Clock input
    input wire clr,     // Clear input (synchronous reset)
    input wire enable,  // Enable input
    input wire BAout,   // Control signal to output zeros
    input wire [31:0] BusMuxOut,// Data input
    output wire [31:0] BusMuxIn_R0// Data output
);
reg [31:0]q;
initial q = 32'b0;
// Synchronous reset, data load on rising edge of clock
always @(posedge clk) begin
    if (clr) begin
        q <= 32'b0; // Clear the register if clr is high
    end else if (enable) begin
        q <= BusMuxOut; // Load the data into the register if enabled
    end
end

// Output zero when BAout is asserted
assign BusMuxIn_R0 = (BAout) ? 32'b0 : q;

endmodule
