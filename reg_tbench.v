/*Registr mem modulunun calisip calismadigi test edildi*/
module reg_tbench();

	wire [31:0] read_data_1, read_data_2;
	reg [31:0] write_data;
	reg	[4:0] read_reg_1, read_reg_2, write_reg;
	reg signal_reg_write, clock;
	
reg [7:0]program_counter;
wire [31:0]instruction;

mips_instr_mem mem(instruction,program_counter);

mips_registers regist( read_data_1, read_data_2,write_data,instruction[25:21],instruction[20:16], write_reg,signal_reg_write, clock);

initial begin

	clock=1;program_counter=8'b00000000; 
	#20;




end

initial begin

$monitor("time = %2d, ins=%32b, read_data_1=:%32b, read_data_2=%32b", $time,instruction,read_data_1,read_data_2);
end


endmodule