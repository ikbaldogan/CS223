`timescale 1ns / 1ps

module part1( input logic  enabled,clk,[1:0]digits,[3:0] values,output dp,[3:0] an,[6:0] segment,logic [15:0] forb);
logic [3:0] in0,in1,in2,in3;
always@ (posedge clk)
begin
if(enabled)
begin
case(digits)
2'b00: in0 = values;
2'b01: in1 = values;
2'b10: in2 = values;
2'b11: in3 = values;
endcase
end
end
Seven_Segment seg(clk,in0,in1,in2,in3,segment[0],segment[1],segment[2],segment[3],segment[4],segment[5],segment[6],dp,an);

always @(posedge clk)
begin
forb = {in0,in1,in2,in3};
end

endmodule




