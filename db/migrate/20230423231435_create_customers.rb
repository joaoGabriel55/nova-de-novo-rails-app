# frozen_string_literal: true

class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :name, null: false
      t.string :email
      t.string :whatsapp
      t.string :phone_number, null: false

      t.timestamps
    end
  end
end
