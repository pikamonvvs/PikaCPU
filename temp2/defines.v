`ifndef __DEFINES_V__
`define __DEFINES_V__

`define OP_ALU		0b0xxxxx
`define OP_CMP		0b100000
`define OP_JMP		0b100010
`define OP_JCC		0b100011
`define OP_LD		0b100100
`define OP_STR		0b100101
`define OP_CALL		0b100110
`define OP_RET		0b100111

`define ALUOP_ADD	0b00000
`define ALUOP_SUB	0b00001
`define ALUOP_MUL	0b00010
`define ALUOP_DIV	0b00011
`define ALUOP_AND	0b00100
`define ALUOP_OR 	0b00101
`define ALUOP_NOT	0b00110
`define ALUOP_XOR	0b00111
`define ALUOP_SHL	0b01000
`define ALUOP_SHR	0b01001
`define ALUOP_ASR	0b01010
`define ALUOP_MOV	0b01100
`define ALUOP_MOVL	0b01110
`define ALUOP_MOVH	0b01111

`endif __DEFINES_V__
