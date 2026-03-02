
module data_mem(
    input clk,
    input mem_write,
    input [15:0] addr,
    input [15:0] write_data,
    output [15:0] read_data
);

reg [15:0] memory [0:255];

assign read_data = memory[addr[7:0]];

always @(posedge clk)
    if(mem_write)
        memory[addr[7:0]] <= write_data;

endmodule
