# frozen_string_literal: true

module Customers
  class UpdateCustomer
    def initialize(customer:)
      @customer = customer
    end

    def call
      Customer.update!(customer.attributes)
    rescue ActiveRecord::RecordInvalid
      raise Customers::UpdateCustomerError
    end

    private

    attr_accessor :customer
  end
end
