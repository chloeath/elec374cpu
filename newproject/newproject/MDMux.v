module MDMux(
input wire [31:0]input1,
input wire [31:0]input2,
input wire read,
output wire [31:0]MDMuxOut
);
assign MDMuxOut = (read == 1'b0) ? input1 : input2;
endmodule 