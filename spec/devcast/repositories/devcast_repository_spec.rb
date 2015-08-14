require 'spec_helper'

RSpec.describe DevcastRepository do
  subject {described_class}

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
      expect(subject.all.count).to be(1)
    end

    it 'updates an existing record' do
      persist
      persist
      expect(subject.all.count).to be(1)
    end

    it 'saves the correct data' do
      persist
      persisted = subject.all.last
      # expect(persisted).to eq(entity)
      attributes.each do |attr, value|
        expect(persisted.send(attr)).to eq(value)
      end
    end

    xit 'adds created at when creates a record' do
      expect(entity.created_at).to eq(DateTime.now)
    end

    xit 'updates updated at when updates a record' do
      expect(entity.created_at).to eq(DateTime.now)
    end
  end

  describe ".delete" do
    it 'removes a record' do
      persist
      subject.delete(subject.all.last)
      expect(subject.all.count).to be(0)
    end
  end
end
