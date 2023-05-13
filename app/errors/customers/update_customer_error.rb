# frozen_string_literal: true

module Customers
  class UpdateCustomerError < ApplicationError
    def initialize
      super(message: I18n.t('customers.errors.update'))
    end
  end
end
