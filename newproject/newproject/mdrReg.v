module mdrReg(
	input clear, clock, MDRin, Read,
	input [31:0] Mdatain, BusMuxOut,
	output [31:0] BusMuxIn
);

reg [31:0] mdrregdata;

initial mdrregdata = 8'h0;
always @ (posedge clock)
		begin 
			if (clear) begin
				mdrregdata <= {32{1'b0}};
			end
			else if (MDRin) begin
				case (Read)
//					mdrregdata = 32'h10101010;
					1'b0 : mdrregdata = BusMuxOut;
					1'b1 : mdrregdata = Mdatain;
				endcase
			end
		end
		
assign BusMuxIn = mdrregdata;

endmodule
