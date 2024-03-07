`timescale 1ns/10ps
module tutorial_tb();
reg clock, clear; 

reg RAout, R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out, 
	RYout, RZHIout, RZLOout, PCout, IRout, HIout, LOout, MDRout, PORTout; 

reg RAin, R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in, 
	RYin, RZin, PCin, IRin, HIin, LOin, MDRin, PORTin;

reg [31:0] RegisterAImmediate;

reg [3:0] present_state;

DataPath DP(
	clock, clear,
	RegisterAImmediate,
	
	RAout, R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out, 
	RYout, RZHIout, RZLOout, PCout, IRout, HIout, LOout, MDRout, PORTout,
	
	RAin, R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in, 
	RYin, RZin, PCin, IRin, HIin, LOin, MDRin, PORTin
);

	

parameter init = 4'd1, T0 = 4'd2, T1 = 4'd3, T2 = 4'd4, T3 = 4'd5, T4 = 4'd6;
			 
initial begin clock = 0; present_state = 4'd0; end
always #10 clock = ~clock;
always @ (negedge clock) present_state = present_state + 1;
	
always @(present_state) begin
	case(present_state)
		init: begin
			clear <= 1;
			RegisterAImmediate <= 8'h00;
			RZLOout <= 0; RAout <= 0; R1out <= 0; RAin <= 0; R1in <= 0; RZin <= 0; RYin <= 0; RYout <= 0;
			#15 clear <= 0;
		end
		T0: begin		
			RegisterAImmediate <= 32'b111; RAin <= 1;
			#15 RegisterAImmediate <= 8'h000; RAin <= 0;	
		end
		T1: begin
			RAout <= 1; RYin <= 1;
			#15 RAout <= 0; RYin <= 0;
		end
		T2: begin
			RAin <= 1; RegisterAImmediate <= 32'b101;
			#15 RAin <= 0; RegisterAImmediate <= 8'h000;
		end
		T3: begin
			RZin <= 1; RAout <= 1; RYout <= 1;
			#15 RZin <= 0; RAout <= 0; RYout <= 0;
		end
		T4: begin
			RZLOout <= 1; R1in <= 1;
			#15 R1in <= 0; RZLOout <= 0;
		end
	endcase
end
endmodule
