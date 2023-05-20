# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_230_513_230_409) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'addresses', force: :cascade do |t|
    t.string 'street', null: false
    t.string 'city', null: false
    t.string 'state', null: false
    t.string 'neighborhood', null: false
    t.integer 'number', null: false
    t.string 'zip_code'
    t.string 'complement', limit: 255
    t.bigint 'customer_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['customer_id'], name: 'index_addresses_on_customer_id'
  end

  create_table 'customers', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'email'
    t.string 'whatsapp'
    t.string 'phone_number', null: false
    t.datetime 'deleted_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'dressmakers', force: :cascade do |t|
    t.string 'name', null: false
    t.integer 'max_service_quantity', null: false
    t.date 'start_working_date', null: false
    t.date 'end_working_date'
    t.datetime 'deleted_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'addresses', 'customers'
end
