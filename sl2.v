`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:31:09 01/16/2019 
// Design Name: 
// Module Name:    sl2 
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
module sl2 (input [31:0] a,
				output [31:0] y);

	assign y = {a[29:0], 2'b00};

endmodule
