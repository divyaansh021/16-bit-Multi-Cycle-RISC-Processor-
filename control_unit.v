
module control_unit(
    input clk, reset,
    input [3:0] opcode,
    output reg pc_write,
    output reg reg_write,
    output reg mem_write,
    output reg mem_to_reg,
    output reg [3:0] alu_op
);

reg [2:0] state, next_state;

localparam FETCH     = 3'd0,
           DECODE    = 3'd1,
           EXECUTE   = 3'd2,
           MEMORY    = 3'd3,
           WRITEBACK = 3'd4;

always @(posedge clk or posedge reset)
    if(reset)
        state <= FETCH;
    else
        state <= next_state;

always @(*) begin

    pc_write = 0;
    reg_write = 0;
    mem_write = 0;
    mem_to_reg = 0;

   
    if (opcode <= 4'b0101)
        alu_op = opcode;
    else
        alu_op = 4'b0000;

    case(state)

        FETCH: begin
            pc_write = 1;
            next_state = DECODE;
        end

        DECODE: begin
            next_state = EXECUTE;
        end

        EXECUTE: begin
            if(opcode == 4'b0110 || opcode == 4'b0111)
                next_state = MEMORY;
            else
                next_state = WRITEBACK;
        end

        MEMORY: begin
            if(opcode == 4'b0111)  
                mem_write = 1;
            next_state = WRITEBACK;
        end

        WRITEBACK: begin
            if(opcode == 4'b0110) begin  
                reg_write = 1;
                mem_to_reg = 1;
            end
            else if(opcode != 4'b0111) begin
                reg_write = 1;
            end
            next_state = FETCH;
        end

    endcase
end

endmodule
