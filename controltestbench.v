/*Control Unit modulunun calisip calismadigi test edildi*/
module controltestbench();

 reg [5:0] ins;
 wire RegDst,Branch,MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite,Jump;
 wire [1:0] AluOp;
 
 Control_Unit elma(RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,Jump,AluOp,ins[5:0]);
 
 
 initial begin
 ins = 6'b000000;
 #20;
 ins = 6'b100011;
 #20;
 ins = 6'b101011;
 #20;
 ins = 6'b000100;
 end

 
initial
begin

$monitor("time = %2d, RegDst=%1d,Branch=%1d,MemRead=%1d,MemtoReg=%1d,ALUop1=%1d,ALUop0=%1d,MemWrite=%1d,ALUSrc=%1d,RegWrite=%1d,Jump=%1d", $time, RegDst,Branch,MemRead,MemtoReg,AluOp[1],AluOp[0],MemWrite,ALUSrc,RegWrite,Jump);

end

endmodule