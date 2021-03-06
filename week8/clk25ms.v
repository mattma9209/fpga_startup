module clk25ms(
               input      clk50m,
               output reg clk100ms = 1'b0
               );

   reg [22:0]              cnt = 21'd0;
   always @(posedge clk50m)
     begin
        if(cnt25 >= 22'd2499999)begin
           cnt25 <= 22'd0;
           clk25ms <= ~clk25ms;
        end else begin
           cnt25 <= cnt25 + 22'd1;
        end
     end
endmodule
