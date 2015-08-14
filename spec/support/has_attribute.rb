require 'rspec/expectations'

# RSpec::Matchers.define :has_attribute do |attribute|
#   match do |actual|
#     expect(actual).to respond_to(:fiootitle)
#     actual.respond_to(attribute)
#   end
# end

def it_has_attribute(attribute)
  it_has_getter(attribute)
  it_has_setter(attribute)
end

def it_has_setter(attribute)
  it "has setter for #{attribute}" do
    expect(subject).to respond_to("#{attribute}=")
  end
end

def it_has_getter(attribute)
  it "has getter #{attribute}" do
    expect(subject).to respond_to(attribute)
  end
end
