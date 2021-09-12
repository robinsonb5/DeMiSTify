module I2C_HDMI_Config (
    //	Host Side
    iCLK,
    iRST_N,
    //	I2C Side
    I2C_SCLK,
    I2C_SDAT,
    HDMI_TX_INT
  );
  //	Host Side
  input				iCLK;
  input				iRST_N;
  //	I2C Side
  output			I2C_SCLK;
  inout				I2C_SDAT;
  input				HDMI_TX_INT;

  //	Internal Registers/Wires
  reg	[15:0]	mI2C_CLK_DIV;
  reg	[23:0]	mI2C_DATA;
  reg				mI2C_CTRL_CLK;
  reg				mI2C_GO;
  wire				mI2C_END;
  wire				mI2C_ACK;
  reg	[15:0]	LUT_DATA;
  reg	[5:0]		LUT_INDEX;
  reg	[3:0]		mSetup_ST;

  //	Clock Setting
  parameter	CLK_Freq	=	50000000;	//	50	MHz
  parameter	I2C_Freq	=	20000;		//	20	KHz
  //	LUT Data Number
  parameter	LUT_SIZE	=	31;

  /////////////////////	I2C Control Clock	////////////////////////
  always@(posedge iCLK or negedge iRST_N)
  begin
    if(!iRST_N)
    begin
      mI2C_CTRL_CLK	<=	0;
      mI2C_CLK_DIV	<=	0;
    end
    else
    begin
      if( mI2C_CLK_DIV	< (CLK_Freq/I2C_Freq) )
        mI2C_CLK_DIV	<=	mI2C_CLK_DIV+ 16'd1;
      else
      begin
        mI2C_CLK_DIV	<=	0;
        mI2C_CTRL_CLK	<=	~mI2C_CTRL_CLK;
      end
    end
  end
  ////////////////////////////////////////////////////////////////////
  I2C_Controller u0	(.CLOCK(mI2C_CTRL_CLK), //  Controller Work Clock
                    .I2C_SCLK(I2C_SCLK),    //  I2C CLOCK
                    .I2C_SDAT(I2C_SDAT),    //  I2C DATA
                    .I2C_DATA(mI2C_DATA),   //  DATA:[SLAVE_ADDR,SUB_ADDR,DATA]
                    .GO(mI2C_GO),           //  GO transfor
                    .END(mI2C_END),         //  END transfor
                    .ACK(mI2C_ACK),         //  ACK
                    .RESET(iRST_N));
  //////////////////////	Config Control	////////////////////////////
  always@(posedge mI2C_CTRL_CLK or negedge iRST_N)
  begin
    if(!iRST_N)
    begin
      LUT_INDEX	<=	0;
      mSetup_ST	<=	0;
      mI2C_GO		<=	0;
    end
    else
    begin
      if(LUT_INDEX<LUT_SIZE)
      begin
        case(mSetup_ST)
          0:
          begin
            mI2C_DATA	<=	{8'h72,LUT_DATA};
            mI2C_GO		<=	1;
            mSetup_ST	<=	1;
          end
          1:
          begin
            if(mI2C_END)
            begin
              if(!mI2C_ACK)
                mSetup_ST	<=	2;
              else
                mSetup_ST	<=	0;
              mI2C_GO		<=	0;
            end
          end
          2:
          begin
            LUT_INDEX	<=	LUT_INDEX+6'd1;
            mSetup_ST	<=	0;
          end
        endcase
      end
      else
      begin
        if(!HDMI_TX_INT)
        begin
          LUT_INDEX <= 0;
        end
        else
          LUT_INDEX <= LUT_INDEX;
      end
    end
  end
  /////////////////////	Config Data LUT	  //////////////////////////
  always
  begin
    case(LUT_INDEX)
        //	Video Config Data
         0:	LUT_DATA      <= 16'h9803;  // Must be set to 0x03 for proper operation
                                        // 20 bit N used with CTS to regenerate the audio clock in the receiver.
         1:	LUT_DATA      <= 16'h0100;  // Set 'N' value at 6144 --idem 
         2:	LUT_DATA      <= 16'h0218;  // Set 'N' value at 6144 --idem
         3:	LUT_DATA      <= 16'h0300;  // Set 'N' value at 6144 --idem
         4:	LUT_DATA      <= 16'h1470;  // Audio. Set Ch count in the channel status to 8.
         5:	LUT_DATA      <= 16'h1520;  // Video Input 24 bit 444 (RGB or YCrCb) with sep. syncs; // Audio 48kHz fs  --idem                                        
         6:	LUT_DATA      <= 16'h1630;  // Video Output format 444, 24-bit input (8 bits x 3)
         7:	LUT_DATA      <= 16'h1846;  // Disable CSC --idem
         8:	LUT_DATA      <= 16'h4080;  // General control packet enable --idem
         9:	LUT_DATA      <= 16'h4110;  // Power down control --idem
        10:	LUT_DATA      <= 16'h49A8;  // Set dither mode - 12-to-10 bit --Must be set to Default Value  --idem
        11:	LUT_DATA      <= 16'h5510;  // Set RGB in AVI infoframe --5510 original   (551C  h,v resolution)
        12:	LUT_DATA      <= 16'h5608;  // Set active format aspect (same as aspect ratio ) --idem
        13:	LUT_DATA      <= 16'h96F6;  // Set interrup --96F6 original   (9620 HPD interrupt clear)

        14:	LUT_DATA      <= 16'h7307;  // Audio. Info frame Ch count to 8 channels
        15:	LUT_DATA      <= 16'h761f;  // Audio. Set speaker allocation for 8 channels
        
        16:	LUT_DATA      <= 16'h9803;  // Must be set to 0x03 for proper operation --idem
        17:	LUT_DATA      <= 16'h9902;  // Must be set to Default Value
        18:	LUT_DATA      <= 16'h9ae0;  // Must be set to 0b1110000   

        19:	LUT_DATA      <= 16'h9c30;  // PLL filter R1 value /  Must be set to Default Value    --idem             
        20:	LUT_DATA      <= 16'h9d60;  // Set clock divide (not divided) --9d61 original --idem   --> should be 9d60
                                        //20:	LUT_DATA      <= 16'h9d64;  // Set clock divide by 2
        21:	LUT_DATA      <= 16'ha2a4;  // Must be set to 0xA4 for proper operation --idem      
        22:	LUT_DATA      <= 16'ha3a4;  // Must be set to 0xA4 for proper operation --idem
        23:	LUT_DATA      <= 16'ha504;  // Must be set to Default Value  
        24:	LUT_DATA      <= 16'hab40;  // Must be set to Default Value
        25:	LUT_DATA      <= 16'haf16;  // Select HDMI mode --idem  
        26:	LUT_DATA      <= 16'hba60;  // No clock delay --idem
        27:	LUT_DATA      <= 16'hd1ff;  // Must be set to Default Value

        28:	LUT_DATA      <= 16'hde10;  // Must be set to Default for proper operation   
        29:	LUT_DATA      <= 16'he460;  // Must be set to Default Value --idem
        30:	LUT_DATA      <= 16'hfa7c;  // Nbr of times to look for good phase --fa7d original  --idem   --> shouuld be 7c
        default:LUT_DATA  <= 16'h9803;  // Must be set to 0x03 for proper operation
    endcase
  end
endmodule
