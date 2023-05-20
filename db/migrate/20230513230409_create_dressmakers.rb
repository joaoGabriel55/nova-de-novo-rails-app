# frozen_string_literal: true

class CreateDressmakers < ActiveRecord::Migration[7.0]
  def change
    create_table :dressmakers do |t|
      t.string :name, null: false
      t.integer :max_service_quantity, null: false
      t.date :start_working_date, null: false
      t.date :end_working_date
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
