module rv32_integerfile(
    input clk,
    input rst,
    input [4:0] rs1_address,
    input [4:0] rs2_address,
    input [4:0] rd_address,
    input [31:0] rd_data,
    input wr_en,
    input [31:0] rs1_out,
    input rs2_out
    );
    
    reg [31:0] reg_file [31:0] ; //matrix
    wire frw1, frw2 ;
    integer i;
    
    assign frw1 = (rs1_address == rd_address && wr_en==1'b1)? 1'b1 : 1'b0 ;
    assign frw2 = (rs2_address == rd_address && wr_en==1'b1)? 1'b1 : 1'b0 ;
    
    always@(posedge clk or posedge rst)
    begin
        if (rst)
        begin
            for (i=0;i<32;i=i+1)
                reg_file[i] <= 1'b0 ;
        end
        
        else if (wr_en && rd_address)
        begin 
            reg_file[rd_address] <= rd_data ;
        end 
     end
     
     assign rs1_out = (frw1 == 1'b1) ? rd_data : reg_file[rs1_address] ;
     assign rs2_out = (frw2 == 1'b1 )? rd_data : reg_file[rs2_address] ;
     
endmodule
