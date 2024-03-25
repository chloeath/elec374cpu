module PC_reg(
input clear, clk, IncPC, enable,
	input [31:0] pcData,
	output reg[31:0] pcOut
	);
	
	initial pcOut = 0;
	always @ (posedge clk)
	begin
		if(IncPC == 1 && enable ==1)
			pcOut <= pcOut + 1;
		else if (enable == 1)
			pcOut <= pcData;
		else if (clear ==1)
			pcOut<= 32'b0;
	end			
 endmodule
 