module edgedetector (
	input logic clk,
	input logic rst,
	input logic levelin,
	output logic outpulse
	);

	// State declaration
	enum {IDLE,EDGE,PULSE} currState, nextState;

	// Current state registers
	always@(posedge clk or negedge rst) begin:currStateRegs
	if(!rst)
		currState <= IDLE;
	else
		currState <= nextState;
	end

	// next state calculation logic
	always_comb
	begin:NextStateLogic
		unique case (currState)
		IDLE:
			if(!levelin)
				nextState = IDLE;
			else
				nextState = EDGE;
		EDGE:
			if(!levelin)
				nextState = IDLE;
			else
				nextState = PULSE;
		PULSE:
			if(!levelin)
				nextState = IDLE;
			else
				nextState = PULSE;
		default:
			nextState = currState;
		endcase
	end

	
	// Output assignment
	
//	always_ff @(posedge clk) begin:OutputLogic
	always_comb begin:OutputLogic
		outpulse <= 1'b0;
		unique case (currState)
			IDLE: outpulse <= 1'b0;
			EDGE: outpulse <= 1'b1;
			PULSE: outpulse <= 1'b0;
		endcase
	end


endmodule
