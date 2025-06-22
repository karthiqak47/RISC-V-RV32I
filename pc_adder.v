module pc_adder(
    input [31:0] from_pc,
    input [31:0] to_pc
    );
    
    assign to_pc  = from_pc + 4 ;
endmodule
