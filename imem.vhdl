`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:46:35 01/16/2019 
// Design Name: 
// Module Name:    imem 
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
module imem (input [31:0] a,
				 output [31:0] rd);

	reg [31:0] RAM[17:0];

	initial begin
		$readmemh("memfile.dat",RAM);
	end

	assign rd = RAM[a[31:2]];

endmodule
