module forwardB (
    input  [31:0] RD2,
    input  [31:0] ResultW,
    input  [31:0] ALUResultM,
    input  [1:0]  ForwardB,
    output [31:0] out
);

    assign out = (ForwardB == 2'b10) ? ALUResultM :
                 (ForwardB == 2'b01) ? ResultW   :
                                       RD2;

endmodule
