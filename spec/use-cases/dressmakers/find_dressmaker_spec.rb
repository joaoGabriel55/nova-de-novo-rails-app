# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Dressmakers::FindDressmaker, type: :service do
  subject(:find_customer) { described_class.new(id:) }

  describe '#call' do
    context 'when the dressmaker exists' do
      let(:dressmaker) { FactoryBot.create(:dressmaker) }
      let(:id) { dressmaker.id }

      it 'returns the dressmaker' do
        expect(find_customer.call).to eq(dressmaker)
      end
    end

    context 'when the dressmaker does not exist' do
      let(:dressmaker) { FactoryBot.create(:dressmaker) }
      let(:id) { 999_999 }

      it 'raises a DressmakerNotFoundError' do
        expect do
          find_customer.call
        end.to raise_error(Dressmakers::DressmakerNotFoundError, /#{I18n.t('dressmakers.errors.not_found')}/)
      end
    end
  end
end
