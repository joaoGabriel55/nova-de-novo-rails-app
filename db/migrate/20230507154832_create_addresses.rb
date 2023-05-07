# frozen_string_literal: true

class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :street, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :neighborhood, null: false
      t.integer :number, null: false
      t.string :zip_code
      t.string :complement, limit: 255
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
