# frozen_string_literal: true

require 'rails_helper'

def valid_entry_and_delivery_date(service_order)
  service_order.entry_date = Date.today + 1.day
  service_order.delivery_date = Date.today + 2.day
end

def invalid_entry_and_delivery_date(service_order)
  service_order.entry_date = Date.today + 2.day
  service_order.delivery_date = Date.today + 1.day
end

RSpec.describe ServiceOrder, type: :model do
  subject(:service_order) { FactoryBot.build(:service_order) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:delivery_period) }
    it { is_expected.to validate_presence_of(:status_service) }
    it { is_expected.to validate_presence_of(:entry_date) }
    it { is_expected.to validate_presence_of(:delivery_date) }

    context 'entry_date is present' do
      it 'is valid before delivery_date' do
        valid_entry_and_delivery_date(service_order)

        expect(service_order).to be_valid
      end

      it 'is not valid after delivery_date' do
        invalid_entry_and_delivery_date(service_order)

        expect(service_order).not_to be_valid
        expect(service_order.errors[:entry_date]).to include(
          I18n.t('activerecord.errors.models.service_order.attributes.entry_date.less_than_or_equal_to')
        )
      end
    end

    context 'delivery_date is present' do
      it 'is valid after entry_date' do
        valid_entry_and_delivery_date(service_order)

        expect(service_order).to be_valid
      end

      it 'is not valid before entry_date' do
        invalid_entry_and_delivery_date(service_order)

        expect(service_order).not_to be_valid
        expect(service_order.errors[:delivery_date]).to include(
          I18n.t('activerecord.errors.models.service_order.attributes.delivery_date.greater_than_or_equal_to')
        )
      end
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:customer) }
    it { is_expected.to belong_to(:dressmaker) }
    it { is_expected.to have_many(:tasks) }
  end
end
