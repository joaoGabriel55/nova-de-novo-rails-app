# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ServiceOrders::CreateServiceOrder, type: :service do
  subject(:create_service_order) { described_class.new(service_order:) }
  let!(:dressmaker) { FactoryBot.create(:dressmaker, name: 'Zuzu', max_service_quantity: 3) }

  describe '#call' do
    context 'when the service order is valid' do
      let(:service_order) { FactoryBot.build(:service_order, dressmaker:) }

      it 'creates a new service order' do
        expect { create_service_order.call }.to change { ServiceOrder.count }.by(1)
      end
    end

    context 'when the service order tasks are empty' do
      let(:service_order) do
        result = FactoryBot.build(:service_order, dressmaker:)
        result.tasks = []

        result
      end

      it 'raises ServiceOrders::EmptyServiceOrderTasksError' do
        expect do
          create_service_order.call
        end.to raise_error(ServiceOrders::EmptyServiceOrderTasksError,
                           /#{I18n.t('service_orders.errors.empty_service_order_tasks')}/)
      end
    end

    context 'when the service order dressmaker exceeds the max service quantity' do
      let!(:service_orders_created) do
        FactoryBot.create_list(:service_order, 3, dressmaker:)
      end
      let(:service_order) { FactoryBot.build(:service_order, dressmaker:) }

      it 'raises ServiceOrders::ExceededMaxNumberOfDressmakerOrderServicesError' do
        expect do
          create_service_order.call
        end.to raise_error(ServiceOrders::ExceededMaxNumberOfDressmakerOrderServicesError,
                           /#{I18n.t('service_orders.errors.exceeded_max_number_of_dressmaker_order_services')}/)
      end
    end

    context 'when the service order is invalid' do
      let(:service_order) { FactoryBot.build(:service_order, entry_date: nil) }

      it 'raises ServiceOrders::CreateServiceOrderError' do
        expect do
          create_service_order.call
        end.to raise_error(ServiceOrders::CreateServiceOrderError, /#{I18n.t('service_orders.errors.create')}/)
      end
    end
  end
end
