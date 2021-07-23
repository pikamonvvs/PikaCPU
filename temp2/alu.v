`ifndef __ALU_V__
`define __ALU_V__

`include "defines.v"

module alu(val1, val2, aluop, is_alu_op, result);
	input [31:0] val1;
	input [31:0] val2;
	input [4:0] aluop;
	input is_alu_op;
	output [31:0] result;

	always @ (*) begin
		if (is_alu_op) begin
			case (aluop)
				`ALUOP_ADD:  result <= val1 + val2;
				`ALUOP_SUB:  result <= val1 - val2;
				`ALUOP_MUL:  result <= val1 * val2;
				`ALUOP_DIV:  result <= val1 / val2;

				`ALUOP_AND:  result <= val1 & val2;
				`ALUOP_OR :  result <= val1 | val2;
				`ALUOP_NOT:  result <= !val2; // TODO: rr ri
				`ALUOP_XOR:  result <= val1 ^ val2;

				`ALUOP_SHL:  result <= val1 << val2;
				`ALUOP_SHR:  result <= val1 >> val2;
				`ALUOP_ASR:  result <= val1 >> val2; // TODO: algorithm

				`ALUOP_MOV:  result <= val1;
				`ALUOP_MOVL: result <= (val2 & 0x0000ffff);
				`ALUOP_MOVH: result <= (val2 & 0xffff0000); // TODO: scenario
				default; result <= 0;
			endcase
		end
		else begin
			result <= 0;
		end
	end

endmodule // alu

`endif /*__ALU_V__*/