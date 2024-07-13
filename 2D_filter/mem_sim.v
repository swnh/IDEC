module mem_single #(
		  WD = 128
		, DEPTH = 64
		, WA = $clog2(DEPTH)
) ( 
		  input					clk
		, input					cs
		, input					we
		, input		[WA-1:0]	addr
		, input		[WD-1:0]	din
		, output 	[WD-1:0]	dout
);

reg	[WD-1:0]	data[DEPTH-1:0];
reg	[WA-1:0]	addr_d;

always@(posedge clk) begin
	if(cs == 1'b1) begin
		if(we == 1'b1) data[addr] <= din;
		addr_d <= addr;
	end
end
assign dout = data[addr_d];

endmodule