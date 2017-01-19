/*Alu modulunun calisip calismadigi test edildi*/

module alutestbench();
	
	reg [31:0] read_data1;
	reg [31:0] read_data2;
	wire [31:0] ALUResult;
	wire Zero;
	reg [3:0]ALUctr;

	ALU myAlu(Z1,ALUResult,A,B,ALUctr);
	
initial begin

	read_data1 = 32'b00000000000000000000000000000001; 
	read_data2 = 32'b00000000000000000000000000000010; ALUctr= 3'b0010;
	#20;
	
end
 
initial
begin

$monitor("time = %2d, A =%32b, B=%32b, ALUResultres=%32b, Z= %1b, ALUctr=%3b", $time, A, B, ALUResult,Zero,ALUctr);

end
 


endmodule
