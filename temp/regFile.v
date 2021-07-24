//`ifndef __REGFILE_V__
//`define __REGFILE_V__

module regFile(reset, addr, data_out);
	input reset;
	input [3:0] reg_num;
	input write_en;
	input [31:0] reg_data_in;
	output [31:0] reg_data_out;
	// TODO: pc 관련 wire 및 동작 추가해야함.

	reg [31:0] regs[0:16];
	reg pc;

	integer i;

	always @ (*) begin
		if (!reset) begin
			for (i = 0; i < `IMEM_SIZE; i = i + 1)
				regs[i] <= 0;
		end
		else
		begin
			if (write_en)
				regs[num] <= reg_data_in;
		end
	end

	assign reg_data_out = regs[num];

endmodule // regFile

//`endif /*__REGFILE_V__*/