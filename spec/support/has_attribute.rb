module SpecHelper
  module HasAttribute
    def it_has_attribute(attribute)
      it_has_getter(attribute)
      it_has_setter(attribute)
    end

    def it_has_setter(attribute)
      it "has setter for #{attribute}" do
        subject.respond_to?("#{attribute}=").must_equal true
      end
    end

    def it_has_getter(attribute)
      it "has getter #{attribute}" do
        subject.respond_to?(attribute).must_equal true
      end
    end
  end
end
