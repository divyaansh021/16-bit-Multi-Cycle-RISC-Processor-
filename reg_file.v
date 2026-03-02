
module reg_file(
    input clk,
    input reset,
    input we,
    input [1:0] rs1,
    input [1:0] rs2,
    input [1:0] rd,
    input [15:0] wd,
    output [15:0] rd1,
    output [15:0] rd2
);

reg [15:0] regs [0:3];
integer i;

assign rd1 = regs[rs1];
assign rd2 = regs[rs2];

always @(posedge clk or posedge reset) begin
    if(reset) begin
        for(i = 0; i < 4; i = i + 1)
            regs[i] <= 16'd0;
    end
    else if(we)
        regs[rd] <= wd;
end

endmodule