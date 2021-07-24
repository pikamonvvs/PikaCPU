`ifndef __ALU_V__
`define __ALU_V__

`include "defines.v"

module ALU (
	// output
	output reg [31:0] out,
	// input
	input [31:0]	in1, in2,
	input [4:0]		aluOp,
	);

	always @ (*) begin
		case (aluOp)
			`ALUOP_ADD:  out <= in1 + in2;
			`ALUOP_SUB:  out <= in1 - in2;
			`ALUOP_MUL:  out <= in1 * in2;		//
			`ALUOP_DIV:  out <= in1 / in2;		//
			`ALUOP_AND:  out <= in1 & in2;
			`ALUOP_OR:   out <= in1 | in2;
			`ALUOP_XOR:  out <= in1 ^ in2;
			`ALUOP_SHL:  out <= in1 << in2;		//
			`ALUOP_SHR:  out <= in1 >> in2;		//
			`ALUOP_ASR:  out <= 0;				// TODO:
			`ALUOP_MOV:  out <= in1;			// TODO:
			`ALUOP_MOVL: out <= in1[15:0];		// TODO:
			`ALUOP_MOVH: out <= in1[31:16];		// TODO:

//			`ALUOP_NOR: out <= ~(in1 | in2);
//			`ALUOP_SLA: out <= in1 << in2;
//			`ALUOP_SRA: out <= in1 >> in2;
//			`ALUOP_SLL: out <= in1 <<< in2;
//			`ALUOP_SRL: out <= in1 >>> in2;

			default: out <= 0;
		endcase
	end
endmodule // ALU

`endif /*__ALU_V__*/