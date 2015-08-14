require 'spec_helper'

RSpec.describe DevcastRepository do
  subject {described_class}

  describe "creating a record" do

    let(:attributes) { SpecHelper::Entities::Devcast.new.valid_attributes }
    let(:entity) { Devcast.new(attributes) }
    let(:create) { subject.create(entity) }

    it "sets created_at as current date" do
      create
    end
  end
end
