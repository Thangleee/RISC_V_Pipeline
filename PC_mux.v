module pc_mux (
    input  [31:0] PCPlus4F,
    input  [31:0] JumpTargetE,
    input         PCSrcE,
    output [31:0] PCNextF
);

    assign PCNextF = PCSrcE ? JumpTargetE : PCPlus4F;

endmodule

