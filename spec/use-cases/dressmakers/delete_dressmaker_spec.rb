# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Dressmakers::DeleteDressmaker, type: :service do
  subject(:delete_dressmaker) { described_class.new(id:) }

  describe '#call' do
    context 'when the dressmaker exists' do
      let(:dressmaker) { FactoryBot.create(:dressmaker) }
      let(:id) { dressmaker.id }

      it 'deletes the dressmaker' do
        delete_dressmaker.call
        expect(Dressmaker.find_by(id:).deleted_at).to be_present
      end
    end

    context 'when the dressmaker does not exist' do
      let(:dressmaker) { FactoryBot.create(:dressmaker) }
      let(:id) { 999_999 }

      it 'raises a DeleteDressmakerError' do
        expect do
          delete_dressmaker.call
        end.to raise_error(Dressmakers::DeleteDressmakerError, /#{I18n.t('dressmakers.errors.delete')}/)
      end
    end
  end
end
