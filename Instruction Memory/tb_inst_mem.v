module tb_instruction_memory;
    reg clk;
    reg rst;
    reg [31:0] read_address;
    wire [31:0] instr_out;

    instruction_memory uut (
        .clk(clk),
        .rst(rst),
        .read_address(read_address),
        .instr_out(instr_out)
    );

    integer i;

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 1;
        read_address = 0;
        #10;

        rst = 0;

        // Manually preload instructions (only possible because mem is internal)
        uut.mem[0] = 32'h00000013; // NOP (addi x0, x0, 0)
        uut.mem[1] = 32'h00100093; // addi x1, x0, 1
        uut.mem[2] = 32'h00200113; // addi x2, x0, 2
        uut.mem[3] = 32'h00308193; // addi x3, x1, 3

        #10 read_address = 0;
        #10 read_address = 1;
        #10 read_address = 2;
        #10 read_address = 3;
        #10 $stop;
    end
endmodule
