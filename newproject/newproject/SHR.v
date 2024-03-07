module SHR(

input [31:0] A, B,
output reg [31:0] shrresult

);

always @(A or B)
	begin
		shrresult = A >> B; //Not sure why I need to include reg there, it gave me error before on only this module
	end
endmodule
