// Ripple Carry ADD module
module ADD(A, B, addresult);

input [31:0] A, B;
output [31:0] addresult;

reg [31:0] addresult;
reg [32:0] LocalCarry;

integer i;

always@(A or B)
	begin
		LocalCarry = 32'b0;
		for(i = 0; i < 32; i = i + 1)
		begin
				addresult[i] = A[i]^B[i]^	LocalCarry[i];
				LocalCarry[i+1] = (A[i]&B[i])|(LocalCarry[i]&(A[i]|B[i]));
		end
end
endmodule
