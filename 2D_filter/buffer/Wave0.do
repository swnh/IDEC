onerror resume
wave tags  F0
wave update off
wave zoom range 11141053 11141310
wave group top_filter_2d.i_filter -backgroundcolor #004466
wave add -group top_filter_2d.i_filter top_filter_2d.i_filter.clk -tag F0 -radix hexadecimal
wave add -group top_filter_2d.i_filter top_filter_2d.i_filter.rstn -tag F0 -radix hexadecimal
wave add -group top_filter_2d.i_filter top_filter_2d.i_filter.i_strb -tag F0 -radix hexadecimal
wave add -group top_filter_2d.i_filter top_filter_2d.i_filter.i_data -tag F0 -radix hexadecimal
wave add -group top_filter_2d.i_filter top_filter_2d.i_filter.i_op.rd_data -tag F0 -radix hexadecimal
wave add -group top_filter_2d.i_filter top_filter_2d.i_filter.i_buf.mode_change -tag F0 -radix hexadecimal
wave add -group top_filter_2d.i_filter top_filter_2d.i_filter.i_buf.mode -tag F0 -radix hexadecimal
wave add -group top_filter_2d.i_filter top_filter_2d.i_filter.o_strb -tag F0 -radix hexadecimal
wave add -group top_filter_2d.i_filter top_filter_2d.i_filter.i_op.pd_out -tag F0 -radix decimal
wave add -group top_filter_2d.i_filter top_filter_2d.i_filter.i_op.acc -tag F0 -radix decimal
wave add -group top_filter_2d.i_filter top_filter_2d.i_filter.i_op.acc_in -tag F0 -radix decimal
wave add -group top_filter_2d.i_filter top_filter_2d.i_filter.i_op.pd_en -tag F0 -radix hexadecimal -select
wave add -group top_filter_2d.i_filter top_filter_2d.i_filter.i_op.mul -tag F0 -radix decimal
wave add -group top_filter_2d.i_filter top_filter_2d.i_filter.i_op.pd -tag F0 -radix hexadecimal
wave add -group top_filter_2d.i_filter top_filter_2d.i_filter.i_op.coeff -tag F0 -radix hexadecimal
wave add -group top_filter_2d.i_filter top_filter_2d.i_filter.o_data -tag F0 -radix decimal -foregroundcolor Black
wave add -group top_filter_2d.i_filter top_filter_2d.i_filter.i_op.start -tag F0 -radix hexadecimal
wave add -group top_filter_2d.i_filter top_filter_2d.i_filter.i_op.mem_rd -tag F0 -radix hexadecimal
wave add -group top_filter_2d.i_filter top_filter_2d.i_filter.i_op.acc_en -tag F0 -radix hexadecimal
wave add -group top_filter_2d.i_filter top_filter_2d.i_filter.i_op.cnt -tag F0 -radix decimal
wave add -group top_filter_2d.i_filter top_filter_2d.i_filter.i_op.cnt_x -tag F0 -radix decimal
wave add -group top_filter_2d.i_filter top_filter_2d.i_filter.i_op.cnt_y -tag F0 -radix decimal
wave insertion [expr [wave index insertpoint] + 1]
wave add top_filter_2d.i_filter.i_op.rd_addr -tag F0 -radix decimal
wave group top_filter_2d.i_filter.i_op -backgroundcolor #006666
wave add -group top_filter_2d.i_filter.i_op top_filter_2d.i_filter.i_buf.i_buf0.addr -tag F0 -radix decimal
wave add -group top_filter_2d.i_filter.i_op top_filter_2d.i_filter.i_buf.i_buf0.dout -tag F0 -radix hexadecimal
wave add -group top_filter_2d.i_filter.i_op top_filter_2d.i_filter.i_buf.i_buf1.addr -tag F0 -radix decimal
wave add -group top_filter_2d.i_filter.i_op top_filter_2d.i_filter.i_buf.i_buf1.dout -tag F0 -radix hexadecimal
wave insertion [expr [wave index insertpoint] + 1]
wave update on
wave top 0
