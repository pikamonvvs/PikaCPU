`ifndef __CONDCHECKER_V__
`define __CONDCHECKER_V__

`include "defines.v"

module condChecker(cpsr, cond, is_jmp_op, taken);
	input [3:0] cpsr;
	input [3:0] cond;
	input is_jmp_op;
	output taken;

	wire n, z, c, v;

	always @ (*) begin
		case (cond)
			`COND_JMP: taken <= 1;
			`COND_JEQ: taken <= (z == 1);
			`COND_JGE: taken <= (n == v);
			`COND_JGT: taken <= (z == 0 && n == v);
			`COND_JLE: taken <= (z == 1 || n != v);
			`COND_JLT: taken <= (n != v);
			`COND_JNE: taken <= (z == 0);
			default: taken <= 0;
		endcase
	end

	assign n = cpsr[3];
	assign z = cpsr[2];
	assign c = cpsr[1];
	assign v = cpsr[0];

endmodule // condChecker

`endif /*__CONDCHECKER_V__*/