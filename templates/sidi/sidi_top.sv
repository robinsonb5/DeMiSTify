//
//
// https://github.com/mist-devel
// 
// Copyright (c) 2015 Till Harbaum <till@harbaum.org> 
// 
// This source file is free software: you can redistribute it and/or modify 
// it under the terms of the GNU General Public License as published 
// by the Free Software Foundation, either version 3 of the License, or 
// (at your option) any later version. 
// 
// This source file is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of 
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the 
// GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public License 
// along with this program.  If not, see <http://www.gnu.org/licenses/>. 
//

module sidi_top (
   input  	 CLOCK_27,

	// LED outputs
   output 	 LED,
	
   // SDRAM interface
   inout  [15:0] SDRAM_DQ, // SDRAM Data bus 16 Bits
   output [12:0] SDRAM_A, // SDRAM Address bus 13 Bits
   output 	 SDRAM_DQML, // SDRAM Low-byte Data Mask
   output 	 SDRAM_DQMH, // SDRAM High-byte Data Mask
   output 	 SDRAM_nWE, // SDRAM Write Enable
   output 	 SDRAM_nCAS, // SDRAM Column Address Strobe
   output 	 SDRAM_nRAS, // SDRAM Row Address Strobe
   output 	 SDRAM_nCS, // SDRAM Chip Select
   output [1:0]  SDRAM_BA, // SDRAM Bank Address
   output 	 SDRAM_CLK, // SDRAM Clock
   output 	 SDRAM_CKE, // SDRAM Clock Enable
  
   // SPI interface to arm io controller
   inout 	 SPI_DO,
   input 	 SPI_DI,
   input 	 SPI_SCK,
   input 	 SPI_SS2,
   input 	 SPI_SS3,
   input 	 SPI_SS4,
   input 	 CONF_DATA0, 

   output 	 AUDIO_L, // sigma-delta DAC output left
   output 	 AUDIO_R, // sigma-delta DAC output right

   output 	 VGA_HS,
   output 	 VGA_VS,
   output [5:0]  VGA_R,
   output [5:0]  VGA_G,
   output [5:0]  VGA_B,

   input     UART_RXD,
   output    UART_TXD
);

//wire  [7:0] r_aux, g_aux, b_aux;	

guest_top guest
(
   .CLOCK_27 	(CLOCK_27),
 //.RESET_N     (1'b1),
   .LED      	(LED),

   .SDRAM_DQ	(SDRAM_DQ),	
   .SDRAM_A		(SDRAM_A),
   .SDRAM_DQML	(SDRAM_DQML),
   .SDRAM_DQMH	(SDRAM_DQMH),
   .SDRAM_nWE	(SDRAM_nWE),
   .SDRAM_nCAS	(SDRAM_nCAS),
   .SDRAM_nRAS	(SDRAM_nRAS),
   .SDRAM_nCS	(SDRAM_nCS),
   .SDRAM_BA	(SDRAM_BA),
   .SDRAM_CLK	(SDRAM_CLK),
   .SDRAM_CKE	(SDRAM_CKE),
                      
   .SPI_DO		(SPI_DO),
   .SPI_DI		(SPI_DI),
   .SPI_SCK		(SPI_SCK),
   .SPI_SS2		(SPI_SS2),
   .SPI_SS3		(SPI_SS3),
   .SPI_SS4		(SPI_SS4),
   .CONF_DATA0	(CONF_DATA0),

   .AUDIO_L  	(AUDIO_L),
   .AUDIO_R  	(AUDIO_R),

   .VGA_HS		(VGA_HS),
   .VGA_VS		(VGA_VS),
   .VGA_R		(VGA_R),
   .VGA_G		(VGA_G),
   .VGA_B		(VGA_B),

   .UART_RX		(UART_RXD),	
   .UART_TX		(UART_TXD)	

);

//assign VGA_R = r_aux[7:2];
//assign VGA_G = g_aux[7:2];
//assign VGA_B = b_aux[7:2];

endmodule
