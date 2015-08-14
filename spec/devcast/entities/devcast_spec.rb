require 'spec_helper'

RSpec.describe Devcast do
  let(:attributes) { SpecHelper::Entities::Devcast.new.valid_attributes }

  it_has_attribute(:id)
  it_has_attribute(:title)
  it_has_attribute(:url)
  it_has_attribute(:published)
  it_has_attribute(:description)
  it_has_attribute(:created_at)
  it_has_attribute(:updated_at)

  describe "published" do
    it 'has default published value of false' do
      expect(subject.published).to be false
    end

    specify "#published can be changed on the constructor" do
      subject = Devcast.new(published: true)
      expect(subject.published).to be true
    end

    is_published('1', true)
    is_published(1, true)
    is_published(true, true)
    is_published('0', false)
    is_published(0, false)
    is_published(false, false)
  end

  describe "initializer" do
    subject do
      described_class.new(attributes)
    end

    it "initialize all given values" do
      attributes.each do |attribute, value|
        expect_attribute_value(attribute, value)
      end
    end
  end
end
