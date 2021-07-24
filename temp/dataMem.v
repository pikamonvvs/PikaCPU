//`ifndef __DATAMEM_V__
//`define __DATAMEM_V__

`define DMEM_SIZE 256 // maximum 131072
`define DMEM_BITS 22

module dataMem(reset, address, dataIn, writeEnable, dataOut);
	input reset;
	input [`DMEM_BITS-1:0] address; // 2MB
	input [31:0] dataIn;
	input writeEnable;
	output [31:0] dataOut;

	reg [31:0] memory[0:`DMEM_SIZE-1];
	integer i;

	always @ (*) begin
		if (!reset) begin
			for (i = 0; i < `DMEM_SIZE; i = i + 1)
				memory[i] <= 0;
		end
		else begin
			if (writeEnable) begin
				memory[address] <= dataIn;
			end
		end
	end

	assign dataOut = memory[address];

endmodule // dataMem

//`endif /*__DATAMEM_V__*/