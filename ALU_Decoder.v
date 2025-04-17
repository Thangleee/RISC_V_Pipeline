/*
    Name: ALU Decoder
    Description: Receives control signal from the Main Decoder Unit and
    determines the type of operation that has to be performed by the ALU
*/

module aludec(
    input      [0:0]  opb5,        // bit 5 of opcode
    input      [2:0]  funct3,
    input      [0:0]  funct7b5,    // bit 5 of funct7
    input      [1:0]  ALUOp,
    output reg [3:0]  ALUControl
);

    wire RtypeSub;
    assign RtypeSub = (funct7b5 & opb5);  // TRUE nếu là phép trừ kiểu R-type

    always @(*) begin
        case (ALUOp)
            2'b00: ALUControl = 4'b0000; // LD, SD: cộng địa chỉ
            2'b01: ALUControl = 4'b0001; // BEQ: phép trừ để so sánh
            default: begin
                case (funct3)
                    3'b000: begin
                        if (RtypeSub)
                            ALUControl = 4'b0001;  // sub
                        else
                            ALUControl = 4'b0000;  // add, addi
                    end
                    3'b001: ALUControl = 4'b0100;  // sll, slli
                    3'b010: ALUControl = 4'b0101;  // slt, slti
                    3'b011: ALUControl = 4'b0110;  // sltu, sltiu
                    3'b100: ALUControl = 4'b1010;  // xor, xori
                    3'b101: begin
                        if (funct7b5)
                            ALUControl = 4'b1011;  // sra
                        else
                            ALUControl = 4'b1111;  // srl, srli
                    end
                    3'b110: ALUControl = 4'b0011;  // or, ori
                    3'b111: ALUControl = 4'b0001;  // and, andi
                    default: ALUControl = 4'bxxxx; // Không xác định
                endcase
            end
        endcase
    end

endmodule

