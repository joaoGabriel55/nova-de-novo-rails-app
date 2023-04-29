FactoryBot.define do
  factory :customer do
    name { Faker::Name.unique.name }
    email { Faker::Internet.email }
    whatsapp { Faker::PhoneNumber.cell_phone }
    phone_number { Faker::PhoneNumber.cell_phone }
  end
end
