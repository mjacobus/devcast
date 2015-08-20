module SpecHelper
  module IsPublished
    def is_published(input, expected_boolean, described_class)
      it "casts published input #{input} to #{expected_boolean}" do
        object = described_class.new(published: input)
        object.published?.must_equal expected_boolean
      end
    end
  end
end
