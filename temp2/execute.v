`ifndef __EXECUTE_V__
`define __EXECUTE_V__

`include "signExtend.v"
`include "alu.v"
`include "condChecker.v"

module execute();
	input [5:0] opcode;
	input [3:0] rd, rs, rt, cond;
	input [17:0] imm;
	input [21:0] md;

	input is_alu_op;
	input is_cmp_op;
	input is_jmp_op;
	input is_ld_op;
	input is_str_op;
	input is_proc_op;
	input is_src2_imm;

	output [3:0] rs_num;
	output [3:0] rt_num;
	input [31:0] rs_val;
	input [31:0] rt_val;

	output [3:0] rd_num;
	input [31:0] rd_val;

	// alu
	output [31:0] result;
	// compare
	output [31:0] cpsr_out;
	// branch
	input [31:0] cpsr_in; // TODO:
	output taken;

	// pass-through
	output [3:0] rd_num_passthrough; // alu
	output [31:0] rd_val_passthrough; // alu
	output [31:0] md_passthrough;
	output is_alu_op_passthrough;
	output is_cmp_op_passthrough;
	output is_jmp_op_passthrough;
	output is_ld_op_passthrough;
	output is_str_op_passthrough;

	wire [31:0] val1, val2;
	wire [31:0] imm32;
	wire [31:0] md32;

	// TODO: postition of operand differ according to instruction
	assign rs_num = rs;
	assign rt_num = (!is_src2_imm) ? rt_num : 0;
	assign val1 = rs_val;
	assign val2 = (!is_src2_imm) ? rt_val : imm32;

	assign rd_num = rd;		// need to pass for ld
	assign val0 = rd_val;	// need to pass for str

	signExtendImm _signExtendImm(
		.in(imm),
		.out(imm32)
	);

	signExtendMd _signExtendMd( // TODO: necessity
		.in(md),
		.out(md32)
	);

	// alu
	alu _alu(
		.is_alu_op(is_alu_op),
		.val1(val1),
		.val2(val2),
		.aluop(aluop),
		.result(result)
	);

	// compare
	wire [3:0] nzcv;
	comparator _comparator(
		.is_cmp_op(is_cmp_op),
		.val1(val1),
		.val2(val2), // TODO: rr ri
		.nzcv(nzcv)
	);
	assign cpsr_out = { 28'd0, nzcv };

	// branch
	wire taken;
	condChecker _condChecker(
		.is_jmp_op(is_jmp_op),
		.cpsr(cpsr),
		.cond(cond),
		.taken(taken)
	);

	// taken(pcWrite, if is_jmp_op && taken ? pc<-{10'd0, md}), nzcv(cpsr to write, if is_cmp_op ? regWrite <- nzcv), result(regWrite, if is_alu_op ? regaddr[rd] <- result; regWEn <- 1)
	assign rd_num_passthrough = rd;
	assign rd_val_passthrough = val0;
	assign md_passthrough = md32;
	assign is_alu_op_passthrough = is_alu_op;
	assign is_cmp_op_passthrough = is_cmp_op;
	assign is_jmp_op_passthrough = is_jmp_op;
	assign is_ld_op_passthrough = is_ld_op;
	assign is_str_op_passthrough = is_str_op;

	// etc // TODO: ld str call ret

endmodule // execute

`endif /* __EXECUTE_V__ */