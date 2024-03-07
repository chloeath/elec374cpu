//NOT module
module NOT_mod (A, notresult);

input [31:0] A;
output [31:0] notresult;

reg [31:0] notresult;

integer i;

always @(A)
	begin
		for (i = 0; i < 32; i = i + 1)
		begin
			notresult[i] = ~A[i];
		end
	end
endmodule
