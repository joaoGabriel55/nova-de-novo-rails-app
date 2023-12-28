# frozen_string_literal: true

module CustomerErrors
  class CreateError < ApplicationError
    def initialize
      super(message: I18n.t('customers.errors.create'))
    end
  end

  class UpdateError < ApplicationError
    def initialize
      super(message: I18n.t('customers.errors.update'))
    end
  end

  class NotFoundError < ApplicationError
    def initialize
      super(message: I18n.t('customers.errors.not_found'))
    end
  end

  class DeleteError < ApplicationError
    def initialize
      super(message: I18n.t('customers.errors.delete'))
    end
  end
end
