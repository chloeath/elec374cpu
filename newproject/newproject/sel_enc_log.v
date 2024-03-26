module sel_enc_log(
	input [31:0] ir,
	input gra, grb, grc, rin, rout, BAout,
	output [15:0] rins, routs,
	output [31:0] cSignExtended
);

wire [3:0] s1, s2, s3, s4;
reg [15:0] decodeOut;
wire s5;

assign s1 = ir[26:23] & {4{gra}};
assign s2 = ir[22:19] & {4{grb}};
assign s3 = ir[18:15] & {4{grc}};
assign s4 = s1 & s2 & s3;

always @(*) begin
	decodeOut = 16'b0;
	decodeOut[s4]= 1'b1;
end

assign rins= {16{rin}} & decodeOut;

assign s5 = BAout | rout;

assign routs= {16{s5}} & decodeOut;

assign cSignExtended = {{14{ir[18]}}, ir[18:0]};

endmodule