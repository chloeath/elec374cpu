module ROR(
	input[31:0] A, //value being rotated
	input[31:0] B, //amount of bits A is being rotated
	output reg [31:0] rorresult
);
	
always @ (A or B)
	begin
		rorresult = (A >> B) | (A << (32-B));
	end
endmodule
