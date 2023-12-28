# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.text :description
      t.integer :price, null: false

      t.references :service_order, null: false, foreign_key: true
    end
  end
end
