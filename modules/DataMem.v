`ifndef __DATAMEM_V__
`define __DATAMEM_V__

`include "Defines.v"

module DataMem (
	// output
	output [31:0] dataOut,
	// input
	input clk, reset, writeEn,
	input [31:0] addr, dataIn
	);

	integer i;
	reg [31:0] memory[0:`DATAMEM_SIZE - 1];

	always @ (posedge clk)
	begin
		if (reset)
			for (i = 0; i < `DATAMEM_SIZE; i = i + 1)
				memory[i] <= 0;
		else if (writeEn)
			memory[i] <= dataIn;
	end

	assign dataOut = memory[addr];

endmodule

`endif /*__DATAMEM_V__*/