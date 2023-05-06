# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Customers::CreateCustomer, type: :service do
  subject(:create_customer) { described_class.new(customer:) }

  describe '#call' do
    context 'when the customer is valid' do
      let(:customer) { FactoryBot.build(:customer) }

      it 'creates a new customer' do
        expect { create_customer.call }.to change { Customer.count }.by(1)
      end
    end

    context 'when the customer is invalid' do
      let(:customer) { FactoryBot.build(:customer, :invalid_attributes) }

      it 'raises a CreateCustomerError' do
        expect do
          create_customer.call
        end.to raise_error(Customers::CreateCustomerError, /#{I18n.t('customers.errors.create')}/)
      end

      it 'does not create a new customer' do
        expect(Customer.count).to be(0)
      end
    end
  end
end
