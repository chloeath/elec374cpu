//OR module
module OR (A, B, orresult);

input [31:0] A, B;
output [31:0] orresult;

reg [31:0] orresult;

integer i;

always @(A or B)
	begin
		for (i = 0; i < 32; i = i + 1)
		begin
			orresult[i] = A[i] | B[i];
		end
	end
endmodule
