module sign_ext(extended ,unextend);
/*kitabin ilk sayfasindaki tablodan alindi*/
input  [15:0] unextend;
output [31:0] extended;

assign extended = {{16{unextend[15]}}, unextend};
/*
initial begin
$monitor("Extended= 3%1b", extended);
end*/

endmodule
