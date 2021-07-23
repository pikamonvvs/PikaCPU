`ifndef __WRITEBACK_V__
`define __WRITEBACK_V__

module writeback();
	input [3:0] rd_num_passthrough;
	input [31:0] md_passthrough; // ld, str
	input [31:0] result; // str
	input [31:0] rd_val_passthrough; // str

	input is_alu_op_passthrough;
	input is_cmp_op_passthrough;
	input is_jmp_op_passthrough;
	input is_ld_op_passthrough;
	input is_str_op_passthrough;

	output [3:0] reg_num; // TODO: data memory size
	output reg_write_en; // TODO: it is thought not needed
	output [31:0] reg_value;

// 이거 하고 있었음.
//	output [31:0] mem_addr; // TODO: data memory size
//	output mem_write_en;
//	output [31:0] mem_val_out;
//	input [31:0] mem_val_in;
//	output [31:0] mem_val_passthrough; // to writeback

	// compare
	always @ (*) begin
		if (is_cmp_op_passthrough) begin
			// write nzcv to cpsr
		end
		if (is_ld_op_passthrough) begin
			// write 
			reg_num <= rd_num_passthrough;
			reg_value <= rd_val_passthrough;
		end
	end
	// branch
	
	// store
	
	// alu // TODO: is it same as store?
	

endmodule // writeback

`endif /* __WRITEBACK_V__ */