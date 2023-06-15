`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.12.2019 20:08:11
// Design Name: 
// Module Name: partb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module partb( input logic reset, save, enabled, clk,[1:0] whichnum,[1:0]digits, [3:0] values,
output logic dp,[3:0] an,[6:0] segment,[15:0] leds,[63:0] forc);

logic [15:0] val1,val2,val3,val4,joker;
part1 fnc(enabled, clk,digits,values,dp,an,segment,joker);


always @ (posedge clk)
begin
 if(save)
begin
case(whichnum)
2'b00: val1 = joker;
2'b01: val2 = joker;
2'b10: val3 = joker;
2'b11: val4 = joker;
endcase
end
end

always @ (posedge clk)
begin
if(!save)
begin
if(reset)
leds = 0;
else
begin
case(whichnum)
2'b00: leds = val1;
2'b01: leds = val2;
2'b10: leds = val3;
2'b11: leds = val4;
endcase
end
end
end

always @(posedge clk)
begin
if(reset)
forc = 0;
else
forc = {val1,val2,val3,val4};
end

endmodule
