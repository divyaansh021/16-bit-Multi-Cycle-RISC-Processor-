
module alu(
    input [15:0] A,
    input [15:0] B,
    input [3:0] alu_op,
    output reg [15:0] result
);

always @(*) begin
    case(alu_op)
        4'b0000: result = A + B;   
        4'b0001: result = A - B;   
        4'b0010: result = A & B;   
        4'b0011: result = A | B;   
        4'b0100: result = A ^ B;  
        4'b0101: result = ~A;      
        default: result = 16'd0;
    endcase
end

endmodule
