module rv32_alu(
    input [31:0] op_1_in,
    input [31:0] op_2_in,
    input [3:0] opcode,
    output reg [31:0] result_out
    );
    
//ALU OPERATIONS

parameter fun3add = 3'b000;
parameter fun3slt = 3'b010;
parameter fun3sltu = 3'b011;
parameter fun3and = 3'b111;
parameter fun3or = 3'b110;
parameter fun3xor = 3'b100;
parameter fun3sll = 3'b001;
parameter fun3srl = 3'b101;

//ALU operation based on opcode input
wire signed [31:0] signed_op1 ;
wire signed [31:0] adder_op2 ;
wire [31:0] minus_op2 ;
wire [31:0] sra_result ;
wire [31:0] srl_result ;
wire [31:0] shr_result ;
wire slt_result ;
wire sltu_result ;

reg [31:0] pre_result ;

// Signed version of operand 1
assign signed_op1 = op_1_in;
// Two's complement of operand 2 (for subtraction)
assign minus_op2 = -op_2_in;
// Operand 2 for adder: choose between op_2_in and -op_2_in based on opcode[3]
assign adder_op2 = (opcode[3] == 1'b1) ? minus_op2 : op_2_in;
// Shift right arithmetic (>>> signed shift)
assign sra_result = signed_op1 >>> op_2_in[4:0];
// Shift right logical (>> unsigned shift)
assign srl_result = op_1_in >> op_2_in[4:0];
// Final shift result based on opcode[3]: choose between SRA and SRL
assign shr_result = (opcode[3] == 1'b1) ? sra_result : srl_result;
// Unsigned set-less-than
assign sltu_result = (op_1_in < op_2_in);
// Signed set-less-than: handle signed comparison using MSBs
assign slt_result = (op_1_in[31] ^ op_2_in[31]) ? op_1_in[31] : sltu_result;



always @* begin
    case (opcode[2:0])
        fun3add  : result_out = op_1_in + adder_op2;
        fun3srl  : result_out = shr_result;
        fun3or   : result_out = op_1_in | op_2_in;
        fun3and  : result_out = op_1_in & op_2_in;
        fun3xor  : result_out = op_1_in ^ op_2_in;
        fun3slt  : result_out = {31'b0, slt_result};
        fun3sltu : result_out = {31'b0, sltu_result};
        fun3sll  : result_out = op_1_in << op_2_in[4:0];
        default     : result_out = 32'b0;
    endcase
end
