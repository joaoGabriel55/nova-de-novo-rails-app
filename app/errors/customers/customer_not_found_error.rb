# frozen_string_literal: true

module Customers
  class CustomerNotFoundError < ApplicationError
    def initialize
      super(message: I18n.t('customers.errors.not_found'))
    end
  end
end
