
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:51:40 11/12/2021 
// Design Name: 
// Module Name:    PWM_Gen 
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

				
					
module PWM_Gen(input clk,output [0:7] pwm );				
reg [2:0] i = 0 ;
reg [7:0] counter = 0;

integer duty_cycle[0:7];

reg ShiftBuff[0:7]; 

initial
begin
//assigning duty ratios to different waveforms of (output [7:0] pwm);
	duty_cycle[0] = 25;
    duty_cycle[1] = 40;
	duty_cycle[2] = 50;
	duty_cycle[3] = 65;
	duty_cycle[4]= 70;
   	duty_cycle[5] = 80;
	duty_cycle[6] = 90;
	duty_cycle[7] = 15;
end

initial
begin
	ShiftBuff[0] = 0;
	ShiftBuff[1] = 0;
	ShiftBuff[2] = 0;
	ShiftBuff[3] = 0;
	ShiftBuff[4] = 0;
	ShiftBuff[5] = 0;
	ShiftBuff[6] = 0;
	ShiftBuff[7] = 0;
end


reg latch = 0;
reg reset = 0;
reg S_in = 0;


always @(posedge clk) 
begin

	if(counter<100) counter <= counter + 1;
	else counter <= 0;	
	
end

//assign pwm = (counter<20)?1:0 ; 
// executing assignment of pwm waveforms through shift register;

ShiftReg Shft (clk,latch,reset,S_in,pwm);
//s_in is d_push in shiftregister module
always @(negedge clk)
begin
	if(counter<duty_cycle[i])
	S_in=1;
	else
	S_in=0;
	
	i = i+1 ; 
	
	if(i==0)
	//when i>=8;  -> as i is 3 bit register;
		begin
		//freq of latch is 1/8th of clock pulses;
		latch=1;
		#1 latch=0;
		end	
end

initial 
begin
 $display("Duty Values: %0d, %0d, %0d, %0d, %0d, %0d, %0d, %0d",
          duty_cycle[7], duty_cycle[0],duty_cycle[1],duty_cycle[2],
         duty_cycle[3], duty_cycle[4],duty_cycle[5], duty_cycle[6]);
end





endmodule
