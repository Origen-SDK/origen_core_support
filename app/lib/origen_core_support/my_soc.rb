module OrigenCoreSupport
  class MySOC
    include Origen::TopLevel

    def initialize(options = {})
      sub_block :my_sub_block_1, class_name: 'MySubBlock'
      sub_block :my_sub_block_2, class_name: 'MySubBlock', load_model: 'sub_block_test/block2'
    end
  end
end
