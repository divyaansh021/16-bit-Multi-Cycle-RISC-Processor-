
module instr_mem(
    input [15:0] addr,
    output [15:0] instr
);

reg [15:0] memory [0:255];

assign instr = memory[addr];

endmodule
