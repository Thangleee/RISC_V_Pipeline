// Name: Data Memory

module dmem(
    input        clk,
    input        we,
    input  [31:0] a,
    input  [31:0] wd,
    output [31:0] rd
);

    reg [31:0] RAM [63:0];  // 64 x 32-bit memory

    // Read operation
    assign rd = RAM[a[31:2]];

    // Write operation
    always @(posedge clk) begin
        if (we)
            RAM[a[31:2]] <= wd;
    end

endmodule

