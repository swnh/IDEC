onerror resume
wave tags  F0
wave update off
wave zoom range 0 483
wave group top_filter_2d.i_filter2d -backgroundcolor #004466
wave add -group top_filter_2d.i_filter2d top_filter_2d.i_filter2d.clk -tag F0 -radix hexadecimal
wave add -group top_filter_2d.i_filter2d top_filter_2d.i_filter2d.rstn -tag F0 -radix hexadecimal
wave add -group top_filter_2d.i_filter2d top_filter_2d.i_filter2d.start -tag F0 -radix hexadecimal
wave add -group top_filter_2d.i_filter2d top_filter_2d.i_filter2d.finish -tag F0 -radix hexadecimal
wave add -group top_filter_2d.i_filter2d top_filter_2d.i_filter2d.cs -tag F0 -radix hexadecimal
wave add -group top_filter_2d.i_filter2d top_filter_2d.i_filter2d.we -tag F0 -radix hexadecimal
wave add -group top_filter_2d.i_filter2d top_filter_2d.i_filter2d.addr -tag F0 -radix hexadecimal
wave add -group top_filter_2d.i_filter2d top_filter_2d.i_filter2d.din -tag F0 -radix hexadecimal
wave add -group top_filter_2d.i_filter2d top_filter_2d.i_filter2d.dout -tag F0 -radix hexadecimal
wave insertion [expr [wave index insertpoint] + 1]
wave add top_filter_2d.i_filter2d.clk -tag F0 -radix hexadecimal
wave add top_filter_2d.i_filter2d.rstn -tag F0 -radix hexadecimal
wave add top_filter_2d.i_filter2d.start -tag F0 -radix hexadecimal
wave add top_filter_2d.i_filter2d.finish -tag F0 -radix hexadecimal
wave add top_filter_2d.i_filter2d.cs -tag F0 -radix hexadecimal
wave add top_filter_2d.i_filter2d.we -tag F0 -radix hexadecimal
wave add top_filter_2d.i_filter2d.addr -tag F0 -radix decimal
wave add top_filter_2d.i_filter2d.din -tag F0 -radix decimal
wave add top_filter_2d.i_filter2d.dout -tag F0 -radix decimal
wave add top_filter_2d.i_filter2d.on_proc -tag F0 -radix hexadecimal
wave add top_filter_2d.i_filter2d.cnt -tag F0 -radix decimal
wave add top_filter_2d.i_filter2d.cnt_x -tag F0 -radix decimal
wave add top_filter_2d.i_filter2d.cnt_y -tag F0 -radix decimal
wave add top_filter_2d.i_filter2d.rd_addr -tag F0 -radix decimal
wave add top_filter_2d.i_filter2d.mem_rd -tag F0 -radix hexadecimal
wave add top_filter_2d.i_filter2d.pd_en -tag F0 -radix hexadecimal
wave add top_filter_2d.i_filter2d.pd -tag F0 -radix hexadecimal -select
wave add top_filter_2d.i_filter2d.coeff -tag F0 -radix hexadecimal
wave add top_filter_2d.i_filter2d.mul -tag F0 -radix decimal
wave add top_filter_2d.i_filter2d.acc_in -tag F0 -radix decimal
wave add top_filter_2d.i_filter2d.acc_en -tag F0 -radix hexadecimal
wave add top_filter_2d.i_filter2d.acc -tag F0 -radix decimal
wave add top_filter_2d.i_filter2d.pd_out -tag F0 -radix decimal
wave add top_filter_2d.i_filter2d.mem_wr -tag F0 -radix hexadecimal
wave add top_filter_2d.i_filter2d.wr_addr -tag F0 -radix hexadecimal
wave update on
wave top 0
