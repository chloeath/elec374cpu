module RAM(
input [31:0]address,
input Read, write, clk,
input [31:0] Mdatain,
output reg [31:0] Q
);

reg [31:0] memory[511:0];

initial begin
memory[0] = 32'b00000001000000000000000010010101; //ld r2 0x95
memory[149] = 32'b10101010101010101010101010101010;
end 

always@(Read or write) begin
if (Read) begin
Q <= memory[address];
end else if (write) begin
memory[address] <= Mdatain;
end
end

endmodule
