# frozen_string_literal: true

class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :name, null: false
      t.datetime :email
      t.datetime :whatsapp
      t.datetime :phone_number, null: false

      t.timestamps
    end
  end
end
