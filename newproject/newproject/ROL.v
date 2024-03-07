module ROL(
	input[31:0] A, //value being rotated
	input[31:0] B, //amount of bits A is being rotated
	output reg [31:0] rolresult
);
	
always @ (A or B)
	begin
		rolresult = ( A << B ) | ( A >> (32-B));
	end
endmodule
