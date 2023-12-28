# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    name { 'MyString' }
    description { 'some description' }
    price { 1000 }
  end
end
