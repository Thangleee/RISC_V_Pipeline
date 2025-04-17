module result_mux (
    input [31:0] ALUResultW,
    input [31:0] ReadDataW,
    input [31:0] PCPlus4W,
    input [1:0]  ResultSrcW,
    output [31:0] ResultW
);

    assign ResultW = (ResultSrcW == 2'b10) ? PCPlus4W :
                     (ResultSrcW == 2'b01) ? ReadDataW :
                                             ALUResultW;

endmodule

