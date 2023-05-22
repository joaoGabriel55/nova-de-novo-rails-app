# frozen_string_literal: true

module ServiceOrders
  class CreateServiceOrder
    def initialize(service_order:)
      @service_order = service_order
    end

    def call
      service_order.save! unless validate_service_order!
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
      @dressmaker ||= Dressmakers::FindDressmaker.new(id: service_order.dressmaker.id).call
    end

    attr_accessor :service_order
  end
end
