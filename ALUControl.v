module ALUControl (AluControl,func,ALUOp);

	/*Alu controlu yazarken 7.ders slidein 13 sayfasindaki tabloya gore yaptim
	AluControl bitini 3 olarak almistiniz ben 4 bit olarak degistirdim*/
	
	
	output [3:0] AluControl;
	input [5:0] func;
	input [1:0] ALUOp;
	wire [3:0] func_temp;
	
	
	//AluControl codelarini 4.slidein 17 sayfasindan yararlandim, xor,nor icin de internetten buldum
	assign func_temp= ((func[3:0]==4'b0000) ? 4'b0010://add
					       (func[3:0]==4'b0010) ? 4'b0110://sub
							 (func[3:0]==4'b0100) ? 4'b0000://and
							 (func[3:0]==4'b0101) ? 4'b0001://or
							 (func[3:0]==4'b0110) ? 4'b1101: //xor
							 (func[3:0]==4'b0111) ? 4'b1100://nor
							 (func[3:0]==4'b1010) ? 4'b0111:4'b0000);//slt
							 

	assign AluControl=((ALUOp[1]==0 & ALUOp[0]==0) ? 4'b0010:   //00add
					    (ALUOp[1]==0 & ALUOp[0]==1) ? 4'b0110:      //01sub
                   (ALUOp[1]==1 & ALUOp[0]==0) ? func_temp: 4'b0000);//10
						 
						 
endmodule
