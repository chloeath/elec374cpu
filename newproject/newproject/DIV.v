module DIV(

input [31:0] A, B, 
output reg [63:0] Divresult

);

    reg [31:0] Q, Rem, Div;
    reg [31:0] temp_Rem;		//define file specific varibles
    integer y;

    always @(*) begin
        Q = 0;
        Rem = 0;
        Div = B;
        temp_Rem = A; //initilize all veriables starting with A


        for (y = 31; y >= 0; y = y - 1) begin
				//loop through all bits from input register
				
            //start the non-restorative formula shifting remainder left by one bit 
            Rem = Rem << 1;
				
            Rem[0] = temp_Rem[31]; //prepaire the next bit to be to used from divisor
				
            temp_Rem = temp_Rem << 1; //set temp remainder after shift, non restorative so no need to reset
				
            
				//loop condition to determine if remainder will be positive or negative to determine if 0 or 1 will be added to Q
            if (Rem >= Div) begin
					 //calculate new remainder after subtracting the div
                Rem = Rem - Div;
                Q = (Q << 1) | 1; // Set the last bit to 1 
            end else begin
                Q = Q << 1; // Set the last bit to 0
            end
        end

        // Adding together quotent with remainder for final 
       Divresult[31:0] = Q;
       Divresult[63:32] = Rem; 
    end
endmodule
