module con_ff(
	input wire[31:0] BusMuxIn, //needs to be connected to RA
	input wire[1:0] c2, 
	input wire enable,
	output reg CON
	);

	always @(*) begin
    // Default condition if none of the cases match
    CON= 1'b0;
	 

    case (c2)
        2'b00: CON = (BusMuxIn == 32'b0);
        2'b01: CON = (BusMuxIn != 32'b0);
        2'b10: CON = (BusMuxIn[31] == 0) && (BusMuxIn != 32'b0);
        2'b11: CON= (BusMuxIn[31] == 1);
        default: CON = 1'b0; // Optional default case
    endcase
end
endmodule 
