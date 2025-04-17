/*
    Name: Pipeline register between Datapath Fetch and Decode Stage
*/

module IF_ID (
    input        clk,
    input        reset,
    input        clear,
    input        enable,
    input  [31:0] InstrF,
    input  [31:0] PCF,
    input  [31:0] PCPlus4F,
    output reg [31:0] InstrD,
    output reg [31:0] PCD,
    output reg [31:0] PCPlus4D
);

    always @ (posedge clk or posedge reset) begin
        if (reset) begin  // Asynchronous reset
            InstrD    <= 32'b0;
            PCD       <= 32'b0;
            PCPlus4D  <= 32'b0;
        end else if (enable) begin
            if (clear) begin  // Synchronous clear
                InstrD    <= 32'b0;
                PCD       <= 32'b0;
                PCPlus4D  <= 32'b0;
            end else begin
                InstrD    <= InstrF;
                PCD       <= PCF;
                PCPlus4D  <= PCPlus4F;
            end
        end
    end

endmodule
