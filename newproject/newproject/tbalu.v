// and datapath_tb.v file: <This is the filename>
`timescale 1ns/10ps
module tbalu();

	reg clock, clear; 

	reg RAout, R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out, 
		RYout, RZHIout, RZLOout, PCout, IRout, HIout, LOout, MDRout, PORTout; 

	reg RAin, R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in, 
		RYin, RZin, PCin, IRin, HIin, LOin, MDRin, PORTin, Read;

	reg [31:0] Mdatain;
		
	reg [4:0] ops;

	parameter Default = 4'b0000, Reg_load1a = 4'b0001, Reg_load1b = 4'b0010, Reg_load2a = 4'b0011, 
	Reg_load2b = 4'b0100, Reg_load3a = 4'b0101, Reg_load3b = 4'b0110, T0 = 4'b0111,
	T1 = 4'b1000, T2 = 4'b1001, T3 = 4'b1010, T4 = 4'b1011, T5 = 4'b1100;
	
	reg [3:0] Present_state = Default;
				 

DataPath DP(
	clock, clear,
	Mdatain, ops,
	
	RAout, R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out, 
	RYout, RZHIout, RZLOout, PCout, IRout, HIout, LOout, MDRout, PORTout,
	
	RAin, R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in, 
	RYin, RZin, PCin, IRin, HIin, LOin, MDRin, PORTin, Read
);


initial
	begin
	clock = 0;
	forever #10 clock = ~ clock;
end

always @(negedge clock) // finite state machine; if clock rising-edge
begin
	case (Present_state)
		Default : #10 Present_state = Reg_load1a;
		Reg_load1a : #10 Present_state = Reg_load1b;
		Reg_load1b : #10 Present_state = Reg_load2a;
		Reg_load2a : #10 Present_state = Reg_load2b;
		Reg_load2b : #10 Present_state = Reg_load3a;
		Reg_load3a : #10 Present_state = Reg_load3b;
		Reg_load3b : #10 Present_state = T0;
		T0 : #10 Present_state = T1;
		T1 : #10 Present_state = T2;
		T2 : #10 Present_state = T3;
		T3 : #10 Present_state = T4;
		T4 : #10 Present_state = T5;
	endcase
end


always @(Present_state) 
 begin
	case (Present_state) 
		Default: begin
			clear <= 1;
			RZLOout <= 0; MDRout <= 0; 
			R2out <= 0; R3out <= 0; RZin <= 0;
			MDRin <= 0; RYin <= 0; Read <= 1;
			R1in <= 0; R2in <= 0; R3in <= 0; Mdatain <= 32'h00000000;
			#5 clear <= 0;
			
			ops <= 5'b00000; //change this when testing new operations
			
		end
		Reg_load1a: begin
			Mdatain <= 32'h00000012;
			//Read = 0; MDRin = 0; 
			Read <= 1; MDRin <= 1; 
			#15 Read <= 0; MDRin <= 0;
		end
		Reg_load1b: begin
			MDRout <= 1; R2in <= 1;
			#15 MDRout <= 0; R2in <= 0; 
		end
		Reg_load2a: begin
			Mdatain <= 32'h00000014;
			Read <= 1; MDRin <= 1;
			#15 Read <= 0; MDRin <= 0;
		end
		Reg_load2b: begin
			MDRout <= 1; R3in <= 1;
			#15 MDRout <= 0; R3in <= 0; 
		end
		Reg_load3a: begin
			Mdatain <= 32'h00000018;
			 Read <= 1; MDRin <= 1;
			#15 Read <= 0; MDRin <= 0;
		end
		Reg_load3b: begin
			MDRout <= 1; R1in <= 1;
			#15 MDRout <= 0; R1in <= 0; 
		end
		
//		T0: begin // see if you need to de-assert these signals
//			PCout <= 1; MARin <= 1; IncPC <= 1; RZin <= 1;
//		end
//		T1: begin
//			RZLOout <= 1; PCin <= 1; Read <= 1; MDRin <= 1;
//			//Mdatain <= 32'h28918000; // opcode for “and R1, R2, R3”
//			PCout <= 0; MARin <= 0; IncPC <= 0; RZin <= 0;		
//		end
//		T2: begin
//			MDRout <= 1; IRin <= 1;
//			RZLOout <= 0; PCin <= 0; Read <= 0; MDRin <= 0;
//		end
		T0: begin
			R2out <= 1; RYin <= 1;
			#15 R2out <= 0; RYin <= 0;
		end
		T1: begin
			R3out <= 1; RYout <= 1; RZin <= 1;
			#15 R3out <= 0; RYout <= 1; RZin <= 0;
		end
		T2: begin
			RZLOout <= 1; R1in <= 1;
			#15 RZLOout <= 0; R1in <= 0; //need to modify this to also output RZHIout for 64 bit operations like MUL
		end
	endcase
 end
endmodule
