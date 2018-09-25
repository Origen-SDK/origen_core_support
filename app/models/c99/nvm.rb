module C99
  class NVM
    include Origen::Model

    attr_accessor :blocks

    def initialize
      reg :mclkdiv, 0x03, size: 16 do |reg|
        reg.bit 15, :osch
        reg.bit 14, :asel
        reg.bit 13, :failctl
        reg.bit 12, :parsel
        reg.bit 11, :eccen
        reg.bit 10..8, :cmdloc, res: 0b001
        reg.bit 7..0, :clkdiv, res: 0x18
      end

      reg :data, 0x4, size: 16 do |reg|
        reg.bits 15..0, :d
      end

      @blocks = [Block.new(0, self), Block.new(1, self), Block.new(2, self)]
    end

    def find_block_by_id(id)
      @blocks.find { |block| block.id == id }
    end

    def override_method
      :original
    end

    def reg_owner_alias
      %w(flash fmu)
    end
  end
end
