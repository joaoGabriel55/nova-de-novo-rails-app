# frozen_string_literal: true

module Customers
  class FindCustomer
    def initialize(id:)
      @customer_id = id
    end

    def call
      Customer.find(customer_id)
    rescue ActiveRecord::RecordNotFound
      raise Customers::CustomerNotFoundError
    end

    private

    attr_accessor :customer_id
  end
end
