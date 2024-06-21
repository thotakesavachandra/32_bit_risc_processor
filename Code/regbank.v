module reg_bank(input [3:0]read1,input [3:0]read2,input [3:0]write_addr,input [31:0]write_data,input write_clk,output [31:0]out1,output [31:0]out2);
reg [31:0]regbank[15:0];
assign out1 = regbank[read1];
assign out2 = regbank[read2];
initial begin
    regbank[0] = 0;
    regbank[1] = 1;
    regbank[2] = 2;
    regbank[3] = 3;
    regbank[4] = 4;
    regbank[5] = 5;
    regbank[6] = 6;
    regbank[7] = 7;
    regbank[8] = 8;
    regbank[9] = 9;
    regbank[10] = 10;
    regbank[11] = 11;
    regbank[12] = 12;
    regbank[13] = 13;
    regbank[14] = 14;
    regbank[15] = 15;
end
always @(posedge write_clk)
begin
regbank[write_addr] <= write_data;
end
endmodule