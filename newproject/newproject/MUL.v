//module MUL(
//    input [31:0] A, // multiplicand
//    input [31:0] B, // multiplier
//    output reg [63:0] Booth_Mul_Result
//);
//    // Extended sizes for handling shifts and sign extension
//    reg [63:0] M; // Extended multiplicand for addition
//    reg [63:0] negM; // Two's complement of M for subtraction
//    reg [64:0] product; // Product register with extra bit for sign extension
//    integer i;
//
//    // Procedure to perform multiplication using Booth's algorithm
//    always @(A, B) begin
//        M = {A, 32'b0}; // Place A in the upper half for easy addition
//        negM = ~M + 1; // Two's complement for subtraction
//        product = {1'b0, B, 32'b0}; // Initialize product with B and 32 LSBs as 0
//        
//        for (i = 0; i < 32; i=i+1) begin
//            case (product[1:0]) // Evaluate LSB and appended bit
//                2'b01: product = product + M; // Add M if 01
//                2'b10: product = product + negM; // Subtract M (add negM) if 10
//                default: ; // Do nothing for 00 and 11
//            endcase
//            product = product >> 1; // Arithmetic right shift for next iteration
//        end
//        Booth_Mul_Result = product[64:1]; // Discard extra bit used for sign extension
//    end
//endmodule


module MUL(
	input signed [31:0] A, B,
	output [63:0] mulresult
);
	reg[2:0] cc[(32/2)-1: 0]; //carry collection
	reg[31:0] pp[(32/2)-1: 0]; //partial product
	reg [63:0] spp[(32/2)-1: 0]; //signed partial product
	reg [63: 0] product; //final
	
	wire[32:0] inv_a;
	assign inv_a = {~A[31], ~A} + 1; //2's compiment of A to be used for booth's algo
	
	integer j,i;
	
	always @ (A or B or inv_a) begin
		cc[0] = {B[1], B[0], 1'b0}; //concat two first bits, last bit is carry
		
			for (j=1;j<(32/2);j=j+1)
			begin
				cc[j] = {B[2*j+1], B[2*j], B[2*j-1]};
			end
			
			//Calculate the partial product for each of the bits depending on the bit-pair encoding found above
			for (j=0; j<(32/2); j=j+1) 
			begin
				case(cc[j])
				
				//+1M
				3'b001, 3'b010 : pp[j] = {A[32-1], A};
				//+2M
				3'b011 : pp[j] = {A, 1'b0};
				//-2M
				3'b100 : pp[j] = {inv_a[32-1:0], 1'b0};
				//-1M
				3'b101, 3'b110 : pp[j] = {inv_a[32-1], inv_a};
				//0
				default : pp[j] = 0;
				endcase
				//Convert them to signed partial products
				spp[j] = $signed(pp[j]) << (j*2);
			end
			product = spp[0];
			
			//sum up the products to obtain the final result
			for (j=1; j<(32/2); j = j+1)
			begin
				product = product +spp[j];
			end
		end
		assign mulresult = product;
endmodule

			