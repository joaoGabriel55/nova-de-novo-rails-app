class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :name, null: false
      t.datetime :birth_date, null: false
      t.datetime :start_working_date, null: false
      t.datetime :end_working_date

      t.timestamps
    end
  end
end
