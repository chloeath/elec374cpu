module DataPath(
	input wire clock, clear,
	input wire [31:0] Mdatain,
	
	input RAout, R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out, 
	RYout, RZHIout, RZLOout, PCout, IRout, HIout, LOout, MDRout, MARout, PORTout,
	
	input RAin, R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in,
	RYin, RZin, PCin, IRin, HIin, LOin, MDRin, MARin, PORTin, Read, Write, gra, grb, grc, rin, rout, BAout,
	
	input [15:0] rins, routs
	
	);

wire [31:0] BusMuxOut, BusMuxInRA, BusMuxInR0, BusMuxInR1, BusMuxInR2, BusMuxInR3, BusMuxInR4, BusMuxInR5, BusMuxInR6, BusMuxInR7, BusMuxInR8, 
	BusMuxInR9, BusMuxInR10, BusMuxInR11,BusMuxInR12, BusMuxInR13, BusMuxInR14, BusMuxInR15, RYdataout, BusMuxInHI, BusMuxInLO, BusMuxInRZHI, BusMuxInRZLO,
	BusMuxInPC, BusMuxInMDR, BusMuxInPort, BusMuxInIR, address, outputUnit, IncPC, inputUnit, MDMuxOut, RAM_out;

wire [63:0] Zregin;
wire [31:0] cSignExtended;
wire InPortEnableTemporary;

//register RA(clear, clock, RAin, RegisterAImmediate, BusMuxInRA);

register R0(clear, clock, rins[0], BusMuxOut, BusMuxInR0);
register R1(clear, clock, rins[1], BusMuxOut, BusMuxInR1);
register R2(clear, clock, rins[2], BusMuxOut, BusMuxInR2);
register R3(clear, clock, rins[3], BusMuxOut, BusMuxInR3);
register R4(clear, clock, rins[4], BusMuxOut, BusMuxInR4);
register R5(clear, clock, rins[5], BusMuxOut, BusMuxInR5);
register R6(clear, clock, rins[6], BusMuxOut, BusMuxInR6);
register R7(clear, clock, rins[7], BusMuxOut, BusMuxInR7);
register R8(clear, clock, rins[8], BusMuxOut, BusMuxInR8);	
register R9(clear, clock, rins[9], BusMuxOut, BusMuxInR9);
register R10(clear, clock, rins[10], BusMuxOut, BusMuxInR10);
register R11(clear, clock, rins[11], BusMuxOut, BusMuxInR11);
register R12(clear, clock, rins[12], BusMuxOut, BusMuxInR12);
register R13(clear, clock, rins[13], BusMuxOut, BusMuxInR13);
register R14(clear, clock, rins[14], BusMuxOut, BusMuxInR14);
register R15(clear, clock, rins[15], BusMuxOut, BusMuxInR15);
register RY(clear, clock, RYin, BusMuxOut, RYdataout);
register RZHI(clear, clock, RZin, Zregin[63:32], BusMuxInRZHI); 
register RZLO(clear, clock, RZin, Zregin[31:0], BusMuxInRZLO); 
register IR(clear, clock, IRin, BusMuxOut, BusMuxInIR);
register HI(clear, clock, HIin, BusMuxOut, BusMuxInHI);
register LO(clear, clock, LOin, BusMuxOut, BusMuxInLO);
register InPort(clear, clock, PORTin, BusMuxOut, outputUnit);
register OutPort(clear, clock, InPortEnableTemporary, inputUnit, BusMuxInPort);

PC_reg PC_reg (clear, clock, IncPC, PCin, BusMuxOut, BusMuxInPC);
MDMux MDMUX(BusMuxOut, RAM_out, Read, MDMuxOut); 	
mdrReg MDR(clear, clock, MDRin, Read, MDMuxOut, BusMuxInMDR);
MAR MAR (BusMuxOut, MARin, clock, clear, address);

RAM RAM(address, Read, Write, clock, BusMuxOut, RAM_out);

alu alu(BusMuxInIR[31:27], RYdataout, BusMuxOut, Zregin);

sel_enc_log sel_enc_log (BusMuxInIR, gra, grb, grc, rin, rout, BAout, rins, routs, cSignExtended);

/*Bus bus(BusMuxInRA, BusMuxInR0, BusMuxInR1, BusMuxInR2, BusMuxInR3, BusMuxInR4, BusMuxInR5, BusMuxInR6, BusMuxInR7, BusMuxInR8, 
	BusMuxInR9, BusMuxInR10, BusMuxInR11,BusMuxInR12, BusMuxInR13, BusMuxInR14, BusMuxInR15, BusMuxInHI, BusMuxInLO, BusMuxInRZHI, BusMuxInRZLO, 
	BusMuxInPC, BusMuxInMDR, BusMuxInPort, BusMuxInIR, address, RAout, routs[0], routs[1], routs[2], routs[3], routs[4], routs[5], routs[6], routs[7], routs[8], routs[9], routs[10],
	routs[11], routs[12], routs[13], routs[14], routs[15], RYout, RZHIout, RZLOout, PCout, IRout, HIout, LOout, MDRout, PORTout, BusMuxOut);
*/
Bus Bus (
	 .BusMuxInRA(BusMuxInRA),
	 .BusMuxInR0(BusMuxInR0),
	 .BusMuxInR1(BusMuxInR1),
	 .BusMuxInR2(BusMuxInR2),
	 .BusMuxInR3(BusMuxInR3),
	 .BusMuxInR4(BusMuxInR3),
	 .BusMuxInR5(BusMuxInR3),
	 .BusMuxInR6(BusMuxInR3),
	 .BusMuxInR7(BusMuxInR3),
	 .BusMuxInR8(BusMuxInR8), 
	 .BusMuxInR9(BusMuxInR9),
	 .BusMuxInR10(BusMuxInR10),
	 .BusMuxInR11(BusMuxInR11),
	 .BusMuxInR12(BusMuxInR12),
	 .BusMuxInR13(BusMuxInR13),
	 .BusMuxInR14(BusMuxInR14),
	 .BusMuxInR15(BusMuxInR15),
	 .BusMuxInHI(BusMuxInHI),
	 .BusMuxInLO(BusMuxInLO),
	 .BusMuxInRZHI(BusMuxInRZHI),
	 .BusMuxInRZLO(BusMuxInRZLO), 
	 .BusMuxInPC(BusMuxInPC),
	 .BusMuxInMDR(BusMuxInMDR),
	 .BusMuxInPort(BusMuxInPort),
	 .BusMuxInIR(BusMuxInIR),
	 .address(address),
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
	 .BusMuxOut(BusMuxOut)
);	
	
endmodule
