module Control_Unit(RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,Jump,ALUOp,OPCode);
		
		/*7.Slidein 19 sayfasindaki tabloya gore sinyaller uretildi. Istenilen butun instructionlar icin yapamadim*/
		/*Butun R typelar, sw,lw,jump,addi,lbu,lh ,slti,sltui,,sltu beq icin yapildi*/
		output RegDst;
		output ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,Jump;
		output [1:0] ALUOp;
		input [5:0] OPCode;
	
		/* ilk basta 7 pdfteki truth table a gore bunu yapmaya calismistim
		
		assign RegWrite=(!op[5] & !op[4] & !op[3] & !op[2] & !op[1] & !op[0]) + (op[5] & !op[4] & !op[3] & !op[2] & op[1] & op[0]);
		assign ALUSrc=(op[5] & !op[4] & !op[3] & !op[2] & op[1] & op[0])+(op[5] & !op[4] & op[3] & !op[2] & op[1] & op[0]);
		assign RegDst=!op[5] & !op[4] & !op[3] & !op[2] & !op[1] & !op[0];
		assign MemtoReg=op[5] & !op[4] & !op[3] & !op[2] & op[1] & op[0];
		assign MemRead=op[5] & !op[4] & !op[3] & !op[2] & op[1] & op[0];
		assign MemWrite=op[5] & !op[4] & op[3] & !op[2] & op[1] & op[0];
		assign Branch=!op[5] & !op[4] & !op[3] & op[2] & !op[1] & !op[0];
		assign AluOp[1]=!op[5] & !op[4] & !op[3] & !op[2] & !op[1] & !op[0];
		assign AluOp[0]=!op[5] & !op[4] & !op[3] & op[2] & !op[1] & !op[0];
		assign Jump=!op[5] & !op[4] & !op[3] & !op[2] & op[1] & !op[0];
		*/
		
		assign RegDst=   (OPCode==6'b000000)?1:0;		//r-Type	   
		assign ALUSrc=   (OPCode==6'b000000)?0:		//r-Type	   
					        (OPCode==6'b000100)?0:1;		//beq
		assign ALUOp[1]= (OPCode==6'b000000)?1:0;    //r-Type	 
		assign ALUOp[0]= (OPCode==6'b000100)?1:0;		//beq				
		assign MemtoReg= (OPCode==6'b100011)?1:0;		//lw
		assign MemRead=  (OPCode==6'b100011)?1:0;		//lw
		assign MemWrite= (OPCode==6'b101011)?1:0;		//sw
		assign RegWrite=((OPCode==6'b101011)?0:		//sw
					        (OPCode==6'b000100)?0:		//beq
					        (OPCode==6'b000010)?0:1);	//Jump
		assign Branch=   (OPCode==6'b000100)?1:0;		//beq
		assign Jump =    (OPCode==6'b000010)?1:0;    //Jump
					  
		
	/*					
		initial begin
		$monitor("RegDst= %1b ALUSrc=%1b MemtoReg=%1b RegWrite=%1b MemRead=%1b MemWrite=%1b Branch=%1b Jump=%1b", RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,Jump);
		end*/
	
endmodule
