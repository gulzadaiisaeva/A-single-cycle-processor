/*Program Counter modulunu yazip onu mips_core icinde arttirmaya calistim ,yapamadim
  mips_core modulunu degistirdim, input olarak PC verdim, ve her satir icin PC counteri verdim*/
/*Dongu icinde yapilmadi PC counter tek tek girildi test_Benchte*/
/*Pc counterden dolayi JUMP, BRANCH gibi instructionlar calismayacak*/
/*Kodumda calisan instructionlari my_instr_mem.mem dosyaya yazip, o dosyadan okuyup calistiracak testbench*/
/*Outputlari da bu module icinde yazdirdim*/



module mips_core(clock,program_counter);
input clock;
input [7:0]program_counter;

wire RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,Jump; //control unitteki sinyaller
wire [31:0]instruction;  //ouput for mipsinstr
wire [1:0]ALUOp; //alu control sinyal
wire [31:0] read_data_1, read_data_2; //rs ve rt
wire [4:0]write_reg; //1.mux rt veya rd
wire [31:0] alu_mux; //2.mux read_data_2 veya sign_extended
wire  [31:0] write_data; //data mem den sonraki 3.mux read_data veya AluResult
wire [31:0]sign_extended;
wire [3:0] alucontrol;  //alu icin control sinyal
wire zero;
wire [31:0] ALURes;  //Alunun resulti
wire [31:0] read_datamem;  //data memorynin cikisi
wire [4:0] Rs,Rt,Rd;
wire [15:0] unextend;
wire [5:0]func_code;
wire [5:0] instr_opcode;

//instruction parcalama
assign Rs=instruction[25:21];
assign Rt=instruction[20:16];
assign Rd=instruction[15:11];
assign unextend=instruction[15:0];
assign func_code=instruction[5:0];
assign instr_opcode=instruction[31:26];
		
		//program counter modulunu yaptim ama calistiramadim, counterin artmasini saglayamadim
		//Pcounter(clk  , instruction ,  zero , branch , jump , program_counter );
		
		mips_instr_mem  instMemory(instruction, program_counter);
		
		Control_Unit control(RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,Jump,ALUOp,instr_opcode);
		
		assign write_reg=(RegDst==1)? Rd : Rt;  //1.mux

		mips_registers mipsreg(read_data_1, read_data_2,0,Rs, Rt, write_reg,RegWrite, clock); //writedata 0

		sign_ext signext( sign_extended ,unextend);
		
		assign alu_mux= (ALUSrc==1) ? sign_extended : read_data_2;  //2.mux

		ALUControl myaluctr (alucontrol,func_code,ALUOp); 

		ALU myalu(zero, ALURes, read_data_1, alu_mux, alucontrol);
		
		mips_data_mem datamem (read_datamem,  ALURes, read_data_2, MemRead, MemWrite);

		assign write_data=(MemtoReg==1) ? read_datamem : ALURes; // 3.mux

		mips_registers mipsreg2(read_data_1, read_data_2,write_data,Rs, Rt, write_reg,RegWrite, clock); 



initial begin
$monitor("instruction= %32b\nRegDst= %1b ALUSrc=%1b MemtoReg=%1b RegWrite=%1b MemRead=%1b MemWrite=%1b Branch=%1b Jump=%1b AluOp=%2b ALUControl=%4b\nRS=%5b RT=%5b Opcode=%6b\nExtended=%32b\nALUinput1=%32b\nALUinput2=%32b\nALUResul=%32b\nWrite_data=%32b\n",
instruction, RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,Jump,ALUOp,alucontrol,Rs, Rt, instr_opcode,sign_extended,read_data_1,read_data_2,ALURes,write_data);
end

endmodule
