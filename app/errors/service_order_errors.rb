# frozen_string_literal: true

module ServiceOrderErrors
  class CreateError < ApplicationError
    def initialize
      super(I18n.t('service_orders.errors.create'))
    end
  end

  class UpdateError < ApplicationError
    def initialize
      super(I18n.t('service_orders.errors.update'))
    end
  end

  class ExceededMaxNumberOfDressmakerError < ApplicationError
    def initialize
      super(I18n.t('service_orders.errors.exceeded_max_number_of_dressmaker_order_services'))
    end
  end

  class EmptyTasksError < ApplicationError
    def initialize
      super(I18n.t('service_orders.errors.empty_service_order_tasks'))
    end
  end

  class DeleteError < ApplicationError
    def initialize
      super(message: I18n.t('service_orders.errors.delete'))
    end
  end
end
