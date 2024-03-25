module RAM(
input [32:0]address,
input read, write, clk,
input [32:0] Mdatain
output [32:0] BusMuxOut,
)

reg [31:0] memory [511:0]

intial begin(
Mdatain = 4'h1234
end 

always@(posedge clk) begin
if (read)
	BusMuxOut <= memory[address]
else if (write)
	memory[address] <= Mdatain
end
