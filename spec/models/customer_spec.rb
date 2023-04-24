require "rails_helper"

RSpec.describe Customer, type: :model do
  describe "validations" do
    let(:customer) { FactoryBot.build(:customer) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:birth_date) }
    it { is_expected.to validate_presence_of(:start_working_date) }

    it "validates that the end date is after the start date" do
      customer.end_working_date = customer.start_working_date - 1.day

      puts customer.end_working_date

      expect(customer).to be_invalid
      expect(customer.errors[:end_working_date]).to include(
        "must be after start date"
      )
    end
  end
end
