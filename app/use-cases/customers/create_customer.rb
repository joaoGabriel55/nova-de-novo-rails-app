# frozen_string_literal: true

module Customers
  class CreateCustomer
    def initialize(customer:)
      @customer = customer
    end

    def call
      customer.save!
    rescue ActiveRecord::RecordInvalid
      raise Customers::CreateCustomerError
    end

    private

    attr_accessor :customer
  end
end
