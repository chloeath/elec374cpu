module DIV(
input wire [31:0] dividend, divisor,

output reg [63:0] Divresult
      
);
      
integer i;
reg [31:0] m, a, q, temp;
      always @(dividend or divisor)
            begin
            a= 32'd0;
            q= dividend;
            m= divisor;
            for(i=0;i<32;i=i+1)
                  begin
                  a={a[30:0],q[31]};
                  temp = a-m;
                  if (temp[31]==1)begin
                        q={q[30:0],1'b0};
                  end
                  else begin
                        q={q[30:0],1'b1};
                        a=temp;
                  end
                  end
                        
                  Divresult = {a, q};

                        
                  end
endmodule