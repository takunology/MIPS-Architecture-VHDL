`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:13:04 02/04/2019
// Design Name:   top
// Module Name:   Z:/verilog/MIPS/top_test.v
// Project Name:  MIPS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module top_test;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [31:0] writedata;
	wire [31:0] aluout;
	wire [31:0] pc;
	wire [31:0] instr;
	wire memwrite;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.clk(clk), 
		.reset(reset), 
		.writedata(writedata), 
		.aluout(aluout), 
		.pc(pc), 
		.instr(instr), 
		.memwrite(memwrite)
	);

	//���Z�b�g�M��
	initial begin
		reset <= 1; #22; reset <= 0;
	end
	
	//�N���b�N�i5�P�ʎ��Ԃ��ƂɐM����0/1���]�j
	always begin
			clk <= 1; #5; clk <= 0; #5;
	end
	
	// ���ʂ̃`�F�b�N
	always @ (negedge clk) begin
		if (memwrite) begin
			if (aluout === 84 & writedata === 7) begin
				$display ("Simulation succeeded.");
				$stop;
			end
			else if (aluout !== 80) begin
				$display ("Simulation failed.");
				$stop;
			end
		end
	end
      
endmodule

