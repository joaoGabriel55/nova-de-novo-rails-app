# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Customers::FindCustomer, type: :service do
  subject(:find_customer) { described_class.new(id:) }

  describe '#call' do
    context 'when the customer exists' do
      let(:customer) { FactoryBot.create(:customer) }
      let(:id) { customer.id }

      it 'returns the customer' do
        expect(find_customer.call).to eq(customer)
      end
    end

    context 'when the customer does not exist' do
      let(:customer) { FactoryBot.create(:customer) }
      let(:id) { 999_999 }

      it 'raises a CustomerNotFoundError' do
        expect do
          find_customer.call
        end.to raise_error(Customers::CustomerNotFoundError, /#{I18n.t('customers.errors.not_found')}/)
      end
    end
  end
end
