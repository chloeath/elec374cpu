module MUL(X, Y, Zin);
 
    input signed [31:0] X, Y;
    output reg [63:0] Zin;
   
    reg signed [63:0] Z; // Temporary register for calculations
    reg [1:0] temp;
    integer i;
    reg E1; // Extra bit for Booth's algorithm
   
    always @(*) begin
        Z = 64'd0;
        Z[31:0] = X;
        E1 = 0;
       
        for (i = 0; i < 32; i = i + 1) begin
            temp = {Z[0], E1}; // Consider LSB of Z and extra bit
           
            case (temp)
                2'b01: Z[63:32] = Z[63:32] + Y; // Add Y for 01
                2'b10: Z[63:32] = Z[63:32] - Y; // Subtract Y for 10
                default: ;
            endcase
           
            E1 = Z[0]; // Update E1 with the LSB of Z before shift
            Z = Z >>> 1; // Arithmetic right shift
        end
       
        Zin = Z;
    end
endmodule	