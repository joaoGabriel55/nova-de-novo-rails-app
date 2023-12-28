# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TaskType, type: :model do
  let(:task_type) { FactoryBot.build(:task_type) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
