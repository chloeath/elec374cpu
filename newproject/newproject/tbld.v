`timescale 1ns/10ps
module tbld();
reg clock, clear; 

reg RAout, R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out, 
	RYout, RZHIout, RZLOout, PCout, IRout, HIout, LOout, MDRout, PORTout;

reg RAin, R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in, 
	RYin, RZin, PCin, IRin, HIin, LOin, MDRin, PORTin, Read, MARin, IncPC, Grb, BAOut, Yin, Cout, Gra;

reg [31:0] Mdatain;


reg [4:0] ops;

reg [3:0] present_state;

DataPath DP(
	clock, clear,
	Mdatain, ops,
	
	RAout, R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out, 
	RYout, RZHIout, RZLOout, PCout, IRout, HIout, LOout, MDRout, PORTout,
	
	RAin, R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in, 
	RYin, RZin, PCin, IRin, HIin, LOin, MDRin, PORTin, Read
);

parameter init = 4'd1, T0 = 4'd2, T1 = 4'd3, T2 = 4'd4, T3 = 4'd5, T4 = 4'd6, T5 = 4'd7, T6 = 4'd8, T7 = 4'd9;
			 
initial begin 
clock = 0; present_state = 4'd0; 
end
always #10 clock = ~clock;
always @ (negedge clock) present_state = present_state + 1;
	
always @(present_state) begin
	case(present_state)
		init: begin
			clear <= 1; Read <= 1;
			PCout<=0; 
			MDRout<=1; IRin <=1;
			RZLOout <= 0; MDRout <= 0; R1out <= 0; MDRin <= 0; R1in <= 0; R2in <= 0; R2out <= 0; RZin <= 0; RYin <= 0; RYout <= 0;
			RZHIout <= 0; HIin <= 0;
			#10 clear <= 0;
		end
		T0: begin		
			PCout <= 1; MARin <= 1; IncPC <= 1; RZin <= 1;
			#15 PCout <= 0; MARin <= 0; IncPC <= 0; RZin <= 0;
		end
		T1: begin
			RZLOout <=1; PCin <=1; Read <=1; MDRin<=1;
			#15 RZLOout <=0;PCin <=0;Read <=0; MDRin<=0; 
		end		
		T2: begin
			MDRout <= 1; IRin <=1;
			#15 MDRout <= 0; IRin <=0;
		end
		T3: begin
			MDRout <= 1; R2in <= 1;
			#15 MDRout <= 0; R2in <= 0;
		end	
		T4: begin
			Cout <=1;  RZin<=1; opcode = '00011'
			#15 Cout <=0;  RZin<=0;
		end
		T5: begin
			RZLOout <= 1; MARin <= 1;
			#15 RZLOout <= 0; MARin <= 0;
		end
		T6: begin
			Read <= 1; MDRin<= 1;
			#15 Read <= 0; MDRin<= 0;
		end
		T7: begin
			MDRout <= 1; Gra <=1; MDRin<=1;
			#15 MDRout <= 0; Gra <=0; MDRin<=0;
		end
	endcase
end
endmodule 