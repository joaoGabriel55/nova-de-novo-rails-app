# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'validations' do
    let(:customer) { FactoryBot.build(:customer) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:phone_number) }

    it 'is not valid without a name' do
      customer.name = nil
      expect(customer).to_not be_valid
    end

    it 'is not valid without a phone number' do
      customer.phone_number = nil
      expect(customer).to_not be_valid
    end
  end
end
