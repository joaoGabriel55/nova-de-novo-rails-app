# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Dressmakers::CreateDressmaker, type: :service do
  subject(:create_dressmaker) { described_class.new(dressmaker:) }

  describe '#call' do
    context 'when the dressmaker is valid' do
      let(:dressmaker) { FactoryBot.build(:dressmaker) }

      it 'creates a new dressmaker' do
        expect { create_dressmaker.call }.to change { Dressmaker.count }.by(1)
      end
    end

    context 'when the dressmaker is invalid' do
      let(:dressmaker) { FactoryBot.build(:dressmaker, end_working_date: Date.today - 1.year) }

      it 'raises a CreateDressmakerError' do
        expect do
          create_dressmaker.call
        end.to raise_error(Dressmakers::CreateDressmakerError, /#{I18n.t('dressmakers.errors.create')}/)
      end

      it 'does not create a new dressmaker' do
        expect(Dressmaker.count).to be(0)
      end
    end
  end
end
