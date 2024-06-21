module MEMORY(input [31:0]addr, input [31:0]data_in,input write_clk, output [31:0]data_out );
    reg [7:0]mem[0:1023];
    assign data_out = {mem[addr][7:0], mem[addr+1][7:0], mem[addr+2][7:0], mem[addr+3][7:0]};
    always @(posedge write_clk)
    begin
        $display("===============================> Memory Write Data in : %d  <==============",data_in);
        // $display("Memory Write Address : %d",addr);
        // $display("Memory Write Data out : %d",data_out);
        mem[addr] = data_in[31:24];
        mem[addr+1] = data_in[23:16];
        mem[addr+2] = data_in[15:8];
        mem[addr+3] = data_in[7:0];
    end
endmodule



module INSTR_MEMORY(input [31:0]addr,output [31:0]instr);
    reg [7:0]mem[0:1023];
    initial begin
        $readmemb("./gcd/binary_instr_gcd.txt",mem);
        // $readmemb("./b_sort/binary_instr_b_sort.txt",mem);
    end
    assign instr = {mem[addr][7:0], mem[addr+1][7:0], mem[addr+2][7:0], mem[addr+3][7:0]};
endmodule