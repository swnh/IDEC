module filter2d_op(
                input               clk,
                input               rstn,
                input               start,

                output              mem_rd,
                output  reg [15:0]  rd_addr,
                input       [7:0]   rd_data,

                output  reg         o_strb,
                output  reg [7:0]   o_data,

                input               h_write,
                input       [3:0]   h_idx,
                input       [7:0]   h_data
);

reg       on_proc;
reg [3:0] cnt;
reg [7:0] cnt_x;
reg [7:0] cnt_y;

always @(posedge clk or negedge rstn) begin
    if (!rstn) begin
        on_proc <= 1'b0;
        cnt     <= 1'b0;
        cnt_x   <= 1'b0;
        cnt_y   <= 1'b0;
    end else begin
        if (start == 1'b1) on_proc <= 1'b1;
        else if ((cnt == 11) && (cnt_x == 255) && (cnt_y == 255)) on_proc <= 1'b0;

        if (on_proc == 1'b1) begin
            cnt <= (cnt == 11) ? 0 : cnt+1;
            if (cnt == 11) begin
                cnt_x <= (cnt_x == 255) ? 0 : cnt_x+1;
                if (cnt_x == 255) begin
                    cnt_y <= (cnt_y == 255) ? 0 : cnt_y+1;
                end
            end
        end
    end
end

assign mem_rd = (cnt >= 0) && (cnt <= 8) && (on_proc == 1'b1);
always @(*) begin
    case(cnt) // RD 9 cycles
        4'd0:    rd_addr = (cnt_y-1)*256 + cnt_x-1;
        4'd1:    rd_addr = (cnt_y-1)*256 + cnt_x;
        4'd2:    rd_addr = (cnt_y-1)*256 + cnt_x+1;
        4'd3:    rd_addr = (cnt_y  )*256 + cnt_x-1;
        4'd4:    rd_addr = (cnt_y  )*256 + cnt_x;
        4'd5:    rd_addr = (cnt_y  )*256 + cnt_x+1;
        4'd6:    rd_addr = (cnt_y+1)*256 + cnt_x-1;
        4'd7:    rd_addr = (cnt_y+1)*256 + cnt_x;
        4'd8:    rd_addr = (cnt_y+1)*256 + cnt_x+1;
        default: rd_addr = 'bx;
    endcase
end

reg  [7:0] pd;
wire       pd_en = (cnt >= 1) && (cnt <= 9); // RD data 1 cycle delay 0~8 -> 1~9
always @(posedge clk or negedge rstn) begin
    if (!rstn) begin
        pd <= 0;
    end else begin
        if (pd_en == 1'b1) pd <= rd_data;
    end
end

reg signed [7:0] h[0:8];
always @(posedge clk or negedge rstn) begin
    if (!rstn) begin
        h[0] <= 8'h08;
        h[1] <= 8'h10;
        h[2] <= 8'h08;
        h[3] <= 8'h10;
        h[4] <= 8'h20;
        h[5] <= 8'h10;
        h[6] <= 8'h08;
        h[7] <= 8'h10;
        h[8] <= 8'h08;
    end else begin
        if (h_write == 1'b1) begin
            h[h_idx] <= h_data;
        end
    end
end

wire signed [7:0]  coeff = h[cnt-2];
wire signed [15:0] mul   = pd *coeff;
reg  signed [19:0] acc;
wire signed [19:0] acc_in = (cnt == 1) ? 0 : mul + acc;
reg                acc_en;

always @(*) begin
    acc_en = 1'b0;
    case(cnt)
        4'd 1: acc_en =  1'b1;
        4'd 2: if((cnt_y >   0) && (cnt_x >   0)) acc_en = 1'b1;
        4'd 3: if( cnt_y >   0                  ) acc_en = 1'b1;
        4'd 4: if((cnt_y >   0) && (cnt_x < 255)) acc_en = 1'b1;
        4'd 5: if( cnt_x >   0                  ) acc_en = 1'b1;
        4'd 6:                                    acc_en = 1'b1;
        4'd 7: if( cnt_x < 255                  ) acc_en = 1'b1;
        4'd 8: if((cnt_y < 255) && (cnt_x >   0)) acc_en = 1'b1;
        4'd 9: if( cnt_y < 255                  ) acc_en = 1'b1;
        4'd10: if((cnt_y < 255) && (cnt_x < 255)) acc_en = 1'b1;
        default:                                  acc_en = 1'b0;
    endcase
end

always @(posedge clk or negedge rstn) begin
    if (!rstn) begin
        acc <= 'b0;
    end else begin
        if (acc_en == 1'b1) acc <= acc_in;
    end
end

wire [19:0] pd_rnd_1 = acc + (1<<6);
wire [12:0] pd_rnd   = pd_rnd_1[19:7];
wire [7:0]  pd_out   = (pd_rnd <   0) ? 0
                     : (pd_rnd > 255) ? 255 // Saturation
                     :  pd_rnd[7:0];

always @(posedge clk or negedge rstn) begin
    if(!rstn) begin
        o_strb <= 1'b0;
        o_data <= 'b0;
    end else begin
        o_strb <= (cnt == 11);
        if(cnt == 11) begin
            o_data <= pd_out;
        end
    end
end

endmodule