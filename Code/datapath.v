module datapath(
    output wire [5:0] opcode,
    output wire eqz,
    output wire gz,
    output wire lz,
    input wire reg_dst_sel,
    input wire [1:0]alu_sel1,
    input wire alu_sel2,
    input wire [3:0] alu_op,
    input wire [1:0]pc_sel,
    input wire sp_update_sel,
    input wire sp_load_sel,
    input wire sp_write_sel,
    input wire mem_addr_sel,
    input wire mem_data_sel,
    input wire mem_write_signal,
    input wire reg_write_signal,
    input wire sp_write_signal,
    input wire reg_write_sel,
    input wire write_clk
);

    reg [31:0]pc;
    reg [31:0]sp;
    wire [31:0]instr;

    initial begin
        pc = 0;
        sp = 1024;
    end

    assign opcode = instr[31:26];
    INSTR_MEMORY instr_mem0(pc,instr);
    
    wire [3:0]rs;
    wire [3:0]rt;
    wire [3:0]rd;
    wire [15:0]imm;
    
    assign rs = instr[25:22];
    assign rt = instr[21:18];
    assign rd = instr[17:14];
    assign imm = instr[15:0];


    wire [3:0] reg_dst;
    wire [31:0] regout1,regout2,reg_write_data;
    MUX2I_4 reg_dst_mux(rd,rt,reg_dst_sel,reg_dst);
    reg_bank reg_bank0(rs,rt,reg_dst,reg_write_data,reg_bank_signal,regout1,regout2);

    wire [31:0]ex_imm;
    SIGN_MOD sign_mod0(imm,ex_imm);

    wire [31:0] alu_in1,alu_in2;
    MUX3I alu_mux1(regout1,pc,sp,alu_sel1,alu_in1);
    MUX2I alu_mux2(regout2,ex_imm,alu_sel2,alu_in2);

    wire [31:0]alu_out;
    ALU_32_bit alu0(alu_in1,alu_in2,alu_op,alu_out);

    wire [31:0] pc_plus_4,new_pc;
    adder_32_bit npc(pc,4,1'b0,pc_plus_4);
    MUX3I PC_update(pc_plus_4,alu_out,mem_out,pc_sel,new_pc);

    wire [31:0] sp_m1_out,sp_m2_out,sp_a1_out,sp_a2_out;
    wire [31:0]temp1 = -4;
    wire [31:0]temp2 = 4;
    MUX2I sp_mux_1(temp1,temp2,sp_update_sel,sp_m1_out);
    adder_32_bit sp_adder_1(sp,sp_m1_out,1'b0,sp_a1_out);

    wire [31:0]temp3 = -4;
    wire [31:0]temp4 = 0;
    MUX2I sp_mux_2(temp3,temp4,sp_load_sel,sp_m2_out);
    adder_32_bit sp_adder_2(sp,sp_m2_out,1'b0,sp_a2_out);

    wire [31:0] new_sp;
    MUX2I sp_mux_3(sp_a1_out,mem_out,sp_write_sel,new_sp);

    wire [31:0] mem_addr,mem_out;
    wire [31:0] data_in;
    MUX2I mem_mux_1(alu_out,sp_a2_out,mem_addr_sel,mem_addr);
    MUX2I mem_mux_2(pc_plus_4,regout2,mem_data_sel,data_in);

    
    MEMORY mem0(mem_addr,data_in,mem_bank_signal,mem_out);
    
    MUX2I reg_mux_w(alu_out,mem_out,reg_write_sel,reg_write_data);

    CMP b_flag(regout2,eqz,gz,lz);     ////////// INPUT OF COMPARATOR CHANGED TO RT
    

    reg reg_bank_signal,mem_bank_signal;

    always @(posedge write_clk)
    begin
        // $display("Instruction : %b",instr[31:16]);
        // $display("Instruction : %b",instr[15:0]);
        // $display("Opcode : %b",instr[31:26]);
        // $display("rs : %b",instr[25:22]);
        // $display("rt : %b",instr[21:18]);
        $display("*****************************");
        $display("opcode : %d",opcode);
        $display("PC : %d",pc);
        $display("SP : %d",sp);
        $display("ALU out : %d",alu_out);
        $display("MEM out : %d",mem_out);
        if(pc==200)
        begin
            $display("======================================> OUTPUT : %d  <================",mem_out);
        end
        // $display("regout1 : %d",regout1);
        // $display("regout2 : %d",regout2);
        // $display("reg_write_data : %d",reg_write_data);
        // $display("alu_out : %d",alu_out);
        $display("mem_addr : %d",mem_addr);
        // $display("mem_out : %d",mem_out);
        // $display("reg_bank_signal : %d",reg_bank_signal);
        // $display("mem_bank_signal : %d",mem_bank_signal);
        // $display("sp_write_signal : %d",sp_write_signal);
        // $display("reg_write_signal : %d",reg_write_signal);
        // $display("pc_sel : %d",pc_sel);
        
        if(reg_write_signal)
        begin
            reg_bank_signal = 1;
        end
        if(mem_write_signal)
        begin
            mem_bank_signal = 1;
        end
        if(sp_write_signal)
        begin
            sp <= new_sp;
        end
        pc <= new_pc;
    end

    always @(negedge write_clk)
    begin  
        reg_bank_signal = 0;
        mem_bank_signal = 0;
    end

endmodule
