module mips_instr_mem(instruction, program_counter);
input [7:0] program_counter;
output [31:0] instruction;

reg [31:0] instr_mem [0:255];

initial begin
	$readmemb(".\\my_instr_mem.mem", instr_mem);
end

assign instruction = instr_mem[program_counter];
/*
initial begin
$monitor("ins= %32b\n Opcode=%6b", instruction,instruction[5:0]);
$monitor(" RS= %5b\n RT=%5b", instruction[25:21], instruction[20:16]);
end */
endmodule
