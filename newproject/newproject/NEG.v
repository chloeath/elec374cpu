module NEG (A, negresult);

input [31:0] A;
output [31:0] negresult;

reg [31:0] negresult;

integer i;

always @(A)
	begin
		for (i = 0; i < 32; i = i + 1)
		begin
			negresult[i] = ~A[i];		
		end
		//two's compliment part
		negresult = negresult + 1;
	end
endmodule
