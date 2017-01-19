module ALU(zero,ALURes,ReadData1,ReadData2,ALUctrl);
 
	/*Alu controlden gelen bite gore gerekli islemleri yapar ve sonucu AluRes e gonderir*/
	
	output zero;
	output [31:0] ALURes;
	input [31:0] ReadData1;
	input [31:0] ReadData2;
	input [3:0] ALUctrl;
	wire [31:0] forAnd,forOr,forAdd,forSub,forNor,forSrl,forSll,forXor;

	assign forAnd=ReadData1 & ReadData2;
	assign forOr=ReadData1 | ReadData2;
	assign forAdd=ReadData1 + ReadData2;
	assign forSub=ReadData1 - ReadData2;
	assign forNor=~(ReadData1 | ReadData2) ;
	assign forSrl=ReadData1 << ReadData2;
	assign forSll=ReadData1 >> ReadData2;
	assign forXor=ReadData1 ^ ReadData2;

	
	
	assign ALURes=((ALUctrl==4'b0000) ?  forAnd :   //and
						(ALUctrl==4'b0001) ?  forOr :    //or
						(ALUctrl==4'b0010) ?  forAdd:    //add
						(ALUctrl==4'b0110) ?  forSub:    //sub
						(ALUctrl==4'b1100) ?  forNor:    //nor
						(ALUctrl==4'b0100) ?  forSrl :   //srl
						(ALUctrl==4'b0011) ?  forSll :   //sll
						(ALUctrl==4'b0101) ?  forXor:    //xor
						((ALUctrl==4'b0111) & (ReadData1 < ReadData2)) ? 32'b00000000000000000000000000000001 : 32'b0);  //slt
	
	assign zero=(ALURes==32'b0) ? 1 : 0;
	/*
	initial begin
	$monitor("ALURes=%32b",ALURes);
	end*/
	
endmodule
	