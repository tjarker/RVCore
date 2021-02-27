
module wrapper
(
    input   clk,
    output  Clock
);

reg [24:0]count;
wire intClock;

assign intClock = count[24];

always @(posedge clk) begin
    count <= count + 24'h_1;
end

BUFG buffer(.O (Clock), .I (intClock));

endmodule