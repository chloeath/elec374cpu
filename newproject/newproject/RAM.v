module RAM(
input [31:0]address,
input Read, write, clk,
input [31:0] Mdatain,
output reg [31:0] Q
);

reg [31:0] memory[511:0];

initial begin
memory[0] = 32'b00000001000001001010100000000000; //ld r2 0x95
memory[1] = 32'b00000000000100000000000000111000; //ld R0, 0x38(R2)
memory[2] = 32'b00001001000000000000000010010101; //ldi R2, 0x95
memory[3] = 32'b00001000000100000000000000111000; //ldi R0, 0x38(R2)
memory[4] = 32'b00010000100000000000000001010111; //st 0x87, R1
memory[5] = 32'b00010000100010000000000000101011; //st 0x87(R1)
memory[6] = 32'b10011010100000000000000000001110; //brzr R5,14
memory[7] = 32'b10011010101000000000000000001110; //brnz R5,14
memory[8] = 32'b10011010110000000000000000001110; //brpl R5,14 
memory[9] = 32'b10011010111000000000000000001110; //brmi R5,14

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
