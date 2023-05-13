# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Address, type: :model do
  subject(:address) { FactoryBot.build(:address) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:street) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:state) }
    it { is_expected.to validate_presence_of(:neighborhood) }
    it { is_expected.to validate_presence_of(:number) }
    it { is_expected.to validate_length_of(:complement).is_at_most(255) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:customer) }
  end
end
