# frozen_string_literal: true

module Customers
  class CreateCustomerError < ApplicationError
    def initialize
      super(message: I18n.t('customers.errors.create'))
    end
  end
end
