# frozen_string_literal: true

module ServiceOrders
  class CreateServiceOrder
    def initialize(service_order:)
      @service_order = service_order
    end

    def call
      validate_service_order!

      service_order.save!
    rescue ActiveRecord::RecordInvalid
      raise ServiceOrders::CreateServiceOrderError
    end

    private

    def validate_service_order!
      if service_order.tasks.empty?
        raise ServiceOrders::EmptyServiceOrderTasksError
      elsif dressmaker.service_orders.length + 1 > dressmaker.max_service_quantity
        raise ServiceOrders::ExceededMaxNumberOfDressmakerOrderServicesError
      end
    end

    def dressmaker
      @dressmaker ||= service_order.dressmaker
    end

    attr_accessor :service_order
  end
end
