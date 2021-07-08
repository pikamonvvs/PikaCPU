`ifndef __REGFILE_V__
`define __REGFILE_V__

`include "Defines.v"

module RegFile (
	// output
	output [31:0] reg1, reg2,
	// input
	input clk, rst, writeEn,
	input [31:0] src1, src2, dest,
	input [31:0] writeVal
	);

	integer i;
	reg [31:0] register[0:`REGFILE_SIZE - 1];

	always @ (negedge clk) begin
		if (rst) begin
			for (i = 0; i < 32; i = i + 1)
				register[i] <= 0;
		end

		else if (writeEn) register[dest] <= writeVal;
		register[0] <= 0;
	end

	assign reg1 = (register[src1]);
	assign reg2 = (register[src2]);
endmodule // RegFile

`endif /*__REGFILE_V__*/