# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ServiceOrders::DeleteServiceOrder, type: :service do
  subject(:delete_service_order) { described_class.new(id:) }

  describe '#call' do
    context 'when the service order exists' do
      let(:service_order) { FactoryBot.create(:service_order) }
      let(:id) { service_order.id }

      it 'deletes the service_order' do
        delete_service_order.call
        expect(ServiceOrder.find_by(id:).deleted_at).to be_present
      end
    end

    context 'when the service order does not exist' do
      let(:service_order) { FactoryBot.create(:service_order) }
      let(:id) { 999_999 }

      it 'raises a DeleteServiceOrderError' do
        expect do
          delete_service_order.call
        end.to raise_error(ServiceOrderErrors::DeleteError, /#{I18n.t('service_orders.errors.delete')}/)
      end
    end
  end
end
