# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Customers::PaginateCustomers, type: :service do
  subject(:paginate_customers) { described_class.new(page:, per_page:) }
  let(:page) { 1 }
  let(:per_page) { 10 }
  let(:customers) { FactoryBot.create_list(:customer, 20) }

  describe '#call' do
    context 'when has customers in page 1' do
      it 'returns customers' do
        expect(paginate_customers.call).to eq(customers[0..9])
      end
    end

    context 'when has customers in page 2' do
      let(:page) { 2 }

      it 'returns customers' do
        expect(paginate_customers.call).to eq(customers[10..19])
      end
    end

    context 'when there are no customers in page 3' do
      let(:page) { 3 }

      it 'returns customers' do
        expect(paginate_customers.call).to eq([])
      end
    end
  end
end
