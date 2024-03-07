
module SUB(

input [31:0] A, B,
output reg [31:0] subresult

);

reg [31:0] negB;

reg [32:0] LocalCarry;

integer i;

always@(A or B)
	begin
		negB = ~B + 1;
		LocalCarry = 32'b0;
		for(i = 0; i < 32; i = i + 1)
		begin
				subresult[i] = A[i]^negB[i]^LocalCarry[i];
				LocalCarry[i+1] = (A[i]&negB[i])|(LocalCarry[i]&(A[i]|negB[i]));
		end
end

endmodule
