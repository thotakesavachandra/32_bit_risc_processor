module control_path(
    input wire control_clk,
    input wire [5:0]opcode,
    input wire eqz,
    input wire gz,
    input wire lz,
    output reg reg_dst_sel,
    output reg [1:0]alu_sel1,
    output reg alu_sel2,
    output reg [3:0] alu_op,
    output reg [1:0]pc_sel,
    output reg sp_update_sel,
    output reg sp_load_sel,
    output reg sp_write_sel,
    output reg mem_addr_sel,
    output reg mem_data_sel,
    output reg mem_write_signal,
    output reg reg_write_signal,
    output reg sp_write_signal,
    output reg reg_write_sel
);
    always @ (posedge control_clk)
    begin 
        // $display("opcode : %d",opcode);
        case(opcode)
            0 : begin
                alu_sel1 = 0;
                alu_sel2 = 0;
                alu_op = 0;
                pc_sel = 0;
                mem_write_signal = 0;
                reg_write_signal = 1;
                reg_dst_sel = 0;
                reg_write_sel = 0;
                mem_addr_sel = 0;
                mem_data_sel = 1;
                sp_load_sel = 0;
                sp_update_sel = 0;
                sp_write_signal = 0;
                sp_write_sel = 0;
            end
            1 : begin
                alu_sel1 = 0;
                alu_sel2 = 0;
                alu_op = 2;
                pc_sel = 0;
                mem_write_signal = 0;
                reg_write_signal = 1;
                reg_dst_sel = 0;
                reg_write_sel = 0;
                mem_addr_sel = 0;
                mem_data_sel = 1;
                sp_load_sel = 0;
                sp_update_sel = 0;
                sp_write_signal = 0;
                sp_write_sel = 0;
            end
            2: begin
                alu_sel1 = 0;
                alu_sel2 = 0;
                alu_op = 5;
                pc_sel = 0;
                mem_write_signal = 0;
                reg_write_signal = 1;
                reg_dst_sel = 0;
                reg_write_sel = 0;
                mem_addr_sel = 0;
                mem_data_sel = 1;
                sp_load_sel = 0;
                sp_update_sel = 0;
                sp_write_signal = 0;
                sp_write_sel = 0;
            end
            3: begin
                alu_sel1 = 0;
                alu_sel2 = 0;
                alu_op = 4;
                pc_sel = 0;
                mem_write_signal = 0;
                reg_write_signal = 1;
                reg_dst_sel = 0;
                reg_write_sel = 0;
                mem_addr_sel = 0;
                mem_data_sel = 1;
                sp_load_sel = 0;
                sp_update_sel = 0;
                sp_write_signal = 0;
                sp_write_sel = 0;
            end
            4: begin
                alu_sel1 = 0;
                alu_sel2 = 0;
                alu_op = 1;
                pc_sel = 0;
                mem_write_signal = 0;
                reg_write_signal = 1;
                reg_dst_sel = 0;
                reg_write_sel = 0;
                mem_addr_sel = 0;
                mem_data_sel = 1;
                sp_load_sel = 0;
                sp_update_sel = 0;
                sp_write_signal = 0;
                sp_write_sel = 0;
            end
            6'b000101: begin
                alu_sel1 = 0;
                alu_sel2 = 0;
                alu_op = 4'b0110;
                pc_sel = 0;
                mem_write_signal = 0;
                reg_write_signal = 1;
                reg_dst_sel = 0;
                reg_write_sel = 0;
                mem_addr_sel = 0;
                mem_data_sel = 1;
                sp_load_sel = 0;
                sp_update_sel = 0;
                sp_write_signal = 0;
                sp_write_sel = 0;
            end
            6'b000110: begin
                alu_sel1 = 0;
                alu_sel2 = 0;
                alu_op = 4'b0111;
                pc_sel = 0;
                mem_write_signal = 0;
                reg_write_signal = 1;
                reg_dst_sel = 0;
                reg_write_sel = 0;
                mem_addr_sel = 0;
                mem_data_sel = 1;
                sp_load_sel = 0;
                sp_update_sel = 0;
                sp_write_signal = 0;
                sp_write_sel = 0;
            end
            'b000111: begin
                alu_sel1 = 0;
                alu_sel2 = 0;
                alu_op = 'b1000;
                pc_sel = 0;
                mem_write_signal = 0;
                reg_write_signal = 1;
                reg_dst_sel = 0;
                reg_write_sel = 0;
                mem_addr_sel = 0;
                mem_data_sel = 1;
                sp_load_sel = 0;
                sp_update_sel = 0;
                sp_write_signal = 0;
                sp_write_sel = 0;
            end
            'b001000: begin
                alu_sel1 = 0;
                alu_sel2 = 0;
                alu_op = 'b0011;
                pc_sel = 0;
                mem_write_signal = 0;
                reg_write_signal = 1;
                reg_dst_sel = 0;
                reg_write_sel = 0;
                mem_addr_sel = 0;
                mem_data_sel = 1;
                sp_load_sel = 0;
                sp_update_sel = 0;
                sp_write_signal = 0;
                sp_write_sel = 0;
            end
            'b001001: begin
                alu_sel1 = 0;
                alu_sel2 = 0;
                alu_op = 'b0000;
                pc_sel = 0;
                mem_write_signal = 1;
                reg_write_signal = 0;
                reg_dst_sel = 0;
                reg_write_sel = 0;
                mem_addr_sel = 1;
                mem_data_sel = 1;
                sp_load_sel = 0;
                sp_update_sel = 0;
                sp_write_signal = 1;
                sp_write_sel = 0;
            end
            'b001010: begin
                alu_sel1 = 0;
                alu_sel2 = 0;
                alu_op = 'b0000;
                pc_sel = 0;
                mem_write_signal = 0;
                reg_write_signal = 1;
                reg_dst_sel = 0;
                reg_write_sel = 0;
                mem_addr_sel = 0;
                mem_data_sel = 1;
                sp_load_sel = 0;
                sp_update_sel = 0;
                sp_write_signal = 0;
                sp_write_sel = 0;
            end
            'b001011: begin
                alu_sel1 = 0;
                alu_sel2 = 0;
                alu_op = 'b0000;
                pc_sel = 0;
                mem_write_signal = 0;
                reg_write_signal = 1;
                reg_dst_sel = 1;
                reg_write_sel = 1;
                mem_addr_sel = 1;
                mem_data_sel = 1;
                sp_load_sel = 1;
                sp_update_sel = 1;
                sp_write_signal = 1;
                sp_write_sel = 0;
            end
            'b100000: begin
                alu_sel1 = 0;
                alu_sel2 = 1;
                alu_op = 'b0000;
                pc_sel = 0;
                mem_write_signal = 0;
                reg_write_signal = 1;
                reg_dst_sel = 1;
                reg_write_sel = 0;
                mem_addr_sel = 0;
                mem_data_sel = 1;
                sp_load_sel = 0;
                sp_update_sel = 0;
                sp_write_signal = 0;
                sp_write_sel = 0;
            end
            'b100001: begin
                alu_sel1 = 0;
                alu_sel2 = 1;
                alu_op = 'b0010;
                pc_sel = 0;
                mem_write_signal = 0;
                reg_write_signal = 1;
                reg_dst_sel = 1;
                reg_write_sel = 0;
                mem_addr_sel = 0;
                mem_data_sel = 1;
                sp_load_sel = 0;
                sp_update_sel = 0;
                sp_write_signal = 0;
                sp_write_sel = 0;
            end
            'b100010: begin
                alu_sel1 = 0;
                alu_sel2 = 1;
                alu_op = 'b0101;
                pc_sel = 0;
                mem_write_signal = 0;
                reg_write_signal = 1;
                reg_dst_sel = 1;
                reg_write_sel = 0;
                mem_addr_sel = 0;
                mem_data_sel = 1;
                sp_load_sel = 0;
                sp_update_sel = 0;
                sp_write_signal = 0;
                sp_write_sel = 0;
            end
            'b100011: begin
                alu_sel1 = 0;
                alu_sel2 = 1;
                alu_op = 'b0100;
                pc_sel = 0;
                mem_write_signal = 0;
                reg_write_signal = 1;
                reg_dst_sel = 1;
                reg_write_sel = 0;
                mem_addr_sel = 0;
                mem_data_sel = 1;
                sp_load_sel = 0;
                sp_update_sel = 0;
                sp_write_signal = 0;
                sp_write_sel = 0;
            end
            'b100100: begin
                alu_sel1 = 0;
                alu_sel2 = 1;
                alu_op = 'b0001;
                pc_sel = 0;
                mem_write_signal = 0;
                reg_write_signal = 1;
                reg_dst_sel = 1;
                reg_write_sel = 0;
                mem_addr_sel = 0;
                mem_data_sel = 1;
                sp_load_sel = 0;
                sp_update_sel = 0;
                sp_write_signal = 0;
                sp_write_sel = 0;
            end
            'b100101: begin
                alu_sel1 = 0;
                alu_sel2 = 1;
                alu_op = 'b0110;
                pc_sel = 0;
                mem_write_signal = 0;
                reg_write_signal = 1;
                reg_dst_sel = 1;
                reg_write_sel = 0;
                mem_addr_sel = 0;
                mem_data_sel = 1;
                sp_load_sel = 0;
                sp_update_sel = 0;
                sp_write_signal = 0;
                sp_write_sel = 0;
            end
            'b100110: begin
                alu_sel1 = 0;
                alu_sel2 = 1;
                alu_op = 'b0111;
                pc_sel = 0;
                mem_write_signal = 0;
                reg_write_signal = 1;
                reg_dst_sel = 1;
                reg_write_sel = 0;
                mem_addr_sel = 0;
                mem_data_sel = 1;
                sp_load_sel = 0;
                sp_update_sel = 0;
                sp_write_signal = 0;
                sp_write_sel = 0;
            end
            'b100111: begin
                alu_sel1 = 0;
                alu_sel2 = 1;
                alu_op = 'b1000;
                pc_sel = 0;
                mem_write_signal = 0;
                reg_write_signal = 1;
                reg_dst_sel = 1;
                reg_write_sel = 0;
                mem_addr_sel = 0;
                mem_data_sel = 1;
                sp_load_sel = 0;
                sp_update_sel = 0;
                sp_write_signal = 0;
                sp_write_sel = 0;
            end
            'b101000: begin
                alu_sel1 = 0;
                alu_sel2 = 1;
                alu_op = 'b0000;
                pc_sel = 0;
                mem_write_signal = 0;
                reg_write_signal = 1;
                reg_dst_sel = 1;
                reg_write_sel = 1;
                mem_addr_sel = 0;
                mem_data_sel = 1;
                sp_load_sel = 0;
                sp_update_sel = 0;
                sp_write_signal = 0;
                sp_write_sel = 0;
            end
            'b101001: begin   ///////////////////////////// LDSP
                alu_sel1 = 0;
                alu_sel2 = 1;
                alu_op = 'b0000;
                pc_sel = 0;
                mem_write_signal = 0;
                reg_write_signal = 0;
                reg_dst_sel = 0;
                reg_write_sel = 0;
                mem_addr_sel = 0;
                mem_data_sel = 1;
                sp_load_sel = 0;
                sp_update_sel = 0;
                sp_write_signal = 1;
                sp_write_sel = 1;
            end
            'b101010: begin
                alu_sel1 = 0;
                alu_sel2 = 1;
                alu_op = 'b0000;
                pc_sel = 0;
                mem_write_signal = 1;
                reg_write_signal = 0;
                reg_dst_sel = 0;
                reg_write_sel = 0;
                mem_addr_sel = 0;
                mem_data_sel = 1;
                sp_load_sel = 0;
                sp_update_sel = 0;
                sp_write_signal = 0;
                sp_write_sel = 0;
            end
            'b101011: begin  ///////////////////////////// STSP
                alu_sel1 = 0;
                alu_sel2 = 1;
                alu_op = 'b0000;
                pc_sel = 0;
                mem_write_signal = 1;
                reg_write_signal = 0;
                reg_dst_sel = 0;
                reg_write_sel = 0;
                mem_addr_sel = 0;
                mem_data_sel = 1;
                sp_load_sel = 0;
                sp_update_sel = 0;
                sp_write_signal = 0;
                sp_write_sel = 0;
            end
            'b101100: begin
                alu_sel1 = 0;    /////////////////////  ALU SELECT 1 CHANGED FOR BRANCH
                alu_sel2 = 1;
                alu_op = 'b0000;
                pc_sel = 1;
                mem_write_signal = 0;
                reg_write_signal = 0;
                reg_dst_sel = 0;
                reg_write_sel = 0;
                mem_addr_sel = 0;
                mem_data_sel = 1;
                sp_load_sel = 0;
                sp_update_sel = 0;
                sp_write_signal = 0;
                sp_write_sel = 0;
            end
            'b101101: begin
                alu_sel1 = 0;
                alu_sel2 = 1;
                alu_op = 'b0000;
                if(lz==1) pc_sel = 1;
                else pc_sel = 0;
                mem_write_signal = 0;
                reg_write_signal = 0;
                reg_dst_sel = 0;
                reg_write_sel = 0;
                mem_addr_sel = 0;
                mem_data_sel = 1;
                sp_load_sel = 0;
                sp_update_sel = 0;
                sp_write_signal = 0;
                sp_write_sel = 0;
            end
            'b101110: begin
                alu_sel1 = 0;
                alu_sel2 = 1;
                alu_op = 'b0000;
                if(gz==1)pc_sel=1;
                else pc_sel = 0;
                mem_write_signal = 0;
                reg_write_signal = 0;
                reg_dst_sel = 0;
                reg_write_sel = 0;
                mem_addr_sel = 0;
                mem_data_sel = 1;
                sp_load_sel = 0;
                sp_update_sel = 0;
                sp_write_signal = 0;
                sp_write_sel = 0;
            end
            'b101111: begin
                alu_sel1 = 0;
                alu_sel2 = 1;
                alu_op = 'b0000;
                if(eqz==1)pc_sel = 1;
                else pc_sel = 0;
                mem_write_signal = 0;
                reg_write_signal = 0;
                reg_dst_sel = 0;
                reg_write_sel = 0;
                mem_addr_sel = 0;
                mem_data_sel = 1;
                sp_load_sel = 0;
                sp_update_sel = 0;
                sp_write_signal = 0;
                sp_write_sel = 0;
            end
            'b110000: begin
                alu_sel1 = 0;
                alu_sel2 = 1;
                alu_op = 'b0000;
                pc_sel = 1;
                mem_write_signal = 1;
                reg_write_signal = 0;
                reg_dst_sel = 0;
                reg_write_sel = 0;
                mem_addr_sel = 1;
                mem_data_sel = 0;
                sp_load_sel = 0;
                sp_update_sel = 0;
                sp_write_signal = 1;
                sp_write_sel = 0;
            end
            'b110001: begin
                alu_sel1 = 0;
                alu_sel2 = 0;
                alu_op = 'b0000;
                pc_sel = 2'b10;
                mem_write_signal = 0;
                reg_write_signal = 0;
                reg_dst_sel = 0;
                reg_write_sel = 0;
                mem_addr_sel = 1;
                mem_data_sel = 0;
                sp_load_sel = 1;
                sp_update_sel = 1;
                sp_write_signal = 1;
                sp_write_sel = 0;
            end
            'b110010: begin
                $finish;
            end
            'b110011: begin
                alu_sel1 = 0;
                alu_sel2 = 0;
                alu_op = 'b0000;
                pc_sel = 0;
                mem_write_signal = 0;
                reg_write_signal = 0;
                reg_dst_sel = 0;
                reg_write_sel = 0;
                mem_addr_sel = 0;
                mem_data_sel = 0;
                sp_load_sel = 0;
                sp_update_sel = 0;
                sp_write_signal = 0;
                sp_write_sel = 0; 
            end
        
        endcase
    end  
endmodule