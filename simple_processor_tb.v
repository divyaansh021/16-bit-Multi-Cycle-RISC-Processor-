`timescale 1ns/1ps

module simple_processor_tb;

reg clk;
reg reset;

simple_processor uut (
    .clk(clk),
    .reset(reset)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;
    #20;
    reset = 0;
end


initial begin
    uut.DM.memory[5]  = 16'd10;
    uut.DM.memory[6]  = 16'd4;
end


initial begin

    
    uut.IM.memory[0] = 16'b0110_00_00_00000101;

    
    uut.IM.memory[1] = 16'b0110_01_00_00000110;

    
    uut.IM.memory[2] = 16'b0000_10_00_00000000;

    
    uut.IM.memory[3] = 16'b0000_10_01_00000000;

    
    uut.IM.memory[4] = 16'b0001_11_01_00000000;

   
    uut.IM.memory[5] = 16'b0010_00_01_00000000;

    
    uut.IM.memory[6] = 16'b0011_00_01_00000000;

 
    uut.IM.memory[7] = 16'b0100_00_01_00000000;

  
    uut.IM.memory[8] = 16'b0101_01_00_00000000;

  
    uut.IM.memory[9] = 16'b1000_11_10_00000000;

  
    uut.IM.memory[10] = 16'b0111_10_00_00010100;

end


initial begin
    $display("Time\tR0\tR1\tR2\tR3\tMEM[20]");
    $monitor("%0t\t%h\t%h\t%h\t%h\t%h",
        $time,
        uut.RF.regs[0],
        uut.RF.regs[1],
        uut.RF.regs[2],
        uut.RF.regs[3],
        uut.DM.memory[20]
    );
end


initial begin
    #1200;

    $display("\nFINAL VALUES:");
    $display("R0 = %h", uut.RF.regs[0]);
    $display("R1 = %h", uut.RF.regs[1]);
    $display("R2 = %h", uut.RF.regs[2]);
    $display("R3 = %h", uut.RF.regs[3]);
    $display("MEM[20] = %h", uut.DM.memory[20]);

    $stop;
end

endmodule