# PWM_shiftregister
Shift Register PWM Module:
Verilog module for a PWM generator using shift registers. This project demonstrates a scalable solution for generating PWM waveforms.
The `PWM_Gen` module generates PWM (Pulse Width Modulation) signals based on the specified duty cycle values.
ShiftReg Module:
The ShiftReg module is a simple 8-bit shift register implemented in the PWM_Gen module. It has inputs for clock (clk), latch (latch), reset (reset), and data input (d_push). The data output (D_Opwm) represents the content of the shift register.
