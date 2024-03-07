`timescale 1ns/10ps
module tbtestalu();
reg clock, clear; 

reg RAout, R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out, 
	RYout, RZHIout, RZLOout, PCout, IRout, HIout, LOout, MDRout, PORTout; 

reg RAin, R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in, 
	RYin, RZin, PCin, IRin, HIin, LOin, MDRin, PORTin, Read;

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


parameter init = 4'd1, T0 = 4'd2, T1 = 4'd3, T2 = 4'd4, T3 = 4'd5, T4 = 4'd6, T5 = 4'd7, T6 = 4'd8;
			 
initial begin clock = 0; present_state = 4'd0; end
always #10 clock = ~clock;
always @ (negedge clock) present_state = present_state + 1;
	
always @(present_state) begin
	case(present_state)
		init: begin
			clear <= 1; Read <= 1;
			Mdatain <= 8'h00; ops <= 5'b00101;
			RZLOout <= 0; MDRout <= 0; R1out <= 0; MDRin <= 0; R1in <= 0; R2in <= 0; R2out <= 0; RZin <= 0; RYin <= 0; RYout <= 0;
			RZHIout <= 0; HIin <= 0;
			#10 clear <= 0;
		end
		T0: begin		
			//Mdatain <= 32'b1001; MDRin <= 1;
			Mdatain <= 32'hfffffffd; MDRin <= 1; //for testing SHR AND SHRA
			#15 Mdatain <= 8'h0000; MDRin <= 0;	
		end
		T1: begin
			MDRout <= 1; RYin <= 1;
			#15 MDRout <= 0; RYin <= 0;
		end		
		T2: begin
			MDRin <= 1; Mdatain <= 32'b100;
			#15 MDRin <= 0; Mdatain <= 8'h0000;
		end
		T3: begin
			MDRout <= 1; R2in <= 1;
			#15 MDRout <= 0; R2in <= 0;
		end	
		T4: begin
			RZin <= 1; R2out <= 1; RYout <= 1;
			#15 RZin <= 0; R2out <= 0; RYout <= 0;
		end
		T5: begin
			RZLOout <= 1; R1in <= 1;
			#15 R1in <= 0; RZLOout <= 0;
		end
		T6: begin
			RZHIout <= 1; HIin <= 1;
			#15 HIin <= 0; RZHIout <= 0;
		end
	endcase
end
endmodule
