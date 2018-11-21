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
