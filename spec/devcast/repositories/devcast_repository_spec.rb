require 'spec_helper'

require 'support/spec_helper/entity/devcast'
require 'support/has_attribute'
require 'support/is_published'
require 'support/attribute_value'

describe DevcastRepository do
  extend SpecHelper::HasAttribute
  extend SpecHelper::IsPublished

  subject { DevcastRepository }

  before do
    subject.all.each do |model|
      subject.delete(model)
    end
  end

  let(:attributes) { SpecHelper::Entities::Devcast.new.valid_attributes }
  let(:entity) { Devcast.new(attributes) }
  let(:persist) { subject.persist(entity) }

  describe ".persist" do
    it 'creates a new record' do
      persist
      subject.all.count.must_equal 1
    end

    it 'updates an existing record' do
      persist
      persist
      subject.all.count.must_equal 1
    end

    it 'saves the correct data' do
      persist
      persisted = subject.all.last
      attributes.each do |attr, value|
        persisted.send(attr).must_equal value
      end
    end

    it 'adds created at when creates a record' do
      skip
      entity.created_at.must_equal(DateTime.now)
    end

    it 'updates updated at when updates a record' do
      skip
      entity.updated_at.must_equal(DateTime.now)
    end
  end

  describe ".delete" do
    it 'removes a record' do
      persist
      subject.delete(subject.all.last)
      subject.all.count.must_equal 0
    end
  end
end
