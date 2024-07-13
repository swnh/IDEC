module top_filter_2d;

reg     clk;
reg     rstn;
reg     start;
wire    finish;

initial clk = 1'b0;
always #5 clk = ~clk;

initial begin
    rstn = 1'b1;
    $readmemh("./img_in.dat", i_buf.data);
    #3;
    rstn = 1'b0;
    #20;
    rstn = 1'b1;
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    start = 1'b1;
    @(posedge clk);
    start = 1'b0;
end

wire        cs;
wire        we;
wire [16:0] addr;
wire [7:0]  din;
wire [7:0]  dout;

filter2d i_filter2d(
            .clk(clk),
            .rstn(rstn),
            .start(start),
            .finish(finish),
            .cs(cs),
            .we(we),
            .addr(addr),
            .din(din),
            .dout(dout),
            .h_write(1'b0),
            .h_idx(4'b0),
            .h_data(8'b0)
);

mem_single #(
            .WD(8),
            .DEPTH(256*256*2)
) i_buf(
            .clk(clk),
            .cs(cs),
            .we(we),
            .addr(addr),
            .din(din),
            .dout(dout)
);

always @(posedge clk) begin
    if (finish == 1'b1) begin
        for (int i=0; i<256; i++) begin
            for (int j=0; j<256; j++) begin
                $write("%3d ", i_buf.data[i*256+j+256*256]);
            end
            $write("\n");
        end
        $finish;
    end
end

endmodule