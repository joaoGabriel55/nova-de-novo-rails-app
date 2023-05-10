# frozen_string_literal: true

module Customers
  class UpdateCustomer
    def initialize(customer:, attributes:)
      @customer = customer
      @attributes = attributes
    end

    def call
      customer.update!(attributes)
    rescue ActiveRecord::RecordInvalid
      raise Customers::UpdateCustomerError
    end

    private

    attr_accessor :customer, :attributes
  end
end
