# frozen_string_literal: true

FactoryBot.define do
  factory :customer do
    name { Faker::Name.unique.name }
    email { Faker::Internet.email }
    whatsapp { Faker::PhoneNumber.cell_phone }
    phone_number { Faker::PhoneNumber.phone_number }
    address { nil }

    trait :invalid_attributes do
      name { nil }
      phone_number { nil }
    end

    trait :address do
      address { build(:address) }
    end
  end
end
