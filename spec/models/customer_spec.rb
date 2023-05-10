# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'validations' do
    let(:customer) { FactoryBot.build(:customer) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:phone_number) }
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to accept_nested_attributes_for(:address) }

    context 'when address is invalid' do
      it 'is not valid' do
        customer.address.neighborhood = nil

        expect(customer).not_to be_valid
      end
    end
  end

  describe 'associations' do
    it { is_expected.to have_one(:address) }
  end
end
