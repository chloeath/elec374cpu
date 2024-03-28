module RAM(
input [31:0]address,
input Read, write, clk,
input [31:0] Mdatain,
output reg [31:0] Q
);

reg [31:0] memory[511:0];

initial begin
memory[0] = 32'b00000001000001001010100000000000; //ld r2 0x95
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
