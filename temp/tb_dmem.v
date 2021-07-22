`timescale 1ns/1ns

`include "dmem.v"

module tb_dmem();
	reg reset;
	reg [21:0] address;
	reg [31:0] dataIn;
	reg writeEnable;
	wire [31:0] dataOut;

	dmem _dmem(reset, address, dataIn, writeEnable, dataOut);

	initial begin
		$dumpfile("test.vcd");
		$dumpvars(-1, _dmem);

		// 2. memory write
		   address = 0;
		#1 writeEnable = 1;
		#1 dataIn = 1;

		// 3. memory read
		#1 address = 0;
		#1 writeEnable = 0;

		// 4. reset
		#1 reset = 1;
		#1 reset = 0;
		#1 $finish;
	end

endmodule
