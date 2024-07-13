module filter2d(   
                input           clk,
                input           rstn,
                input           i_strb,
                input  [7:0]    i_data,
                output          o_strb,
                output [7:0]    o_data,
                input           h_write,
                input  [3:0]    h_idx,
                input  [7:0]    h_data 
);

wire start;
wire mem_rd;
wire [15:0] rd_addr;
wire [7:0] rd_data;

filter2d_buf i_buf(
                .clk(clk),
                .rstn(rstn),
                .i_strb(i_strb),
                .i_data(i_data),

                .start(start),
                
                .mem_rd(mem_rd),
                .rd_addr(rd_addr),
                .rd_data(rd_data)
);

filter2d_op i_op(
                .clk(clk),
                .rstn(rstn),
                .start(start),
                
                .mem_rd(mem_rd),
                .rd_addr(rd_addr),
                .rd_data(rd_data),
                
                .o_strb(o_strb),
                .o_data(o_data),

                .h_write(h_write),
                .h_idx(h_idx),
                .h_data(h_data)
);

endmodule