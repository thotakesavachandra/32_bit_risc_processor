
module gen_slow_clk(slow_clk, fast_clk);
	input fast_clk;
	reg [26:0] counter;
	output wire slow_clk;
	 
	always@(posedge fast_clk)
	begin
	    counter <= counter + 1;
	end
    initial
    begin
        counter = 0;
    end
	   
	assign slow_clk = counter[18];
    // always @(posedge slow_clk) $display("ALU slow_clk");

endmodule




module top_module(input fast_clk,input man_clk);
    wire slow_clk;
    gen_slow_clk G0(slow_clk,fast_clk);
    reg counter;

    reg control_clk,write_clk;

    initial begin
        counter = 0;
        write_clk = 0;
        control_clk = 0;
    end



    wire [5:0] opcode;
    wire eqz;
    wire gz;
    wire lz;
    wire reg_dst_sel;
    wire [1:0]alu_sel1;
    wire alu_sel2;
    wire [3:0] alu_op;
    wire [1:0]pc_sel;
    wire sp_update_sel;
    wire sp_load_sel;
    wire sp_write_sel;
    wire mem_addr_sel;
    wire mem_data_sel;
    wire mem_write_signal;
    wire reg_write_signal;
    wire sp_write_signal;
    wire reg_write_sel;


    datapath D0(
        opcode[5:0],
        eqz,
        gz,
        lz,
        reg_dst_sel,
        alu_sel1[1:0],
        alu_sel2,
        alu_op[3:0],
        pc_sel[1:0],
        sp_update_sel,
        sp_load_sel,
        sp_write_sel,
        mem_addr_sel,
        mem_data_sel,
        mem_write_signal,
        reg_write_signal,
        sp_write_signal,
        reg_write_sel,
        write_clk
    );


    control_path C0(
        control_clk,
        opcode[5:0],
        eqz,
        gz,
        lz,
        reg_dst_sel,
        alu_sel1[1:0],
        alu_sel2,
        alu_op[3:0],
        pc_sel[1:0],
        sp_update_sel,
        sp_load_sel,
        sp_write_sel,
        mem_addr_sel,
        mem_data_sel,
        mem_write_signal,
        reg_write_signal,
        sp_write_signal,
        reg_write_sel
    );

    always @(posedge slow_clk)
    begin
        // $display("\n**********State = %d**********",counter);
        if(man_clk == 1)
        begin
            if(counter==0)
            begin
                control_clk = 1;
                write_clk = 0;
            end
            if(counter==1)
            begin 
                control_clk = 0;
                write_clk = 1;
            end
            counter <= ~counter;
        end
    end
endmodule
