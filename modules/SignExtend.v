`ifndef __SIGNEXTEND_V__
`define __SIGNEXTEND_V__

`include "defines.v"

module SignExtend (
	// output
	output	[31:0]	out,
	// input
	input	[15:0]	in
	);

	assign out = (in[15] == 1) ? {16'b1111111111111111, in} : {16'b0000000000000000, in};

endmodule // SignExtend

`endif /*__SIGNEXTEND_V__*/