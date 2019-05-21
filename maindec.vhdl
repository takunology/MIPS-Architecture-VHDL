`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:00:36 02/04/2019 
// Design Name: 
// Module Name:    maindec 
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
module maindec (input [5:0] op,
					 output memtoreg, memwrite, branch, alusrc, regdst, regwrite,
					 output [1:0] aluop);

	reg [7:0] controls;

	assign {regwrite, regdst, alusrc, branch, memwrite, memtoreg, aluop} = controls;
	
	always @ (*)
		case(op)
			6'b000000: controls <= 8'b11000010; // RŒ`Ž®
			6'b100011: controls <= 8'b10100100; // lw
			6'b101011: controls <= 8'b00101000; // sw
			6'b000100: controls <= 8'b00010001; // beq
			6'b001000: controls <= 8'b10100000; // addi
			default: controls <= 8'bxxxxxxxx; // ???
		endcase

endmodule
