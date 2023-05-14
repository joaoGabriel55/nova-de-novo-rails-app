# frozen_string_literal: true

FactoryBot.define do
  factory :dressmaker do
    name { Faker::Name.name }
    max_service_quantity { Faker::Number.between(from: 1, to: 10) }
    start_working_date { Faker::Date.between(from: 1.year.ago, to: Date.today) }
    end_working_date { nil }
  end
end
