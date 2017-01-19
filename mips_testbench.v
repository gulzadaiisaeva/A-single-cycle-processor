/*Kodumda calisan instructionlari my_instr_mem.mem dosyaya yazip, o dosyadan okuyup calistiracak testbench*/
/*Sizin instruction.mem dosyanin yerine kendi dosyamdan okuyacak*/



module mips_testbench ();

reg clock;
reg [7:0]program_counter;

mips_core myCpu(clock,program_counter);

initial begin

		clock=1; program_counter=8'b00000000;
		#40;
		clock=1; program_counter=8'b00000001;
		#40;
		clock=1; program_counter=8'b00000010;
		#40;
		clock=1; program_counter=8'b00000011;
		#40;
		clock=1; program_counter=8'b00000100;
		#40;
		clock=1; program_counter=8'b00000101;
		#40;
		clock=1; program_counter=8'b00000101;
		#40;
		clock=1; program_counter=8'b00000110;
		#40;
		clock=1; program_counter=8'b00000111;
		#40;
		clock=1; program_counter=8'b00001000;
		#40;
		clock=1; program_counter=8'b00001001;
		#40;
		clock=1; program_counter=8'b00001010;
		#40;
		clock=1; program_counter=8'b00001011;
		#40;
		clock=1; program_counter=8'b00001100;
		#40;
		clock=1; program_counter=8'b00001101;
		#40;
		clock=1; program_counter=8'b00001110;
		#40;
	
		
	
	
	
end
/*
initial begin
$monitor("time = %2d, clock=%1b  PC=%8b\n", $time,clock,program_counter);

end*/

endmodule
