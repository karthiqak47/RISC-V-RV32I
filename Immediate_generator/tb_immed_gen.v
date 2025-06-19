`timescale 1ns / 1ps

module Imed_generator_tb;

    // Testbench signals
    reg [6:0] opcode;
    reg [31:0] instruction;
    wire [31:0] imed;

    // Instantiate the module under test
    Imed_generator uut (
        .opcode(opcode),
        .instruction(instruction),
        .imed(imed)
    );

    initial begin
        $display("Time\tOpcode\t\tInstruction\t\tImmediate");
        $monitor("%0t\t%b\t%h\t%h", $time, opcode, instruction, imed);

        // Test I-type (e.g., lw)
        opcode = 7'b0000011;           // lw opcode
        instruction = 32'b111111111111_00000_000_00000_0000011;  // imm[11:0] = -1
        #10;

        // Test S-type (e.g., sw)
        opcode = 7'b0100011;           // sw opcode
        instruction = 32'b1111111_00000_00000_000_00000_0100011; // imm = -1 (imm[11:5] = 1111111, imm[4:0] = 00000)
        #10;

        // Test B-type (e.g., beq)
        opcode = 7'b1100011;           // beq opcode
        instruction = 32'b1_111111_00000_00000_000_1111_1_1100011; // Example branch offset with negative imm
        #10;

        // Test another I-type with positive immediate
        opcode = 7'b0000011;
        instruction = 32'b000000000001_00000_000_00000_0000011;  // imm[11:0] = 1
        #10;

        $finish;
    end

endmodule
