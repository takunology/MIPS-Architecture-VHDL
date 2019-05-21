`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:12:14 02/04/2019 
// Design Name: 
// Module Name:    top 
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
module top (input clk, reset,
				output [31:0] writedata, aluout, pc, instr,
				output memwrite);

	wire [31:0] readdata;
	// プロセッサとメモリの実体化
	mips mips (clk, reset, instr, readdata, memwrite, pc, aluout, writedata);
	imem imem (pc, instr);
	dmem dmem (clk, memwrite, aluout, writedata, readdata);

endmodule
