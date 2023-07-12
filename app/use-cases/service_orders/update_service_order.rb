# frozen_string_literal: true

module ServiceOrders
  class UpdateServiceOrder
    def initialize(service_order:, attributes:)
      @service_order = service_order
      @attributes = attributes
    end

    def call
      ServiceOrderValidation.validate_service_order!(attributes['tasks'], dressmaker)

      begin
        service_order.update!(attributes)
      rescue ActiveRecord::RecordInvalid
        raise ServiceOrderErrors::UpdateError
      end
    end

    attr_accessor :service_order, :attributes

    private

    def dressmaker
      @dressmaker ||= service_order.dressmaker
    end
  end
end
