# frozen_string_literal: true

module ServiceOrders
  class CreateServiceOrderError < ApplicationError
    def initialize
      super(message: I18n.t('service_orders.errors.create'))
    end
  end
end
