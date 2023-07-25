# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ServiceOrders::SearchPaginateServiceOrders, type: :service do
  subject(:search_paginate_service_orders) { described_class.new(search_term:, page:, per_page:) }
  let(:page) { 1 }
  let(:per_page) { ServiceOrders::PER_PAGE }
  let(:search_term) { nil }
  let(:service_orders) { FactoryBot.create_list(:service_order, 20) }
  let(:expected_service_orders) { ServiceOrder.activated.paginate(page:, per_page:).order(created_at: :desc) }

  describe '#call' do
    context 'when has service orders in page 1' do
      it 'returns service orders' do
        result = search_paginate_service_orders.call

        expect(result[:data]).to eq(expected_service_orders)
      end
    end

    context 'when has service orders in page 2' do
      let(:page) { 2 }

      it 'returns service orders' do
        result = search_paginate_service_orders.call

        expect(result[:data]).to eq(expected_service_orders)
      end
    end

    context 'when there are no service orders in page 5' do
      let(:page) { 5 }

      it 'returns service orders' do
        expect(search_paginate_service_orders.call[:data]).to eq([])
      end
    end
  end
end
