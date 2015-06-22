module C99
  class NVM

    attr_accessor :blocks

    include Origen::Pins
    include Origen::Registers

    def initialize

      add_reg :mclkdiv,   0x03,  16,  :osch       => { :pos => 15 },
                                      :asel       => { :pos => 14 },
                                      :failctl    => { :pos => 13 },
                                      :parsel     => { :pos => 12 },
                                      :eccen      => { :pos => 11 },
                                      :cmdloc     => { :pos => 8, :bits => 3, :res => 0b001 },
                                      :clkdiv     => { :pos => 0, :bits => 8, :res => 0x18 }

      add_reg :data,      0x4,   16,  :d          => { :pos => 0, :bits => 16 }

      @blocks = [Block.new(0, self), Block.new(1, self), Block.new(2, self)]
    end

    def find_block_by_id(id)
      @blocks.select{ |block| block.id == id }.first
    end

    def override_method
      :original
    end

    def reg_owner_alias
      ["flash", "fmu"]
    end

  end
end
