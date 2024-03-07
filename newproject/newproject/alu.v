
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
//		5'b01101: x = bmi_13;
//		5'b01110: q = bmi_14;
//		5'b01111: q = bmi_15;
//		5'b10000: q = bmi_16;
//		5'b10001: q = bmi_17;
//		5'b10010: q = bmi_18;
//		5'b10011: q = bmi_19;
//		5'b10100: q = bmi_20;
//		5'b10101: q = bmi_21;
//		5'b10110: q = bmi_22;
//		5'b10111: q = bmi_23;
//		5'b11000: q = bmi_24;
//		5'b11001: q = bmi_25;
//		5'b11010: q = bmi_26;
//		5'b11011: q = bmi_27;
//		5'b11100: q = bmi_28;
//		5'b11101: q = bmi_29;
//		5'b11110: q = bmi_30;
//		5'b11111: q = bmi_31;
	endcase 
end


//assign Zregin = x;

endmodule
