module tb_rv32_alu;

reg [31:0] op_1_in;
reg [31:0] op_2_in;
reg [3:0] opcode;
wire [31:0] result_out;

rv32_alu dut (
    .op_1_in(op_1_in),
    .op_2_in(op_2_in),
    .opcode(opcode),
    .result_out(result_out)
);

initial begin
    op_1_in = 32'd15; op_2_in = 32'd10; opcode = 4'b0000; #10;  // ADD
    op_1_in = 32'd15; op_2_in = 32'd10; opcode = 4'b1000; #10;  // SUB
    op_1_in = 32'd8;  op_2_in = 32'd2;  opcode = 4'b0101; #10;  // SRL
    op_1_in = -32'd8; op_2_in = 32'd2;  opcode = 4'b1101; #10;  // SRA
    op_1_in = 32'd5;  op_2_in = 32'd10; opcode = 4'b0010; #10;  // SLT
    op_1_in = 32'd5;  op_2_in = 32'd10; opcode = 4'b0011; #10;  // SLTU
    op_1_in = 32'd6;  op_2_in = 32'd3;  opcode = 4'b0001; #10;  // SLL
    op_1_in = 32'hF0F0F0F0; op_2_in = 32'h0F0F0F0F; opcode = 4'b0110; #10;  // OR
    op_1_in = 32'hF0F0F0F0; op_2_in = 32'h0F0F0F0F; opcode = 4'b0100; #10;  // XOR
    op_1_in = 32'hF0F0F0F0; op_2_in = 32'h0F0F0F0F; opcode = 4'b0111; #10;  // AND

    $finish;
end

endmodule
