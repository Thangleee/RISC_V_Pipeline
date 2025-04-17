/*
    Name: Pipeline register between Memory Access and WriteBack Stage
*/

module MEM_WB (
    input         clk,
    input         reset,
    input  [31:0] ALUResultM,
    input  [31:0] ReadDataM,
    input  [4:0]  RdM,
    input  [31:0] PCPlus4M,

    output reg [31:0] ALUResultW,
    output reg [31:0] ReadDataW,
    output reg [4:0]  RdW,
    output reg [31:0] PCPlus4W
);

    always @ (posedge clk or posedge reset) begin
        if (reset) begin
            ALUResultW <= 32'b0;
            ReadDataW  <= 32'b0;
            RdW        <= 5'b0;
            PCPlus4W   <= 32'b0;
        end else begin
            ALUResultW <= ALUResultM;
            ReadDataW  <= ReadDataM;
            RdW        <= RdM;
            PCPlus4W   <= PCPlus4M;
        end
    end

endmodule

