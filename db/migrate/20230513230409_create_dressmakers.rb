# frozen_string_literal: true

class CreateDressmakers < ActiveRecord::Migration[7.0]
  def change
    create_table :dressmakers do |t|
      t.string :name, null: false
      t.integer :max_service_quantity, null: false
      t.datetime :start_working_date, null: false
      t.datetime :end_working_date

      t.timestamps
    end
  end
end
