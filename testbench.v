
module PWM_Test;

	// Inputs
	reg clk;

	// Outputs
	wire [7:0] pwm;

	// Instantiate the Unit Under Test (UUT)
	PWM_Gen uut (
    .clk(clk), 
    .pwm(pwm)     
);


	
	
initial
begin
forever #1clk=~clk;
end
	initial begin
		// Initialize Inputs
		clk = 0;
      #10;
				#5000000 $finish;
	end

		

