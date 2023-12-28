# frozen_string_literal: true

class AddDeletedAtToServiceOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :service_orders, :deleted_at, :datetime
  end
end
