# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Dressmakers::ListDressmakers, type: :service do
  subject(:list_dressmakers) { described_class.new(activated: activated_dressmakers) }
  let(:dressmakers_not_deleted) { Dressmaker.where(deleted_at: nil) }

  describe '#call' do
    context 'when has activated dressmakers' do
      let!(:dressmakers) do
        FactoryBot.create(:dressmaker, name: 'Zuzu')
        FactoryBot.create(:dressmaker, name: 'Leon')
        FactoryBot.create(:dressmaker, name: 'Lucy', end_working_date: Time.zone.today)
        FactoryBot.create(:dressmaker, name: 'Sam', deleted_at: Time.zone.today)
      end
      let(:activated_dressmakers) { true }

      it 'returns dressmakers' do
        result = list_dressmakers.call

        expect(result[:count]).to eq(2)
        expect(result[:dressmakers]).to eq(dressmakers_not_deleted.activated.order(created_at: :desc))
      end
    end

    context 'when has no activated dressmakers' do
      let(:activated_dressmakers) { true }

      it 'returns empty dressmakers' do
        result = list_dressmakers.call

        expect(result[:count]).to eq(0)
        expect(result[:dressmakers]).to eq([])
      end
    end

    context 'when has fired dressmakers' do
      let!(:dressmakers) do
        FactoryBot.create(:dressmaker, name: 'Zuzu')
        FactoryBot.create(:dressmaker, name: 'Leon')
        FactoryBot.create(:dressmaker, name: 'Lucy', end_working_date: Time.zone.today)
      end
      let(:activated_dressmakers) { false }

      it 'returns dressmakers' do
        result = list_dressmakers.call

        expect(result[:count]).to eq(1)
        expect(result[:dressmakers]).to eq(dressmakers_not_deleted.fired.order(created_at: :desc))
      end
    end

    context 'when has no fired dressmakers' do
      let(:activated_dressmakers) { false }

      it 'returns empty dressmakers' do
        result = list_dressmakers.call

        expect(result[:count]).to eq(0)
        expect(result[:dressmakers]).to eq([])
      end
    end
  end
end
