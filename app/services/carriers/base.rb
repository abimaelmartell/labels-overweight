module Carriers
  class Base
    attr_accessor :label

    def initialize(label)
      @label = label
    end
  end
end
