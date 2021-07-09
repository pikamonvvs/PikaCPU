`ifndef __INSTRMEM_V__
`define __INSTRMEM_V__

`include "Defines.v"

module InstrMem (
	// output
	output [31:0] instr,
	// input
	input clk, reset,
	input [$clog2(`INSTRMEM_SIZE) - 1:0] addr // TODO:
	);

	integer i;
	reg [31:0] memory[0:`INSTRMEM_SIZE - 1];

	always @ (posedge clk)
	begin
//		if (reset)
//			for (i = 0; i < `INSTRMEM_SIZE; i = i + 1)
//				memory[i] <= 0;
	end

	assign instr = memory[addr];

endmodule

`endif /*__INSTRMEM_V__*/