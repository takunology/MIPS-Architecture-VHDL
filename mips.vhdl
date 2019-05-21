`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:10:28 02/04/2019 
// Design Name: 
// Module Name:    mips 
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
module mips(input clk, reset,
				input [31:0] instr, readdata,
				output memwrite,
				output [31:0] pc, aluout, writedata);

	wire memtoreg, branch, alusrc, regdst, regwrite, zero;
	wire [2:0] alucontrol;

	controller c (instr[31:26], instr[5:0], zero, memtoreg, memwrite,
					  pcsrc, alusrc, regdst, regwrite, alucontrol);
	datapath dp (clk, reset, memtoreg, pcsrc, alusrc, regdst, regwrite,
					 alucontrol, instr, readdata, zero, pc, aluout,
					 writedata);

endmodule
