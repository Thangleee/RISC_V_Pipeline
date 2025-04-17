/*
    Name: ALU Unit
    Description: Receives control signals from the ALU Decoder and performs the operations
*/

module alu(
    input  [31:0] SrcA,
    input  [31:0] SrcB,
    input  [3:0]  ALUControl,
    output reg [31:0] ALUResult,  // ✅ KHAI BÁO reg TRỰC TIẾP TRONG output
    output Zero,
    output Sign
);

    wire [31:0] Sum;
    wire        Overflow;

    // Tính tổng hoặc hiệu
    assign Sum = SrcA + ((ALUControl[0]) ? ~SrcB : SrcB) + ALUControl[0];

    // Overflow cho cộng/trừ số có dấu
    assign Overflow = (ALUControl[0] ^ SrcA[31] ^ SrcB[31]) & (SrcA[31] ^ Sum[31]);

    // Zero = 1 nếu kết quả bằng 0
    assign Zero = (ALUResult == 32'b0);

    // Sign = bit dấu
    assign Sign = ALUResult[31];

    // ALU điều khiển
    always @(*) begin
        case (ALUControl)
            4'b0000: ALUResult = Sum;              // Cộng / trừ
            4'b0001: ALUResult = SrcA & SrcB;      // AND
            4'b0011: ALUResult = SrcA | SrcB;      // OR
            4'b0100: ALUResult = SrcA << SrcB;     // Shift left logical
            default: ALUResult = 32'b0;
        endcase
    end

endmodule
