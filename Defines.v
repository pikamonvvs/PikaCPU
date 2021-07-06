`ifndef __DEFINES_V__
`define __DEFINES_V__

`define REGFILE_SIZE	16
`define DATAMEM_SIZE	128
`define INSTRMEM_SIZE	64

// Opcodes
`define ADDrr		6'b000000
`define SUBrr		6'b000010
`define MULrr		6'b000100
`define DIVrr		6'b000110
`define ADDri		6'b000001
`define SUBri		6'b000011
`define MULri		6'b000101
`define DIVri		6'b000111
`define ANDrr		6'b001000
`define ORrr 		6'b001010
`define XORrr		6'b001100
`define ANDri		6'b001001
`define ORri 		6'b001011
`define XORri		6'b001101
`define SHLrr		6'b010000
`define SHRrr		6'b010010
`define ASRrr		6'b010100
`define SHLri		6'b010001
`define SHRri		6'b010011
`define ASRri		6'b010101
`define MOVrr		6'b011000
`define MOVriLO16	6'b011101
`define MOVriHI16	6'b011111
`define CMP			6'b100000
`define JMP			6'b100010
`define Jcc			6'b100011
`define LD 			6'b100100
`define STR			6'b100101
`define CALL		6'b100110
`define RET			6'b100111

// ALU Opcodes
`define ALUOP_ADD	4'b0000
`define ALUOP_SUB	4'b0001
`define ALUOP_MUL	4'b0010
`define ALUOP_DIV	4'b0011
`define ALUOP_AND	4'b0100
`define ALUOP_OR 	4'b0101
`define ALUOP_XOR	4'b0110
`define ALUOP_SHL	4'b1000
`define ALUOP_SHR	4'b1001
`define ALUOP_ASR	4'b1010
`define ALUOP_MOV	4'b1100
`define ALUOP_MOVL	4'b1110
`define ALUOP_MOVH	4'b1111

`endif /*__DEFINES_V__*/