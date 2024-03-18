
module alu(
	input [4:0] ops,
	input [31:0] A, B,
	output reg [63:0] Zregin
);

//reg [63:0] x;

wire [31:0] addresult, andresult, orresult, notresult, negresult, rorresult, rolresult, shlresult, shrresult, shraresult, subresult;

wire [63:0] mulresult, divresult;



ADD ADD(A, B, addresult);
AND_mod AND_mod(A, B, andresult);
OR_mod OR_mod(A, B, orresult);
NOT_mod NOT_mod(A, notresult);
NEG NEG(A, negresult);
MUL MUL(A, B, mulresult);
ROR ROR(A, B, rorresult);
ROL ROL(A, B, rolresult);
SHL SHL(A, B, shlresult);
SHR SHR(A, B, shrresult);
SHRA SHRA(A, B, shraresult);
SUB SUB(A, B, subresult);
DIV DIV(A, B, divresult);

//... continue this

//NEED TO IMPLEMENT AND, OR, SUB, MUL, DIV, SHR, SHRA, SHL, ROR, ROL, NEG, NOT

//addresult or andresult or orresult or notresult or negresult or rorresult or rolresult or shlresult or shrresult or shraresult or mulresult

always @(*) begin
	case(ops)
		5'b00000: Zregin = addresult;
		5'b00001: Zregin = andresult; 
		5'b00010: Zregin = orresult;
		5'b00011: Zregin = notresult;
		5'b00100: Zregin = negresult;
		5'b00101: Zregin = mulresult;
		5'b00110: Zregin = rorresult;
		5'b00111: Zregin = rolresult;
		5'b01000: Zregin = shlresult;
		5'b01001: Zregin = shrresult;
		5'b01010: Zregin = shraresult;
		5'b01011: Zregin = divresult;
		5'b01100: Zregin = subresult;

endcase
end



endmodule
