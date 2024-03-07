module SHL(

input [31:0] A, B,
output reg [31:0] shlresult

);

always @(A or B)
	begin
		shlresult = A << B;
	end
endmodule
