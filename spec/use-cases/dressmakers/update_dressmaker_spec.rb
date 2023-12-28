# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Dressmakers::UpdateDressmaker, type: :service do
  subject(:update_dressmaker) { described_class.new(dressmaker:, attributes:) }
  let(:dressmaker) { FactoryBot.create(:dressmaker) }

  describe '#call' do
    context 'when the dressmaker attributes are valid' do
      let(:attributes) { { name: 'John Updated' } }

      it 'updates the dressmaker' do
        expect { update_dressmaker.call }.to change { Dressmaker.count }.by(1)
        expect(Dressmaker.last.name).to eq('John Updated')
      end
    end

    context 'when the dressmaker attributes are invalid' do
      let(:attributes) { { name: nil } }

      it 'raises a UpdateDressmakerError' do
        expect do
          update_dressmaker.call
        end.to raise_error(DressmakerErrors::UpdateError, /#{I18n.t('dressmakers.errors.update')}/)
        expect(Dressmaker.count).to be(1)
      end
    end
  end
end
