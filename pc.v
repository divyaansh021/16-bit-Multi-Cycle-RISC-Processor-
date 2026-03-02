
module pc(
    input clk, reset,
    input pc_write,
    input [15:0] next_pc,
    output reg [15:0] pc_out
);

always @(posedge clk or posedge reset)
    if(reset)
        pc_out <= 16'd0;
    else if(pc_write)
        pc_out <= next_pc;

endmodule