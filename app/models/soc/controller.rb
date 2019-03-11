module OrigenCoreSupport
  class SOCController
    include Origen::Controller

    def startup(options)
      if options[:add_additional_pins]
        add_pin :late_added_pin, reset: :drive_hi
      else
        unless options[:no_mode_entry]
          # Test that rendering some vectors from a template works...
          if $tester.is_a?(OrigenTesters::J750)
            $tester.render("#{Origen.root}/pattern/j750/_mode_entry.atp.erb", hold_cycles: 5)
          end
        end
      end
      $tester.set_timeset('nvmbist', 40) if $tester.is_vector_based?
    end

    def write_register(reg, options = {})
      reg
    end

    def read_register(reg, options = {})
      reg
    end
  end
end
