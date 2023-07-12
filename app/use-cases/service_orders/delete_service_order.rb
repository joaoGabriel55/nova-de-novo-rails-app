# frozen_string_literal: true

module ServiceOrders
  class DeleteServiceOrder
    def initialize(id:)
      @id = id
    end

    def call
      service_order = ServiceOrder.find(id)
      service_order.update(deleted_at: Time.now)
    rescue StandardError
      raise ServiceOrderErrors::DeleteError
    end

    private

    attr_accessor :id
  end
end
