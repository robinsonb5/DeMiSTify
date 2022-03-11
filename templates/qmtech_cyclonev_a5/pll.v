// Wrapper to make the Cyclone V PLL look like previous generations' PLLs.

module pll (
		input  wire  inclk0,   //  refclk.clk
		output wire  c0, // outclk0.clk
		output wire  c1, // outclk1.clk
		output wire  c2, // outclk2.clk
		output wire  locked    //  locked.export
	);

	pll_cv_0002 pll_cv_inst (
		.refclk   (inclk0),   //  refclk.clk
		.rst      (1'b0),      //   reset.reset
		.outclk_0 (c0), // outclk0.clk
		.outclk_1 (c1), // outclk1.clk
		.outclk_2 (c2), // outclk2.clk
		.locked   (locked)    //  locked.export
	);
	
endmodule
