# frozen_string_literal: true

module ServiceOrders
  class ExceededMaxNumberOfDressmakerOrderServicesError < ApplicationError
    def initialize
      super(message: I18n.t('service_orders.errors.exceeded_max_number_of_dressmaker_order_services'))
    end
  end
end
