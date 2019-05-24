module OrigenCoreSupport
  class NVM
    include Origen::Model

    attr_accessor :attribute_x
    attr_accessor :blocks

    def initialize(options = {})
      @blocks = [Block.new(0, self), Block.new(1, self), Block.new(2, self)]
    end

    def find_block_by_id(id)
      @blocks.find { |block| block.id == id }
    end

    def reg_owner_alias
      %w(flash fmu)
    end

    def add_multi_split_reg
      reg :multi_group, 0x0070, size: 16 do |reg|
        reg.bits 15,   :mike,  reset: 1
        reg.bits 14,   :bill,  reset: 0
        reg.bits 13,   :robert,  reset: 1
        reg.bits 12,   :james,  reset: 0
        reg.bits 11,   :james, reset: 1
        reg.bits 10,   :james, reset: 0
        reg.bits 9,    :paul,  reset: 1
        reg.bits 8,    :peter,  reset: 0
        reg.bits 7,    :mike,  reset: 1
        reg.bits 6,    :mike,  reset: 0
        reg.bits 5,    :paul,  reset: 1
        reg.bits 4,    :paul,  reset: 0
        reg.bits 3,    :mike, reset: 1
        reg.bits 2,    :robert, reset: 0
        reg.bits 1,    :bill,  reset: 0
        reg.bits 0,    :ian,  reset: 1
      end
    end

    def add_proth_reg
      reg :proth, 0x0024, size: 32 do |reg|
        reg.bits 31..24,   :fprot7,  reset: 0xFF
        reg.bits 23..16,   :fprot6,  reset: 0xEE
        reg.bits 15..8,    :fprot5,  reset: 0xDD
        reg.bits 7..0,     :fprot4,  reset: 0x11
      end
    end

    def add_non_byte_aligned_regs
      add_reg :non_aligned_small, 0x1000, size: 4
      add_reg :non_aligned_big, 0x1010, size: 10
      add_reg :non_aligned_small_msb0, 0x2000, size: 4, bit_order: :msb0
      add_reg :non_aligned_big_msb0, 0x2010, size: 10, bit_order: :msb0
    end

    def add_msb0_regs
      reg :SIUL2_MIDR1, 0x4, bit_order: :msb0  do |reg|
        bit 0..15,  :PARTNUM, res: 0b0101011101110111
        bit 16,     :ED
        bit 17..21, :PKG
        bit 24..27, :MAJOR_MASK
        bit 28..31, :MINOR_MASK
      end
    end
  end
end
