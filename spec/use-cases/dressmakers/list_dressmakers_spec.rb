# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Dressmakers::ListDressmakers, type: :service do
  subject(:list_dressmakers) { described_class.new }

  describe '#call' do
    context 'when has dressmakers' do
      let!(:dressmakers) do
        FactoryBot.create(:dressmaker, name: 'Zuzu')
        FactoryBot.create(:dressmaker, name: 'Leon')
        FactoryBot.create(:dressmaker, name: 'Lucy')
      end

      it 'returns dressmakers' do
        result = list_dressmakers.call

        expect(result[:count]).to eq(3)
        expect(result[:dressmakers]).to eq(Dressmaker.all.order(created_at: :desc))
      end
    end

    context 'when has no dressmakers' do
      it 'returns empty dressmakers' do
        result = list_dressmakers.call

        expect(result[:count]).to eq(0)
        expect(result[:dressmakers]).to eq([])
      end
    end
  end
end
