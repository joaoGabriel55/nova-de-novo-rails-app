# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Customers::UpdateCustomer, type: :service do
  subject(:update_customer) { described_class.new(customer:) }

  describe '#call' do
    context 'when the customer is valid' do
      let(:customer) { FactoryBot.create(:customer) }

      it 'updates the customer' do
        expect { update_customer.call }.to change { Customer.count }.by(1)
      end
    end

    context 'when the customer is invalid' do
      let(:customer) do
        created_customer = FactoryBot.create(:customer)
        created_customer.phone_number = nil

        created_customer
      end

      it 'raises a UpdateCustomerError' do
        expect do
          update_customer.call
        end.to raise_error(Customers::UpdateCustomerError, /#{I18n.t('customers.errors.update')}/)
        expect(Customer.count).to be(1)
      end
    end
  end
end
