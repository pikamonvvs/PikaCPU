`ifndef __MEMORY_V__
`define __MEMORY_V__

// ld : mem(md) -> wb(rd_num_passthrough)
// str: exe(rd_val_passthrough) -> mem(md32)

module memory();
	input [3:0] rd_num_passthrough; // ld
	input [31:0] md_passthrough; // ld, str
	input [31:0] result; // str
	input [31:0] rd_val_passthrough; // str

	input is_alu_op_passthrough;
	input is_cmp_op_passthrough;
	input is_jmp_op_passthrough;
	input is_ld_op_passthrough;
	input is_str_op_passthrough;

	output [31:0] mem_addr; // TODO: data memory size
	output mem_write_en;
	output [31:0] mem_val_out;
	input [31:0] mem_val_in;
	output [31:0] mem_val_passthrough; // to writeback

	always @ (*) begin
		if (is_ld_op_passthrough) begin
			mem_addr <= md_passthrough;
			mem_write_en <= 1'b0;
			mem_val_passthrough <= mem_val_in; // TODO: need to test if it is correct
		end
		if (is_str_op_passthrough) begin
			mem_addr <= md_passthrough;
			mem_val_out <= rd_val_passthrough;
			mem_write_en <= 1'b1;
		end
	end

endmodule // memory

`endif /* __MEMORY_V__ */