# frozen_string_literal: true

module Customers
  class DeleteCustomer
    def initialize(id:)
      @customer_id = id
    end

    def call
      customer = Customer.find(customer_id)
      customer.update(deleted_at: Time.now)
    rescue StandardError
      raise Customers::DeleteCustomerError
    end

    private

    attr_accessor :customer_id
  end
end
