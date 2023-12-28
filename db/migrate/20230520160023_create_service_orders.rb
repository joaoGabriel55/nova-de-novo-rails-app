# frozen_string_literal: true

class CreateServiceOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :service_orders do |t|
      t.date :entry_date, null: false
      t.date :delivery_date, null: false
      t.integer :delivery_period, null: false, default: 0
      t.integer :status_service, null: false, default: 0
      t.boolean :paid, default: false

      t.references :customer, null: false, foreign_key: true
      t.references :dressmaker, null: false, foreign_key: true

      t.timestamps
    end
  end
end
