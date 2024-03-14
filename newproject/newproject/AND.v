
module AND (A, B, andresult);

input [31:0] A, B;
output [31:0] andresult;


reg [31:0] andresult;


integer i;

always @(A or B)
begin
		for (i = 0; i < 32; i = i + 1)
		begin
			andresult[i] = A[i] & B[i];
		end
end

endmodule
