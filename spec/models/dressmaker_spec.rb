# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Dressmaker, type: :model do
  describe 'validations' do
    let(:dressmaker) { FactoryBot.build(:dressmaker) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:max_service_quantity) }
    it { is_expected.to validate_presence_of(:start_working_date) }

    context 'end_working_date is present' do
      it 'is valid after start_working_date' do
        dressmaker.end_working_date = Date.today + 1.day

        expect(dressmaker).to be_valid
      end

      it 'is not valid before start_working_date' do
        dressmaker.end_working_date = Date.today - 1.year

        expect(dressmaker).not_to be_valid
      end
    end
  end
end
