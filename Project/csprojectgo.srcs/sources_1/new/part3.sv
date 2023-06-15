`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.12.2019 02:48:00
// Design Name: 
// Module Name: part3
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

// mat

module part3(input logic reset,restart,save, enabled, clk,butonL,butonN,butonS,butonR,[1:0] whichnum,digits, [3:0] values,
output logic dp,shcp, stcp, mr, oe, ds ,[3:0] an,[6:0] segment,[15:0] leds,[7:0] rowsOut
);

logic [63:0] nums;
partb func(reset,save, enabled, clk,whichnum,digits, values, dp,an,segment,leds,nums);
logic [7:0][7:0] matrix;
int count = 0;
logic buttondb = 0;
converter fnc(clk, matrix,rowsOut,shcp, stcp, mr, oe, ds );


logic [7:0][7:0][1:0] buttonNum = {2'b01,2'b00,2'b01,2'b00,2'b10,2'b01,2'b10,2'b01
                              ,2'b11,2'b10,2'b11,2'b10,2'b11,2'b00,2'b11,2'b00
                              ,2'b01,2'b00,2'b01,2'b00,2'b10,2'b01,2'b10,2'b01
                              ,2'b11,2'b10,2'b11,2'b10,2'b11,2'b00,2'b11,2'b00
                              ,2'b10,2'b11,2'b10,2'b11,2'b01,2'b00,2'b01,2'b00
                              ,2'b01,2'b00,2'b01,2'b00,2'b11,2'b10,2'b11,2'b10
                              ,2'b10,2'b11,2'b10,2'b11,2'b01,2'b00,2'b01,2'b00
                              ,2'b01,2'b00,2'b01,2'b00,2'b11,2'b10,2'b11,2'b10};




always @(posedge clk)
begin
    if(reset)
    begin
        matrix <=0;
    end
    if(restart && !buttondb)
    begin
    buttondb = 1;
        for(int i = 0; i <8;i++)
        begin
            for(int j = 0; j<8;j++)
            begin
            matrix[i][j] <= nums[count];
            count++;
            end 
        end
     end
     else if(!restart)
     buttondb = 0;   
    if(butonL && !buttondb)
    begin
        buttondb = 1;
        for(int i = 0; i <8;i++)
        begin
            for(int j = 0; j<8 ; j++)
            begin
                if(buttonNum[i][j] == 2'b00)
                begin
                    if(( matrix[(i+7)%8][j] && matrix[(i+1)%8][j] && !(matrix[i][(j+1)%8]) &&!(matrix[i][(j+7)%8]))|| (matrix[(i+7)%8][j] && !(matrix[(i+1)%8][j]) && matrix[i][(j+1)%8])|| !(matrix[(i+7)%8][j])&& !(matrix[i][(j+1)%8]) &&matrix[i][(j+7)%8]|| !(matrix[(i+7)%8][j]) && (matrix[i][(j+1)%8]) )
                        matrix[i][j] <= 1;
                    else
                        matrix[i][j] <=0;
                end
            end
        end
    end
    else if(!butonL)
    buttondb = 0;
    
    if(butonN && !buttondb)
    begin
    buttondb = 1;
        for(int i = 0; i <8;i++)
        begin
            for(int j = 0; j<8 ; j++)
            begin
                if(buttonNum[i][j] == 2'b01)
                begin
                    if(( matrix[(i+7)%8][j] && matrix[(i+1)%8][j] && !(matrix[i][(j+1)%8]) &&!(matrix[i][(j+7)%8]))|| (matrix[(i+7)%8][j] && !(matrix[(i+1)%8][j]) && matrix[i][(j+1)%8])|| !(matrix[(i+7)%8][j])&& !(matrix[i][(j+1)%8]) &&matrix[i][(j+7)%8]|| !(matrix[(i+7)%8][j]) && (matrix[i][(j+1)%8]) )
                        matrix[i][j] <= 1;
                    else
                        matrix[i][j] <=0;
                end
            end
        end
    end
    else if(!butonN)
    buttondb = 0;
    
    if(butonR && !buttondb)
    begin
    buttondb = 1;
        for(int i = 0; i <8;i++)
        begin
            for(int j = 0; j<8 ; j++)
            begin
                if(buttonNum[i][j] == 2'b10)
                begin
                    if(( matrix[(i+7)%8][j] && matrix[(i+1)%8][j] && !(matrix[i][(j+1)%8]) &&!(matrix[i][(j+7)%8]))|| (matrix[(i+7)%8][j] && !(matrix[(i+1)%8][j]) && matrix[i][(j+1)%8])|| !(matrix[(i+7)%8][j])&& !(matrix[i][(j+1)%8]) &&matrix[i][(j+7)%8]|| !(matrix[(i+7)%8][j]) && (matrix[i][(j+1)%8]) )
                        matrix[i][j] <= 1;
                    else
                        matrix[i][j] <=0;
                end
            end
        end
    end
    else if(!butonR)
    buttondb = 0;
    
    if(butonS && !buttondb)
    begin
    buttondb = 1;
        for(int i = 0; i <8;i++)
        begin
            for(int j = 0; j<8 ; j++)
            begin
                if(buttonNum[i][j] == 2'b11)
                begin
                    if(( matrix[(i+7)%8][j] && matrix[(i+1)%8][j] && !(matrix[i][(j+1)%8]) &&!(matrix[i][(j+7)%8]))|| (matrix[(i+7)%8][j] && !(matrix[(i+1)%8][j]) && matrix[i][(j+1)%8])|| !(matrix[(i+7)%8][j])&& !(matrix[i][(j+1)%8]) &&matrix[i][(j+7)%8]|| !(matrix[(i+7)%8][j]) && (matrix[i][(j+1)%8]) )
                        matrix[i][j] <= 1;
                    else
                        matrix[i][j] <=0;
                end
            end
        end
    end
    else if(!butonS)
    buttondb = 0;
end


endmodule
