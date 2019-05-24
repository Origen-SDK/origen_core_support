module OrigenCoreSupport
  class MySubBlock
    include Origen::Model

    def initialize(options = {})
      if name == :my_sub_block_1
        load_block 'sub_block_test/block1'
      end
    end
  end
end
