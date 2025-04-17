module forwardA (
    input  [31:0] RD1,
    input  [31:0] ResultW,
    input  [31:0] ALUResultM,
    input  [1:0]  ForwardA,
    output [31:0] out
);

    assign out = (ForwardA == 2'b10) ? ALUResultM :
                 (ForwardA == 2'b01) ? ResultW   :
                                       RD1;

endmodule
