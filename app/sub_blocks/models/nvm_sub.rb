module OrigenCoreSupport
  class NVMSub < NVM
    def redefine_data_reg
      add_reg :data,      0x40,   16,  d: { pos: 0, bits: 16 }
    end

    # Tests that the block format for defining registers works
    def add_reg_with_block_format
      # ** Data Register 3 **
      # This is dreg
      add_reg :dreg, 0x1000, size: 16 do |reg|
        # This is dreg bit 15
        reg.bit 15,    :bit15, reset: 1
        # **Bit 14** - This does something cool
        #
        # 0 | Coolness is disabled
        # 1 | Coolness is enabled
        reg.bits 14,    :bit14
        # This is dreg bit upper
        reg.bits 13..8, :upper
        # This is dreg bit lower
        # This is dreg bit lower line 2
        reg.bit 7..0,  :lower, writable: false, reset: 0x55
      end

      # This is dreg2
      reg :dreg2, 0x1000, size: 16 do
        # This is dreg2 bit 15
        bit 15,    :bit15, reset: 1
        # This is dreg2 bit upper
        bits 14..8, :upper
        # This is dreg2 bit lower
        # This is dreg2 bit lower line 2
        bit 7..0,  :lower, writable: false, reset: 0x55
      end

      # Finally a test that descriptions can be supplied via the API
      reg :dreg3, 0x1000, size: 16, description: "** Data Register 3 **\nThis is dreg3" do
        bit 15,    :bit15, reset: 1, description: 'This is dreg3 bit 15'
        bit 14, :bit14, description: "**Bit 14** - This does something cool\n\n0 | Coolness is disabled\n1 | Coolness is enabled"
        bits 13..8, :upper, description: 'This is dreg3 bit upper'
        bit 7..0,  :lower, writable: false, reset: 0x55, description: "This is dreg3 bit lower\nThis is dreg3 bit lower line 2"
      end

      reg :dreg4, 0x1000, size: 8, description: "** Data Register 4 **\nThis is dreg4" do
        bit 7..0, :busy, reset: 0x55, description: "**Busy Bits** - These do something super cool\n\n0 | Job0\n1 | Job1\n10 | Job2\n11 | Job3\n100 | Job4\n101 | Job5\n110 | Job6\n111 | Job7\n1000 | Job8\n1001 | Job9\n1010 | Job10\n1011 | Job11\n1100 | Job12\n1101 | Job13\n1110 | Job14\n1111 | Job15\n10000 | Job16\n10001 | Job17\n10010 | Job18"
      end
    end
  end
end
