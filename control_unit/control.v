module Control_Unit(
    input [6:0] instruction,
    output reg Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite,
    output reg [1:0] ALUOp
);

always @(*) begin
    case(instruction)

        // R-type
        7'b0110011: {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} <= 8'b00100001;

        // Load (I-type)
        7'b0000011: {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} <= 8'b11110000;

        // Store (S-type)
        7'b0100011: {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} <= 8'b10001000;

        // Branch (B-type)
        7'b1100011: {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} <= 8'b00000101;

        // Default (Nop)
        default:    {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} <= 8'b00000000;

    endcase
end

endmodule
