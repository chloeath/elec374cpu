module SHRA(

input signed [31:0] A, B,
output reg [31:0] shraresult

);

always @(A or B)
	begin
		shraresult = A >>> B;
	end
endmodule
