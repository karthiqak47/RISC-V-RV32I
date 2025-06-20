module instruction_memory(
    input clk,
    input rst,
    input [31:0] read_address,
    output reg [31:0] instr_out
);
    reg [31:0] mem [0:63]; // 64 instructions
    integer i;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            for(i = 0; i < 64; i = i + 1)
                mem[i] <= 32'b0;
        end else begin
            instr_out <= mem[read_address[31:2]];
        end
    end
endmodule
