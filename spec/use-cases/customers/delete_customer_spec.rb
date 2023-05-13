# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Customers::DeleteCustomer, type: :service do
  subject(:delete_customer) { described_class.new(id:) }

  describe '#call' do
    context 'when the customer exists' do
      let(:customer) { FactoryBot.create(:customer) }
      let(:id) { customer.id }

      it 'deletes the customer' do
        delete_customer.call
        expect(Customer.find_by(id:).deleted_at).to be_present
      end
    end

    context 'when the customer does not exist' do
      let(:customer) { FactoryBot.create(:customer) }
      let(:id) { 999_999 }

      it 'raises a DeleteCustomerError' do
        expect do
          delete_customer.call
        end.to raise_error(Customers::DeleteCustomerError, /#{I18n.t('customers.errors.delete')}/)
      end
    end
  end
end
