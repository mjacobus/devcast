def is_published(input, expected_boolean)

  it "casts published input #{input} to #{expected_boolean}" do
    object = described_class.new(published: input)
    expect(object.published?).to equal(expected_boolean)
  end

end
