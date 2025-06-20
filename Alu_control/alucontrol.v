module alu_control(
    input [1:0] ALUOp,         // From main control unit
    input [2:0] funct3,        // From instruction[14:12]
    input [6:0] funct7,        // From instruction[31:25]
    output reg [3:0] alu_op    // Goes to your rv32_alu opcode input
);

always @(*) begin
    case (ALUOp)
        2'b00: begin
            // For lw, sw → ADD
            alu_op = 4'b0000;
        end

        2'b01: begin
            // For branch (beq, etc.) → SUB
            alu_op = 4'b0001;
        end

        2'b10: begin
            // R-type or I-type instructions (uses funct3 and funct7)
            case (funct3)
                3'b000: alu_op = (funct7 == 7'b0100000) ? 4'b0001 : 4'b0000; // SUB : ADD
                3'b111: alu_op = 4'b0010; // AND
                3'b110: alu_op = 4'b0011; // OR
                3'b100: alu_op = 4'b0100; // XOR
                3'b010: alu_op = 4'b0101; // SLT
                3'b011: alu_op = 4'b0110; // SLTU
                3'b001: alu_op = 4'b0111; // SLL
                3'b101: alu_op = (funct7 == 7'b0100000) ? 4'b1000 : 4'b1001; // SRA : SRL
                default: alu_op = 4'b1111; // Invalid
            endcase
        end

        default: alu_op = 4'b1111; // Invalid
    endcase
end

endmodule
