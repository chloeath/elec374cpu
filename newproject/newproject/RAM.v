module RAM(
input [31:0]address,
input Read, write, clk,
input [31:0] Mdatain,
output reg [31:0] Q
);

reg [31:0] memory[511:0];

initial begin

//memory[0] = 32'b00000001000000000000000010010101; //ld r2 0x95
//memory[0] = 32'b00000000000100000000000000111000; //ld R0, 0x38(R2)
//memory[0] = 32'b00001001000000000000000010010101; //ldi R2, 0x95
//memory[0] = 32'b00001000000100000000000000111000; //ldi R0, 0x38(R2)
//memory[0] = 32'b00010000100000000000000010000111; //st 0x87, R1
//memory[0] = 32'b00010000100010000000000010000111; //st 0x87(R1), R1
//memory[0] = 32'b01100001101001111111111111111011; //addi r3, r4, -5
//memory[0] = 32'b01100001101000000000000001010011;//andi r3, r4, 0x53
//memory[0] = 32'b01110001101000000000000001010011;  //ori r3, r4, 0x53
//memory[0] = 32'b10011010100000000000000000001110; //brzr R5,14
//memory[0] = 32'b10011010101000000000000000001110; //brnz R5,14
//memory[0] = 32'b10011010110000000000000000001110; //brpl R5,14 
//memory[0] = 32'b10011010111000000000000000001110; //brmi R5,14
//memory[0] = 32'b11000011000000000000000000000000; //mfhi r6
//memory[0] = 32'b11001011100000000000000000000000; //mflo r7
memory[0]= 32'b10111001100000000000000000000000;  //out r3
//memory[0] = 32'b10110010000000000000000000000000; //in r4
memory[149] = 32'b10101010101010101010101010101010;  //location hex 95
memory[56] = 32'b11111111111111111111111111111111; //location hex 38
end 

always@(Read or write) begin
if (Read) begin
Q <= memory[address];
end else if (write) begin
memory[address] <= Mdatain;
end
end

endmodule
