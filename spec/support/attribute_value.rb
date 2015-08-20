module SpecHelper
  module AttributeValue
    def expect_attribute_value(attribute, value)
      subject.send(attribute).must_equal value
    end
  end
end
