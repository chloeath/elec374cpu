module RAM(
input [32:0]address,
input read, write, clk,
input [32:0] Mdatain,
output reg [32:0] BusMuxOut
);

reg [31:0] memory[511:0];

initial begin
memory[0] = 32'b000000010000010010101; //ld r2 0x95
end 

always@(posedge clk) begin
if (read) begin
	BusMuxOut <= memory[address];
end
else if (write) begin
	memory[address] <= Mdatain;
	end 
end
endmodule
