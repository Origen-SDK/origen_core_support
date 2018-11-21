add_pin :reset,   reset: :drive_hi,  name: 'nvm_reset'
add_pin :clk,     reset: :drive_hi,  name: 'nvm_clk'
add_pin :clk_mux, reset: :drive_hi,  name: 'nvm_clk_mux'
add_pins :porta,   reset: :drive_lo,  size: 8
add_pins :portb,   reset: :drive_lo,  size: 8, endian: :little
add_pin :invoke,  reset: :drive_lo,  name: 'nvm_invoke'
add_pin :done,    reset: :expect_hi, name: 'nvm_done'
add_pin :fail,    reset: :expect_lo, name: 'nvm_fail'
add_pin :alvtst,  reset: :dont_care, name: 'nvm_alvtst'
add_pin :ahvtst,  reset: :dont_care, name: 'nvm_ahvtst'
add_pin :dtst,    reset: :dont_care, name: 'nvm_dtst'

add_pin :tclk, reset: :drive_lo
add_pin :trst, reset: :drive_hi

add_pin_alias :extal,     :clk
add_pin_alias :extal_mux, :clk_mux
add_pin_alias :tms,       :done
add_pin_alias :tdo,       :fail
add_pin_alias :tdi,       :invoke
add_pin_alias :resetb,    :ahvtst

add_pin_alias :pa5, :porta, pin: 5
add_pin_alias :pa_lower, :porta, pins: [3..0]
add_pin_alias :pa_upper, :porta, pins: [7, 6, 5, 4]
add_pin_alias :porta_alias, :porta
