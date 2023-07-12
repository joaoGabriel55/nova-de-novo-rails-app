# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ServiceOrders::UpdateServiceOrder, type: :service do
  subject(:update_service_order) { described_class.new(service_order:, attributes:) }
  let!(:dressmaker) { FactoryBot.create(:dressmaker, name: 'Zuzu', max_service_quantity: 3) }
  let(:service_order) { FactoryBot.create(:service_order, dressmaker:) }

  describe '#call' do
    context 'when the service order is valid' do
      let(:attributes) { { paid: true } }

      it 'updates the service order' do
        update_service_order.call

        expect(ServiceOrder.count).to eq(1)
      end
    end

    context 'when the service order tasks are empty' do
      let(:attributes) { service_order.attributes.merge('tasks' => []) }

      it 'raises ServiceOrderErrors::EmptyTasksError' do
        expect do
          update_service_order.call
        end.to raise_error(ServiceOrderErrors::EmptyTasksError,
                           /#{I18n.t('service_orders.errors.empty_service_order_tasks')}/)
      end
    end

    context 'when the service order is invalid' do
      let(:attributes) { { entry_date: nil } }

      it 'raises ServiceOrderErrors::UpdateError' do
        expect do
          update_service_order.call
        end.to raise_error(ServiceOrderErrors::UpdateError, /#{I18n.t('service_orders.errors.update')}/)
      end
    end
  end
end
