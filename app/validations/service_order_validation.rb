# frozen_string_literal: true

module ServiceOrderValidation
  def self.validate_service_order!(tasks, dressmaker)
    if tasks&.empty?
      raise ServiceOrderErrors::EmptyTasksError
    elsif dressmaker.service_orders.length + 1 > dressmaker.max_service_quantity
      raise ServiceOrderErrors::ExceededMaxNumberOfDressmakerError
    end
  end
end
