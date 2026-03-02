module simple_processor(
    input clk,
    input reset
);

wire [15:0] pc_out, next_pc, instruction;
reg  [15:0] IR;  

wire [3:0] opcode;
wire [1:0] rd, rs;
wire [7:0] imm;

wire [15:0] imm_ext;
wire [15:0] rd1, rd2;
wire [15:0] alu_result;
wire [15:0] mem_data;

wire pc_write, reg_write, mem_write, mem_to_reg;
wire [3:0] alu_op;

assign next_pc = pc_out + 1;


pc PC(clk, reset, pc_write, next_pc, pc_out);


instr_mem IM(pc_out, instruction);


always @(posedge clk or posedge reset) begin
    if(reset)
        IR <= 16'd0;
    else if(pc_write)
        IR <= instruction;
end


assign opcode = IR[15:12];
assign rd     = IR[11:10];
assign rs     = IR[9:8];
assign imm    = IR[7:0];

assign imm_ext = {8'd0, imm};


reg_file RF(
    clk,
    reset,
    reg_write,
    rd,
    rs,
    rd,
    mem_to_reg ? mem_data : alu_result,
    rd1,
    rd2
);


alu ALU(rd1, rd2, alu_op, alu_result);


data_mem DM(
    clk,
    mem_write,
    imm_ext,
    rd1,
    mem_data
);


control_unit CU(
    clk, reset,
    opcode,
    pc_write,
    reg_write,
    mem_write,
    mem_to_reg,
    alu_op
);

endmodule