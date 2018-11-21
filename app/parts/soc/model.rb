module OrigenCoreSupport
  class SOC
    include Origen::TopLevel

    def initialize
      @a = 2
    end

    def has_margin0_bug?
      false
    end

    def base_address(reg, options = {})
      if reg.owned_by?(:nvm)
        0x4000_0000
      else
        0
      end
    end

    def origen_dot_root
      Origen.root
    end

    def origen_dot_root!
      Origen.root!
    end

    def origen_dot_app
      Origen.app
    end

    def origen_dot_app!
      Origen.app!
    end
  end
end
