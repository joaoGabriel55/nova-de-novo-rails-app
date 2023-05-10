# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Customers::UpdateCustomer, type: :service do
  subject(:update_customer) { described_class.new(customer:, attributes:) }
  let(:customer) { FactoryBot.create(:customer) }

  describe '#call' do
    context 'when the customer attributes are valid' do
      let(:attributes) { { name: 'John Updated' } }

      it 'updates the customer' do
        expect { update_customer.call }.to change { Customer.count }.by(1)
      end
    end

    context 'when the customer attributes are invalid' do
      let(:attributes) { { name: nil } }

      it 'raises a UpdateCustomerError' do
        expect do
          update_customer.call
        end.to raise_error(Customers::UpdateCustomerError, /#{I18n.t('customers.errors.update')}/)
        expect(Customer.count).to be(1)
      end
    end
  end
end
