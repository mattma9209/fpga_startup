module timeset(
               input [11:0]     key,
               output reg       flag,
               output reg [3:0] pos,
               output reg [3:0] digit
               );
   initial
     begin
        flag <= 0;
        pos <= 0;
        digit <= 4'b1111;
     end
   always @(key)
     begin
        case(key)
          12'h000:begin flag <= 1;end
          12'h001:begin digit <= 4'd7;flag <= 0;end
          12'h002:begin digit <= 4'd4;flag <= 0;end
          12'h004:begin digit <= 4'd1;flag <= 0;end
          12'h008:begin pos <= 0;end
          12'h010:begin digit <= 4'd8;flag <= 0;end
          12'h020:begin digit <= 4'd5;flag <= 0;end
          12'h040:begin digit <= 4'd2;flag <= 0;end
          12'h080:begin digit <= 4'd0;flag <= 0;end
          12'h100:begin digit <= 4'd9;flag <= 0;end
          12'h200:begin digit <= 4'd6;flag <= 0;end
          12'h400:begin digit <= 4'd3;flag <= 0;end
          12'h800:
            begin
               case(pos)
                 4'b0000:begin pos <= 4'b0001;end
                 4'b0001:begin pos <= 4'b0010;end
                 4'b0010:begin pos <= 4'b0100;end
                 4'b0010:begin pos <= 4'b1000;end
                 4'b1000:begin pos <= 4'b0001;end
               endcase // case (pos)
            end
          default: digit <= 4'b1111;
        endcase // case (key)
     end // always @ (key)
endmodule // timeset
