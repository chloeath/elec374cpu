module ROL(
	input[31:0] A, 
	input[31:0] B, 
	output reg [31:0] rolresult
);
	
always @ (A or B)
	begin
		rolresult = ( A << B ) | ( A >> (32-B));
	end
endmodule
