# frozen_string_literal: true

module ServiceOrders
  class CreateServiceOrder
    def initialize(service_order:)
      @service_order = service_order
    end

    def call
      ServiceOrderValidation.validate_service_order!(service_order.tasks, dressmaker)

      service_order.save!
    rescue ActiveRecord::RecordInvalid
      raise ServiceOrderErrors::CreateError
    end

    attr_accessor :service_order

    def dressmaker
      @dressmaker ||= service_order.dressmaker
    end
  end
end
