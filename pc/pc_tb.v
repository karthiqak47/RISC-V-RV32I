module tb_pc_counter;
    reg clk_pc;
    reg rst_pc;
    wire [31:0] pc_in;
    wire [31:0] pc_out;

    reg [31:0] pc_val;
    assign pc_in = pc_val;

    pc_counter uut (
        .clk_pc(clk_pc),
        .rst_pc(rst_pc),
        .pc_in(pc_in),
        .pc_out(pc_out)
    );

    initial begin
        clk_pc = 0;
        forever #5 clk_pc = ~clk_pc;
    end

    initial begin
        rst_pc = 1;
        pc_val = 32'd0;
        #10;
        rst_pc = 0;
        pc_val = 32'd4;
        #10;
        pc_val = 32'd8;
        #10;
        pc_val = 32'd12;
        #10;
        rst_pc = 1;
        #10;
        rst_pc = 0;
        pc_val = 32'd16;
        #10;
        $stop;
    end
endmodule
