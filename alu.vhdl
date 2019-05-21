`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:57:18 01/16/2019 
// Design Name: 
// Module Name:    alu 
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
module alu (input [31:0] a, b,
				input [2:0] f,
				output reg [31:0] y,
				output zero);
							
	always @ (*)
		case (f)
			3'b000: y <= a & b; //a AND b
			3'b001: y <= a | b; //a OR b
			3'b010: y <= a + b; //a + b
			3'b011: y <= 32'bx; //Žg‚í‚È‚¢
			3'b100: y <= a & ~b; //a AND notb
			3'b101: y <= a | ~b; //a OR notb
			3'b110: y <= a - b; //a - b
			3'b111: y <= a < b ? 1 : 0; //MIPS–½—ßslt
		endcase
		
	assign zero = (y == 32'b0);

endmodule
