def expect_attribute_value(attribute, value)
  expect(subject.send(attribute)).to eq(value)
end

