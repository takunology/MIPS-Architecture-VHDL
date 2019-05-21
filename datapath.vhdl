`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:07:02 02/04/2019 
// Design Name: 
// Module Name:    datapath 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module datapath(input clk, reset,
					 input memtoreg, pcsrc, alusrc, regdst, regwrite,
					 input [2:0] alucontrol,
					 input [31:0] instr, readdata,
					 output zero,
					 output [31:0] pc, aluout, writedata);

	wire [4:0] writereg;
	wire [31:0] pcnext, pcplus4, pcbranch, signimm, signimm4, srca, srcb, result;

	mux2 #(32) pcmux (pcplus4, pcbranch, pcsrc, pcnext);
	flopr pcreg (clk, reset, pcnext, pc);
	adder pcadd1 (pc, 32'd4, pcplus4);
	// 命令メモリ【プロセッサの外部にあるのでここでは記述しない】
	regfile rf (clk, regwrite, instr[25:21], instr[20:16], writereg,
					result, srca, writedata);
	mux2 #(5) wrmux (instr[20:16], instr[15:11], regdst, writereg);
	signext se (instr[15:0], signimm);
	mux2 #(32) srcbmux (writedata, signimm, alusrc, srcb);
	sl2 imm4 (signimm, signimm4);
	adder pcadd2 (signimm4, pcplus4, pcbranch);
	alu alu (srca, srcb, alucontrol, aluout, zero);
	// データメモリ【プロセッサの外部にあるのでここでは記述しない】
	mux2 #(32) resmux (aluout, readdata, memtoreg, result);

endmodule