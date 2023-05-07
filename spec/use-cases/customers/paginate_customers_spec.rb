# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Customers::PaginateCustomers, type: :service do
  subject(:paginate_customers) { described_class.new(page:, per_page:) }
  let(:page) { 1 }
  let(:per_page) { 10 }
  let(:customers) { FactoryBot.create_list(:customer, 20) }
  let(:expected_customers) { Customer.paginate(page:, per_page:).order(created_at: :desc) }

  describe '#call' do
    context 'when has customers in page 1' do
      it 'returns customers' do
        result = paginate_customers.call

        expect(result[:data]).to eq(expected_customers)
      end
    end

    context 'when has customers in page 2' do
      let(:page) { 2 }

      it 'returns customers' do
        result = paginate_customers.call

        expect(result[:data]).to eq(expected_customers)
      end
    end

    context 'when there are no customers in page 3' do
      let(:page) { 3 }

      it 'returns customers' do
        expect(paginate_customers.call[:data]).to eq([])
      end
    end
  end
end
