module tb_edgedetector;

	logic clk;
	logic rst;
	logic levelin;
	logic outpulse;

	initial begin
		clk = 1'b0;
		rst = 1'b0;
		levelin = 1'b0;

		#100 rst = 1'b1 ;
		#20 levelin = 1'b1;
	end

	always 
		#10 clk = !clk;

	always @(negedge clk)
		levelin = $random;

	edgedetector u_dut (
					  .*
					  );

	initial begin
		$monitor($time,"CLK = %b RST = %b levelin = %b outpulse = %b",clk,rst,levelin,outpulse);
		#1000 $finish;
		$stop;
	end	

endmodule
