module filter(
		input             clk,
		input             n_reset,
		input      [15:0] x_in,
		output reg [15:0] y_out,

		input     	 h_write,
		input [4:0]  h_idx,
		input [15:0] h_data
);

reg signed [15:0] x[20:0];
always @(posedge clk or negedge n_reset) begin
	if(n_reset == 1'b0) begin
		x[0] <= 'b0;
		x[1] <= 'b0;
		x[2] <= 'b0;
		x[3] <= 'b0;
		x[4] <= 'b0;
		x[5] <= 'b0;
		x[6] <= 'b0;
		x[7] <= 'b0;
		x[8] <= 'b0;
		x[9] <= 'b0;
		x[10] <= 'b0;
		x[11] <= 'b0;
		x[12] <= 'b0;
		x[13] <= 'b0;
		x[14] <= 'b0;
		x[15] <= 'b0;
		x[16] <= 'b0;
		x[17] <= 'b0;
		x[18] <= 'b0;
		x[19] <= 'b0;
		x[20] <= 'b0;
	end else begin
		x[0] <= x_in;
		x[1] <= x[0];
		x[2] <= x[1];
		x[3] <= x[2];
		x[4] <= x[3];
		x[5] <= x[4];
		x[6] <= x[5];
		x[7] <= x[6];
		x[8] <= x[7];
		x[9] <= x[8];
		x[10] <= x[9];
		x[11] <= x[10];
		x[12] <= x[11];
		x[13] <= x[12];
		x[14] <= x[13];
		x[15] <= x[14];
		x[16] <= x[15];
		x[17] <= x[16];
		x[18] <= x[17];
		x[19] <= x[18];
		x[20] <= x[19];
	end
end

/*
reg signed [15:0] h[20:0] =
	{-16'd    10, 16'd    62,  16'd   84, -16'd  296, -16'd   246,
	  16'd   954, 16'd   477, -16'd 2645, -16'd  689,  16'd 10122,
	  16'd 17159, 16'd 10122, -16'd  689, -16'd 2645,  16'd   477,
	 -16'd   954,-16'd   246, -16'd  296,  16'd   84,  16'd   62,
	 -16'd   10};
*/

reg signed [15:0] h[20:0];
always @(posedge clk or negedge n_reset) begin
	if(n_reset == 1'b0) begin
		h[ 0] <= -16'd   10;
		h[ 1] <=  16'd   62;
		h[ 2] <=  16'd   84;
		h[ 3] <= -16'd  296;
		h[ 4] <= -16'd  246;
		h[ 5] <=  16'd  954;
		h[ 6] <=  16'd  477;
		h[ 7] <= -16'd 2645;
		h[ 8] <= -16'd  689;
		h[ 9] <=  16'd10122;
		h[10] <=  16'd17159;
		h[11] <=  16'd10122;
		h[12] <= -16'd  689;
		h[13] <= -16'd 2645;
		h[14] <=  16'd  477;
		h[15] <=  16'd  954;
		h[16] <= -16'd  246;
		h[17] <= -16'd  296;
		h[18] <=  16'd   84;
		h[19] <=  16'd   62;
		h[20] <= -16'd   10;	
	end else begin
		if(h_write == 1'b1) begin
			h[h_idx] <= h_data;		
		end
	end
end

wire signed [31:0] mul[20:0]; // (16,13) * (16,15) -> (31,28) if sym. sat.
			      // (32,28) sum -> filter property
assign mul[0]  = x[0]  * h[0];
assign mul[1]  = x[1]  * h[1];
assign mul[2]  = x[2]  * h[2];
assign mul[3]  = x[3]  * h[3];
assign mul[4]  = x[4]  * h[4];
assign mul[5]  = x[5]  * h[5];
assign mul[6]  = x[6]  * h[6];
assign mul[7]  = x[7]  * h[7];
assign mul[8]  = x[8]  * h[8];
assign mul[9]  = x[9]  * h[9];
assign mul[10] = x[10] * h[10];
assign mul[11] = x[11] * h[11];
assign mul[12] = x[12] * h[12];
assign mul[13] = x[13] * h[13];
assign mul[14] = x[14] * h[14];
assign mul[15] = x[15] * h[15];
assign mul[16] = x[16] * h[16];
assign mul[17] = x[17] * h[17];
assign mul[18] = x[18] * h[18];
assign mul[19] = x[19] * h[19];
assign mul[20] = x[20] * h[20];

wire signed [31:0] sum = mul[0] + mul[1] + mul[2] + mul[3] + mul[4] + mul[5] + mul[6] 
						+ mul[7] + mul[8]+ mul[9] + mul[10] + mul[11] + mul[12] + mul[13]
						+ mul[14] + mul[15] + mul[16] + mul[17] + mul[18]+ mul[19]
			 			+ mul[20];
wire signed [31:0] y_rnd = sum + (1<<15); // for rounding
always @(posedge clk or negedge n_reset) begin
	if(n_reset == 1'b0) begin
		y_out <= 'b0;	
	end else begin
		y_out <= y_rnd[31:16];
	end
end

endmodule
























