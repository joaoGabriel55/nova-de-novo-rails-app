# frozen_string_literal: true

module Customers
  class DeleteCustomerError < ApplicationError
    def initialize
      super(message: I18n.t('customers.errors.delete'))
    end
  end
end
