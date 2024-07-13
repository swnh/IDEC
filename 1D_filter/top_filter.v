module top_filter;

reg clk, n_reset;

initial clk = 1'b0;
always #5 clk = ~clk;

reg [15:0] in_data[0:95999];
reg [15:0] out_data[0:95999];

reg    	    [15:0] x_in;
wire signed [15:0] y_out;
integer idx, out_idx;
initial begin
	n_reset = 1'b1;
	idx = 0;
	out_idx = 0;
	x_in = 0;
	$readmemh("./filter_in_fixed.txt", in_data); 
	$readmemh("./filter_out_fixed.txt", out_data);
	#3;
	n_reset = 1'b0;
	#20;
	n_reset = 1'b1;
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	for(idx=0;idx<96000;idx=idx+1) begin
		x_in = in_data[idx];
		@(posedge clk);
	end
	x_in = 0;
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	$finish;
end

filter i_filter(.clk(clk), .n_reset(n_reset), .x_in(x_in), .y_out(y_out),
		.h_write(1'b0), .h_idx(5'b0), .h_data(16'b0));
/*
always @(posedge clk) begin
	$display("%d",y_out);
end
*/

always @(posedge clk) begin
	if(out_idx >= 6) begin
		if(out_data[out_idx-6] != y_out) begin
			$display("Error!");
			#10; $finish;
		end
	end
	$display("out_idx : %d",out_idx);
	out_idx = out_idx + 1;
end
endmodule
