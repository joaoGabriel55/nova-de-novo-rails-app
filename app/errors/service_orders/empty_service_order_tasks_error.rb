# frozen_string_literal: true

module ServiceOrders
  class EmptyServiceOrderTasksError < ApplicationError
    def initialize
      super(message: I18n.t('service_orders.errors.empty_service_order_tasks'))
    end
  end
end
