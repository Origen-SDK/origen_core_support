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

# **Access Type Test Register**
#
# This register tests the various bit access types, such as write-one-to-clear,
# read-only, etc.
reg :access_types, 0x8, size: 32 do
  # Test read-only access.
  bit 31, :readonly, access: :ro
  # Test read-write access.
  bit 30, :readwrite, access: :rw
  # Test read-clear access, where a read clears the value afterwards.
  bit 29, :readclear, access: :rc
  # Test read-set access, where a read sets the bit afterwards.
  bit 28, :readset, access: :rs
  # Test writable, clear-on-read access, etc...
  bit 27, :writablereadclear, access: :wrc
  bit 26, :writablereadset, access: :wrs
  bit 25, :writeclear, access: :wc
  bit 24, :writeset, access: :ws
  bit 23, :writesetreadclear, access: :wsrc
  bit 22, :writeclearreadset, access: :wcrs
  bit 21, :write1toclear, access: :w1c
  bit 20, :write1toset, access: :w1s
  bit 19, :write1totoggle, access: :w1t
  bit 18, :write0toclear, access: :w0c
  bit 17, :write0toset, access: :w0s
  bit 16, :write0totoggle, access: :w0t
  bit 15, :write1tosetreadclear, access: :w1src
  bit 14, :write1toclearreadset, access: :w1crs
  bit 13, :write0tosetreadclear, access: :w0src
  bit 12, :write0toclearreadset, access: :w0crs
  bit 11, :writeonly, access: :wo
  bit 10, :writeonlyclear, access: :woc
  bit 9, :writeonlyreadzero, access: :worz
  bit 8, :writeonlyset, access: :wos
  bit 7, :writeonce, access: :w1
  bit 6, :writeonlyonce, access: :wo1
  bit 5, :readwritenocheck, access: :dc
  bit 4, :readonlyclearafter, access: :rowz
end
