FactoryBot.define do
  factory :customer do
    name { Faker::Name.unique.name }
    birth_date { "Fri, 11 Apr 2023 00:00:00 UTC +00:00" }
    start_working_date { "Fri, 11 Apr 2023 00:00:00 UTC +00:00" }
    end_working_date { "Fri, 11 Apr 2023 00:00:00 UTC +00:00" }
  end
end
