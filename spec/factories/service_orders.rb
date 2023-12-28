# frozen_string_literal: true

FactoryBot.define do
  factory :service_order do
    entry_date { '21/02/2022' }
    delivery_date { '23/02/2022' }
    delivery_period { 1 }
    status_service { 1 }
    paid { false }
    customer
    dressmaker

    after(:build) do |service_order, _evaluator|
      tasks = [
        FactoryBot.build(:task, name: 'Task1', service_order:),
        FactoryBot.build(:task, name: 'Task2', service_order:),
        FactoryBot.build(:task, name: 'Task3', service_order:)
      ]

      service_order.dressmaker.save!
      service_order.customer.save!
      service_order.tasks = tasks
    end
  end
end
