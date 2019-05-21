`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:32:07 01/16/2019 
// Design Name: 
// Module Name:    flopr 
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
module flopr (input clk, reset,
				  input [31:0] d,
				  output reg [31:0] q);

always @ (posedge clk or posedge reset)
	if (reset) q <= 0;
	else q <= d;

endmodule
