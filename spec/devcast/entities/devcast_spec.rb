require 'spec_helper'

require 'support/spec_helper/entity/devcast'
require 'support/has_attribute'
require 'support/is_published'
require 'support/attribute_value'

describe Devcast do
  extend SpecHelper::HasAttribute
  extend SpecHelper::IsPublished
  include SpecHelper::AttributeValue

  let(:subject) { Devcast.new }
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
      Devcast.new.published.must_equal false
    end

    specify "#published can be changed on the constructor" do
      subject = Devcast.new(published: true)
      subject.published.must_equal true
    end

    is_published('1', true, Devcast)
    is_published(1, true, Devcast)
    is_published(true, true, Devcast)
    is_published('0', false, Devcast)
    is_published(0, false, Devcast)
    is_published(false, false, Devcast)
  end

  describe "initializer" do
    subject do
      Devcast.new(attributes)
    end

    it "initialize all given values" do
      attributes.each do |attribute, value|
        expect_attribute_value(attribute, value)
      end
    end
  end
end
