/*
    Name: Pipeline register between Datapath Execution and Memory Access Stage
*/

module EX_MEM (
    input        clk,
    input        reset,
    input  [31:0] ALUResultE,
    input  [31:0] WriteDataE,
    input  [4:0]  RdE,
    input  [31:0] PCPlus4E,

    output reg [31:0] ALUResultM,
    output reg [31:0] WriteDataM,
    output reg [4:0]  RdM,
    output reg [31:0] PCPlus4M
);

    always @ (posedge clk or posedge reset) begin
        if (reset) begin
            ALUResultM <= 32'b0;
            WriteDataM <= 32'b0;
            RdM        <= 5'b0;
            PCPlus4M   <= 32'b0;
        end else begin
            ALUResultM <= ALUResultE;
            WriteDataM <= WriteDataE;
            RdM        <= RdE;
            PCPlus4M   <= PCPlus4E;
        end
    end

endmodule
