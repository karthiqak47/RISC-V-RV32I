module pc_counter(
    input clk_pc,
    input rst_pc,
    output [31:0] pc_in,
    output reg [31:0] pc_out
    );
    
    always @(posedge clk_pc or posedge rst_pc)
    begin
        if (rst_pc)
            pc_out <= 32'b0 ;
        else 
            pc_out <= pc_in ;
    end  
endmodule
