//`ifndef __DMEM_V__
//`define __DMEM_V__

`define IMEM_SIZE 1024
`define IMEM_BITS 22

module dmem(reset, address, dataIn, writeEnable, dataOut);
	input reset;
	input [`IMEM_BITS-1:0] address; // 2MB
	input [31:0] dataIn;
	input writeEnable;
	output [31:0] dataOut;

	reg [31:0] memory[0:`IMEM_SIZE-1]; // maximum [0:131071]
	integer i;

	always @ (*) begin
		if (!reset) begin
			for (i = 0; i < `IMEM_SIZE; i = i + 1)
				memory[i] <= 0;
		end
		else begin
			if (writeEnable) begin
				memory[address] <= dataIn;
			end
		end
	end

	assign dataOut = memory[address];

endmodule

//`endif /*__DMEM_V__*/