`timescale 1ns/10ps
module st_tb ();
reg clock, clear; 

reg RAout, R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out, 
	RYout, RZHIout, RZLOout, PCout, IRout, HIout, LOout, MDRout, MARout, PORTout;

reg RAin, R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in, 
	RYin, RZin, PCin, IRin, HIin, LOin, MDRin, MARin, PORTin, Read, Write, IncPC, grb, BAout, rin, rout, Yin, Cout, gra, grc;

reg [31:0] Mdatain;

reg [15:0] rins, routs;


reg [4:0] ops;

reg [3:0] present_state;


DataPath DP(
	.clock(clock),
	.clear(clear),
	.Mdatain(Mdatain),
	.ops(ops),
	.RAout(RAout),
	 .R0out(R0out),
	 .R1out(R1out),
	 .R2out(R2out),
	 .R3out(R3out),
	 .R4out(R4out),
	 .R5out(R5out),
	 .R6out(R6out),
	 .R7out(R7out),
	 .R8out(R8out),
	 .R9out(R9out),
	 .R10out(R10out),
	 .R11out(R11out),
	 .R12out(R12out),
	 .R13out(R13out),
	 .R14out(R14out),
	 .R15out(R15out), 
	 .RYout(RYout),
	 .RZHIout(RZHIout),
	 .RZLOout(RZLOout), 
	 .PCout(PCout),
	 .IRout(IRout),
	 .HIout(HIout),
	 .LOout(LOout),
	 .MDRout(MDRout),
	 .MARout(MARout),
	 .PORTout(PORTout),
	 .Cout(Cout),
	 .RAin(RAin),
	 .R0in(R0in),
	 .R1in(R1in),
	 .R2in(R2in),
	 .R3in(R3in),
	 .R4in(R4in),
	 .R5in(R5in),
	 .R6in(R6in),
	 .R7in(R7in),
	 .R8in(R8in),
	 .R9in(R9in),
	 .R10in(R10in),
	 .R11in(R11in),
	 .R12in(R12in),
	 .R13in(R13in),
	 .R14in(R14in),
	 .R15in(R15in),
	 .RYin(RYin),
	 .RZin(RZin),
	 .PCin(PCin),
	 .IRin(IRin),
	 .HIin(HIin),
	 .LOin(LOin),
	 .MDRin(MDRin),
	 .MARin(MARin),
	 .PORTin(PORTin),
	 .Read(Read),
	 .Write(Write),
	 .gra(gra),
	 .grb(grb),
	 .grc(grc),
	 .rin(rin),
	 .rout(rout),
	 .BAout(BAout),
	 .IncPC(IncPC)
	 //.rins(rins),
	 //.routs(routs)
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
			clear <= 1; Read <= 0;
			PCout<=0; 
			MDRout<=0; IRin <=0;
			Read<=0;
			RZLOout <= 0; MDRout <= 0; R1out <= 0; MDRin <= 0; R1in <= 0; R2in <= 0; R2out <= 0; RZin <= 0; RYin <= 0; RYout <= 0;
			RZHIout <= 0; HIin <= 0;
			gra<=0; grb<=0; grc<=0;
			rin<=0; rout<=0; BAout<=0;
			#10 clear <= 0;
		end
		T0: begin		
			PCout <= 1; MARin <= 1; IncPC <= 1; RZin <= 1; //put value of PC in MAR
			#15 PCout <= 0; MARin <= 0; IncPC <= 0; RZin <= 0;
		end
		T1: begin
			RZLOout <=1; PCin <=1; Read <=1; MDRin<=1;  // put value of RAM[MAR] in MDR
			#15 RZLOout <=0;PCin <=0;  MDRin<=0; Read <=0;
		end		
		T2: begin
			MDRout <= 1; IRin <=1;  //put value of MDR in IR
			#15 MDRout <= 0; IRin <=0;
		end
		T3: begin
			grb <=1; BAout<=1; RYin <=1;   
			#15 grb<=0; BAout<=0; RYin<=0;
		end	
		T4: begin
			Cout <=1;  RZin<=1; ops <= 5'b00011;  // load B of alu with immediate addres and add with RY (RB)
			#15 Cout <=0;  RZin<=0;
		end
		T5: begin
			RZLOout <= 1; MARin<=1; //put calculated address in MAR- working
			#15 RZLOout <= 0; MARin<=0;
		end
		T6: begin
			gra <= 1; rout <= 1; MDRin <= 1;
			#15 gra<=0; rout<=0; MDRin<=0;
		end
		T7: begin
			MDRout<=1;
			#5 Write<=1;
			
		end
	
	endcase
end
endmodule 