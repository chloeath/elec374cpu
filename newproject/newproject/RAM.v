module RAM(
input [32:0]address,
input Read, write, clk,
input [32:0] Mdatain,
output reg [32:0] Q
);

reg [31:0] memory[511:0];

initial begin
memory[0] = 32'b00000001000000000000000010010101;	//ld r2 0x95
end 

always@(posedge clk) begin
if (write) begin
memory[address] <= Mdatain;
end
else begin
	Q <= memory[address];
	end 
end
endmodule
