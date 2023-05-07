# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    street { 'Rua fake' }
    city { 'Natal' }
    state { 'RN' }
    zip_code { '59152-000' }
    number { '125' }
    complement { 'Legal' }
    customer
  end
end
