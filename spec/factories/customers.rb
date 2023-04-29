FactoryBot.define do
  factory :customer do
    fake_phone_number = Faker::PhoneNumber.cell_phone

    name { Faker::Name.unique.name }
    email { Faker::Internet.email }
    whatsapp { fake_phone_number }
    phone_number { fake_phone_number }
  end
end
