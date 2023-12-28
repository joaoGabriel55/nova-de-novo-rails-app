# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Customers::SearchPaginateCustomers, type: :service do
  subject(:search_paginate_customers) { described_class.new(search_term:, page:, per_page:) }
  let(:page) { 1 }
  let(:per_page) { Customers::PER_PAGE }
  let(:search_term) { nil }
  let(:customers) { FactoryBot.create_list(:customer, 20) }
  let!(:searchable_customers) do
    FactoryBot.create(:customer, name: 'John Doe')
    FactoryBot.create(:customer, name: 'Jose Doe')
    FactoryBot.create(:customer, name: 'Joaque Doe')
    FactoryBot.create(:customer, name: 'Maria Lion')
    FactoryBot.create(:customer, name: 'Mary Foo')
    FactoryBot.create(:customer, name: 'Shadow', deleted_at: Time.now)
  end
  let(:expected_customers) { Customer.activated.paginate(page:, per_page:).order(created_at: :desc) }

  describe '#call' do
    context 'when has customers in page 1' do
      it 'returns customers' do
        result = search_paginate_customers.call

        expect(result[:data]).to eq(expected_customers)
      end
    end

    context 'when has customers in page 2' do
      let(:page) { 2 }

      it 'returns customers' do
        result = search_paginate_customers.call

        expect(result[:data]).to eq(expected_customers)
      end
    end

    context 'when there are no customers in page 5' do
      let(:page) { 5 }

      it 'returns customers' do
        expect(search_paginate_customers.call[:data]).to eq([])
      end
    end

    context 'when search term is equal to "Jo"' do
      let(:search_term) { 'Jo' }

      it 'returns 3 customers length' do
        expect(search_paginate_customers.call[:data].size).to eq(3)
      end
    end

    context 'when search term is equal to "ma"' do
      let(:search_term) { 'ma' }

      it 'returns 2 customers length' do
        expect(search_paginate_customers.call[:data].size).to eq(2)
      end
    end

    context 'when search term is equal to "doe"' do
      let(:search_term) { 'doe' }

      it 'returns 2 customers length' do
        expect(search_paginate_customers.call[:data].size).to eq(3)
      end
    end

    context 'when search term is equal to "Lion"' do
      let(:search_term) { 'Lion' }

      it 'returns 2 customers length' do
        expect(search_paginate_customers.call[:data].size).to eq(1)
      end
    end

    context 'when search term is equal to "Shadow"' do
      let(:search_term) { 'Shadow' }

      it 'returns 0 customers' do
        expect(search_paginate_customers.call[:data].size).to eq(0)
      end
    end
  end
end
